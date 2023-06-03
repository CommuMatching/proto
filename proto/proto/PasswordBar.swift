//
//  PasswordBar.swift
//  proto
//
//  Created by 玉川悠真 on 2023/04/15.
//

import SwiftUI

struct PasswordBar: View {
    @State var show: Bool = false
    @Binding var password: String

    var body: some View {
        HStack {
            ZStack(alignment: .trailing) {
                    
                TextField("", text: $password)
                    .opacity(show ? 1 : 0)
                    .textInputAutocapitalization(.never)
                    
                SecureField("", text: $password)
                    .opacity(show ? 0 : 1)
                    .textInputAutocapitalization(.never)
                    
                Button(action: {
                    show.toggle()
                }, label: {
                    Image(systemName: self.show ? "eye.slash.fill" : "eye.fill")
                        .font(.system(size: 15))
                        .opacity(0.7)
                })
            }
        }
    }
}

struct PasswordBar_Previews: PreviewProvider {
    static var previews: some View {
        PasswordBar(password: .constant(""))
    }
}
