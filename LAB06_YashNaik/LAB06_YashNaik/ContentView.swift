//
//  ContentView.swift
//  LAB06_YashNaik
//
//  Created by Yash Vipul Naik on 2025-07-25.
//

import SwiftUI
import FirebaseStorage
import PhotosUI

struct ContentView: View {
  @State private var selectedImage: UIImage?
  @State private var imageURL: URL?
  @State private var imageSelection: PhotosPickerItem?

  let fileName = "lab_image_demo"

  var body: some View {
    VStack(spacing: 20) {
      if let url = imageURL {
        AsyncImage(url: url) { image in
          image.resizable().scaledToFit()
        } placeholder: {
          ProgressView()
        }
        .frame(width: 250, height: 250)
      } else {
        Text("No image uploaded")
      }

      PhotosPicker("Select Image", selection: $imageSelection, matching: .images)
        .onChange(of: imageSelection) { newItem in
          Task {
            if let data = try? await newItem?.loadTransferable(type: Data.self),
              let uiImage = UIImage(data: data) {
              selectedImage = uiImage
            }
          }
        }

      if let img = selectedImage,
        let _ = FireAuthHelper.getInstance().user?.uid {
        Button("Upload Image") {
          uploadImage(img)
        }
        .buttonStyle(.borderedProminent)
      } else {
        Text("Please wait... logging in")
          .foregroundColor(.gray)
      }

      Button("Delete Image") {
        deleteImage()
      }
      .foregroundColor(.red)
    }
    .padding()
    .onAppear {
      let auth = FireAuthHelper.getInstance()
      auth.signInAnonymously()
       
      DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        print("User UID: \(auth.user?.uid ?? "nil")")
      }
    }
  }

  // MARK: - Firebase Upload
  func uploadImage(_ image: UIImage) {
    guard let uid = FireAuthHelper.getInstance().user?.uid else {
      print("Cannot upload: user not authenticated yet.")
      return
    }

    guard let data = image.jpegData(compressionQuality: 0.8) else { return }

    let storageRef = Storage.storage().reference().child("images/\(uid)/\(fileName).jpg")

    storageRef.putData(data, metadata: nil) { _, error in
      if let error = error {
        print("Upload error: \(error)")
        return
      }
      storageRef.downloadURL { url, error in
        if let error = error {
          print("Download URL error: \(error)")
          return
        }
        imageURL = url
      }
    }
  }

  // MARK: - Firebase Delete
  func deleteImage() {
    guard let uid = FireAuthHelper.getInstance().user?.uid else {
      print("Cannot delete: user not authenticated.")
      return
    }

    let ref = Storage.storage().reference().child("images/\(uid)/\(fileName).jpg")

    ref.delete { error in
      if let error = error {
        print("Delete error: \(error)")
      } else {
        print("Image deleted")
        imageURL = nil
        selectedImage = nil
      }
       
    }
  }
}
