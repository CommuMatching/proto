//
//  icon.swift
//  proto
//
//  Created by 玉川悠真 on 2023/04/30.
//

import SwiftUI

struct icon: View {
    @ObservedObject var profile = UserProfile()
    
    @State var source:UIImagePickerController.SourceType = .photoLibrary
    @State var isImagePicker = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing:0) {
                VStack{
                    Menu {
                        Button("アップロード", action: {
                            self.source = .photoLibrary
                            self.isImagePicker.toggle()
                        })
                        Button("写真を撮る", action: {
                            self.source = .camera
                            self.isImagePicker.toggle()
                        })
                        Button("削除", action: {
                            self.profile.Iconimage = .init(capacity:0)
                        })
                    } label: {
                        if (self.profile.Iconimage != .init(capacity:0)) {
                            Image(uiImage: UIImage(data: self.profile.Iconimage)!)
                                .resizable()
                                .frame(width: 74, height: 74)
                                .padding(2)
                                .cornerRadius(75)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 75).stroke(Color.gray, lineWidth: 4)
                                )
                                .shadow(radius: 20)
                        } else {
                            Image(systemName: "person.fill")
                                .resizable()
                                .frame(width: 74, height: 74)
                                .padding(2)
                                .cornerRadius(75)
                                .foregroundColor(Color.black)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 75).stroke(Color.gray, lineWidth: 4)
                                )
                                .shadow(radius: 20)
                        }
                    }
                }.navigationDestination(isPresented: $isImagePicker, destination: {
                    Imagepicker(show: $isImagePicker, image: $profile.Iconimage, sourceType: source)
                })
            }
        }
    }
}

struct icon_Previews: PreviewProvider {
    static var previews: some View {
        icon()
    }
}
