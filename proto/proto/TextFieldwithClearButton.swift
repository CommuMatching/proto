//
//  TextFieldwithClearButton.swift
//  proto
//
//  Created by 玉川悠真 on 2023/04/29.
//

import SwiftUI

struct TextFieldwithClearButton: View {
    var placeholder: String
    @Binding var text: String
    
    var body: some View {
        HStack {
            ZStack(alignment: .trailing) {
                TextField(placeholder, text: $text)
                //clearbutton
                Button(
                    action: {
                        self.text = ""
                    }
                ){
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.blue)
                        .opacity(0.7)
                }
            }
        }
    }
}

struct TextFieldwithClearButton_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldwithClearButton(placeholder: "", text: .constant(""))
    }
}
