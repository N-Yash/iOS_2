//
//  ProfileScreen.swift
//  Week5
//
//  Created by Yash Vipul Naik on 2025-06-06.
//

import SwiftUI
import PhotosUI

struct ProfileScreen: View {
    
    @State private var email : String = "admin@example.com"
    @State private var name : String = "example"
    @State private var profileImage : UIImage?
    @State private var showSheet : Bool = false
    @State private var permissionGranted : Bool = false
    @State private var showPicker : Bool = false
    @State private var isUsingCamera : Bool = false
    
    
    @EnvironmentObject var user : User
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        NavigationStack{
            VStack{
                Form{
                    
                    Button(action:{
                        if(self.permissionGranted){
                            self.showSheet = true
                        } else {
                            self.requestCameraPermission()
                        }
                    }){
                        Image(uiImage: profileImage ?? UIImage(systemName: "person")!)
                            .resizable()
                            .frame(width: 300, height: 300, alignment: .center)
                    } // button
                    .actionSheet(isPresented: self.$showSheet) {
                        ActionSheet(title: Text("Choose Picture"),
                                    message: Text("Select Profile Picture"),
                                    buttons: [
                                        .default(Text("Choose from Photo Library")){
                                            //check if the photo libaray source is available
                                            guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else {
                                                print(#function, "Photo Library isn't available on the device")
                                                return
                                            }
                                            self.isUsingCamera = false
                                            self.showPicker = true
                                        },
                                        .default(Text("Click a new pic from Camera")){
                                            //check if the
                                            guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
                                                print(#function, "Camera isn't available on the device")
                                                return
                                            }
                                            self.isUsingCamera = true
                                            self.showPicker = true
                                        },
                                        .cancel()
                                    ]
                        )// Action sheet
                    }// action sheet
                    
                    Section("Name"){
                        TextField("Enter Name", text: $name)
                    }
                    Section("Email"){
                        TextField("Enter Email", text: $email)
                    }
                    
                    Button("Update"){
                        if (!email.isEmpty && !name.isEmpty){
                            
                            user.email = email
                            user.name = name
                            
                            dismiss()
                        }
                    }
                }
                .navigationTitle("\(user.name)'s Profile")
                .navigationBarTitleDisplayMode(.inline)
                .onAppear(){
                    email = user.email
                    name = user.name
                    self.checkCamersPermission()
                }
                .fullScreenCover(isPresented: $showPicker){
                    if(isUsingCamera){
                        //open camera picker
                        CameraPicker(selectedImage: $profileImage)
                    } else {
                        LibraryPicker(selectedImage: $profileImage)
                    }
                }
            }
        }
    } // body
    
    private func checkCamersPermission(){
        
        switch PHPhotoLibrary.authorizationStatus(){
        case .authorized:
            self.permissionGranted = true
        case .notDetermined, .denied:
            self.permissionGranted = false
            self.requestCameraPermission()
        case .limited, .restricted:
            return
        @unknown default:
            return
        } //switch
        
    } //checkCamersPermission
    
    private func requestCameraPermission(){
        PHPhotoLibrary.requestAuthorization{ status in
            
            switch status{
            case .authorized:
                self.permissionGranted = true
            case .notDetermined, .denied:
                self.permissionGranted = false
            case .limited, .restricted:
                //inform user or request full access based on requirements
                return
            @unknown default:
                return
            }//switch
        }//requestAuthorization
    } //requestCameraPermission
}

#Preview {
    ProfileScreen()
        .environmentObject(User(name: "Example", email: "sample@apple.com", history: "No History", allergy: "Dairy"))
}
