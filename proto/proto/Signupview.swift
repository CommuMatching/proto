//
//  Signupview.swift
//  proto
//
//  Created by 玉川悠真 on 2023/04/13.
//

import SwiftUI
import FirebaseAuth
import FirebaseDatabase

struct Signupview: View {
    enum Field {
        case Name
        case Mail
        case Password
    }
    @State  var name: String = ""
    @State  var mail: String = ""
    @State  var password: String = ""
    @State public var errorMessage = ""
    @FocusState private var focusedField: Field?
    @State private var err = false
    @State private var signup = false
    @State var isPresentedProgressView = false
    
    var ref: DatabaseReference! = Database.database().reference()
        
    var body: some View {
        VStack {
            TextFieldwithClearButton(placeholder: "名前", text: $name)
                .focused($focusedField, equals: .Name)
                .toolbar {
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
                
            TextFieldwithClearButton(placeholder: "メールアドレス", text: $mail)
                .focused($focusedField, equals: .Mail)
                .toolbar {
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
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Close") {
                            self.focusedField = nil
                        }
                    }
                }
                .textfieldframe(linewid: (focusedField == .Password) ? 4.0 : 2.0)
                
            Button(action: {
                self.focusedField = nil
                Auth.auth().createUser(withEmail: self.mail, password: self.password) { authResult, error in
                    if let user = authResult?.user {
                        let request = user.createProfileChangeRequest()
                        request.displayName = name
                        request.commitChanges { error in
                            if error == nil {
                                user.sendEmailVerification() { error in
                                    if error == nil {
                                        //新規登録成功時、画面遷移
                                        isPresentedProgressView = true
                                        DispatchQueue.main.async {
                                            self.isPresentedProgressView = false
                                            signup.toggle()
                                        }
                                        self.ref.child("users").child(user.uid).setValue(["username": (self.name)])
                                    } else {
                                        self.errorMessage = setErrorMessage(error)
                                        err.toggle()
                                    }
                                }
                            } else {
                                self.errorMessage = setErrorMessage(error)
                                err.toggle()
                            }
                        }
                    } else {
                        self.errorMessage = setErrorMessage(error)
                        err.toggle()
                    }
                }
            }, label: {
                Text("新規登録")
                    .decisionbutton(isable: !(name.isEmpty || mail.isEmpty || password.isEmpty))
            })
            .padding()
            .alert(isPresented: $err) {
                Alert(title: Text(errorMessage).foregroundColor(Color.ErrorColor))
            }
            .disabled(name.isEmpty || mail.isEmpty || password.isEmpty)
            .navigationDestination(isPresented: $signup, destination: {
                ContentView()
            })
        }
    }
}

struct Signupview_Previews: PreviewProvider {
    static var previews: some View {
        Signupview()
    }
}