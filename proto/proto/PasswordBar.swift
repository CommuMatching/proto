//
//  PasswordBar.swift
//  proto
//
//  Created by 玉川悠真 on 2023/04/15.
//

import SwiftUI

struct PasswordBar: View {
    @FocusState  var focusText: Bool
    @FocusState  var focusSecure: Bool
    @State  var show: Bool = false
    @Binding  var password: String

    var body: some View {
        HStack {
            ZStack(alignment: .trailing) {
                    
                TextField("パスワード", text: $password)
                    .focused($focusText)
                    .opacity(show ? 1 : 0)
                    
                SecureField("パスワード", text: $password)
                    .focused($focusSecure)
                    .opacity(show ? 0 : 1)
                    
                Button(action: {
                    show.toggle()
                    if show {
                        focusText = true
                    } else {
                        focusSecure = true
                    }
                }, label: {
                    Image(systemName: self.show ? "eye.slash.fill" : "eye.fill")
                        .padding()
                        .font(.system(size: 15))
                            
                })
            }.padding().textFieldStyle(.roundedBorder)
        }
    }
}

struct PasswordBar_Previews: PreviewProvider {
    static var previews: some View {
        PasswordBar(password: .constant(""))
    }
}
