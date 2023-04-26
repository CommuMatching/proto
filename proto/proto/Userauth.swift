//
//  Userauth.swift
//  proto
//
//  Created by 玉川悠真 on 2023/04/13.
//

import SwiftUI
import FirebaseAuth

struct Userauth: View {
    enum Field {
        case Name
        case Mail
        case Password
    }
    @State  var name:String = ""
    @State  var mail:String = ""
    @State  var password:String = ""
    @FocusState private var focusedField: Field?
        
    var body: some View {
        VStack{
            TextField("名前", text: $name)
                .focused($focusedField, equals: .Name)
                .toolbar{
                    ToolbarItem(placement: .keyboard){
                        HStack{
                            Spacer()
                            Button("Close"){
                                self.focusedField = nil
                            }
                        }
                    }
                }
                .textfieldframe(linewid: (focusedField == .Name) ? 4.0 : 2.0)
                
            TextField("メールアドレス", text: $mail)
                .focused($focusedField, equals: .Mail)
                .toolbar{
                    ToolbarItem(placement: .keyboard){
                        HStack{
                            Spacer()
                            Button("Close"){
                                self.focusedField = nil
                            }
                        }
                    }
                }
                .textfieldframe(linewid: (focusedField == .Mail) ? 4.0 : 2.0)
            
            PasswordBar(password: $password)
                .focused($focusedField, equals: .Password)
                .toolbar{
                    ToolbarItemGroup(placement: .keyboard){
                        Spacer()
                        Button("Close"){
                            self.focusedField = nil
                        }
                    }
                }
                
            Button(action: {
                Auth.auth().createUser(withEmail: self.mail, password: self.password) { authResult, error in
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
                    .decisionbutton()
            }).padding()
        }
    }
}

struct Userauth_Previews: PreviewProvider {
    static var previews: some View {
        Userauth()
    }
}
