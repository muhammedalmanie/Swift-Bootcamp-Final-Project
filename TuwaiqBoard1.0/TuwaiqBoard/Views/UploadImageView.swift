//  LoginView.swift
//  TuwaiqBoard
//
//  Created by Muhammed on 8/30/23.
//

import SwiftUI
import FirebaseStorage
import FirebaseFirestore
import Firebase


struct UploadImageView: View {
    @State private var selectedImage: UIImage?
    @State private var isImagePickerPresented = false
    
    private let storage = Storage.storage().reference()
    private let db = Storage.storage().reference()
    
    var body: some View {
        VStack {
            if let image = selectedImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            }
            
            Button("upload Image") {
                isImagePickerPresented.toggle()
            }
            .padding()
            .sheet(isPresented: $isImagePickerPresented) {
                ImagePicker(image: $selectedImage)
            }
            
      
                Button("Upload", action: uploadImage)
                    .padding()
    
        }
    }
    
    func uploadImage() {
        guard let image = selectedImage else { return }
        
        let imageName = "\(UUID().uuidString).png"
        let imageRef = storage.child(imageName)
        
        if let imageData = image.pngData() {
                imageRef.putData(imageData, metadata: nil) { metadata, error in
                if let error = error {
                    print("error\(error)")
                    
                } else {
                    print("image uploaded successfully")
                }
            }
        }
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    @Environment(\.presentationMode) private var presentationMode
    @Binding var image: UIImage?
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = context.coordinator
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.image = uiImage
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}

struct UploadImageView_Previews: PreviewProvider {
    static var previews: some View {
        UploadImageView()
    }
}
