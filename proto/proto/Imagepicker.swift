//
//  Imagepicker.swift
//  proto
//
//  Created by 玉川悠真 on 2023/04/30.
//

import SwiftUI

struct Imagepicker : UIViewControllerRepresentable {
    
    @Binding var show: Bool
    @Binding var image: Data
    var sourceType: UIImagePickerController.SourceType
 
    func makeCoordinator() -> Imagepicker.Coodinator {
        return Imagepicker.Coordinator(parent: self)
    }
      
    func makeUIViewController(context: UIViewControllerRepresentableContext<Imagepicker>) -> UIImagePickerController {
        
        let controller = UIImagePickerController()
        controller.sourceType = sourceType
        controller.delegate = context.coordinator
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<Imagepicker>) {
    }
    
    class Coodinator: NSObject,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
        
        var parent : Imagepicker
        
        init(parent : Imagepicker){
            self.parent = parent
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            self.parent.show.toggle()
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            let image = info[.originalImage] as! UIImage
            let data = image.pngData()
            self.parent.image = data!
            self.parent.show.toggle()
        }
    }
}
