//
//  CameraPicker.swift
//  Week5
//
//  Created by Yash Vipul Naik on 2025-06-13.
//

import Foundation
import PhotosUI
import SwiftUI

struct CameraPicker : UIViewControllerRepresentable{
    @Binding var selectedImage : UIImage?
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<CameraPicker>) -> some UIViewController {
        
        //create a photo library picker
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.delegate = context.coordinator
        return imagePicker
        
    }//makeUIViewController
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        //update UI if required
        
    }//updateUIViewController
    
    func makeCoordinator() -> CameraPicker.Coordinator {
        return Coordinator(parent: self)
    }//makeCoordinator
    
    class Coordinator : NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
        
        var parent : CameraPicker
        
        init(parent: CameraPicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
                
                self.parent.selectedImage = image
                picker.dismiss(animated: true)
                
            }else{
                print(#function, "Image cannot be obtained from original image")
                return
            }
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true)
        }
        
        
    }//Coordinator
    
}
