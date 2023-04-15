//
//  Userauth.swift
//  proto
//
//  Created by 玉川悠真 on 2023/04/13.
//

import SwiftUI
import FirebaseAuth

struct Userauth: View {
    @State  var name:String = ""
    @State  var email:String = ""
    @State  var password:String = ""
        
    var body: some View {
        VStack{
            TextField("name", text: $name).padding().textFieldStyle(.roundedBorder)
            TextField("email address", text: $email).padding().textFieldStyle(.roundedBorder)
            PasswordBar(password: $password).padding().textFieldStyle(.roundedBorder)
                
            Button(action: {
                Auth.auth().createUser(withEmail: self.email, password: self.password) { authResult, error in
                if let user = authResult?.user {
                    let request = user.createProfileChangeRequest()
                    request.displayName = name
                    request.commitChanges { error in
                        if error == nil {
                            user.sendEmailVerification() { error in
                                if error == nil {
                                    print("仮登録画面へ")
                                }
                            }
                        }
                    }
                }
            }
            }, label: {
                Text("新規登録")
            }).padding()
        }
    }
}

struct Userauth_Previews: PreviewProvider {
    static var previews: some View {
        Userauth()
    }
}
