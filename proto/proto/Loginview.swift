//
//  Loginview.swift
//  proto
//
//  Created by 玉川悠真 on 2023/04/18.
//

import SwiftUI
import FirebaseAuth

struct Loginview: View {
    enum Field {
        case Mail
        case Password
    }
    @State public var mail = ""
    @State public var password = ""
    @State public var errorMessage = ""
    @FocusState private var focusedField: Field?
    @State private var signin = false
    @State private var tosignup = false
    @State private var err = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 40) {
                VStack(spacing: 30) {
                    VStack(alignment: .leading, spacing: 0.0) {
                        Text("メールアドレス")
                            .foregroundColor(.TextColor)
                            .padding(.leading, 8)
                        TextFieldwithClearButton(placeholder: "example@~", text: $mail)
                            .focused($focusedField, equals: .Mail)
                            .toolbar {
                                ToolbarItem(placement: .keyboard) {
                                    HStack {
                                        Spacer()
                                        Button("Close") {
                                            self.focusedField = nil
                                        }
                                    }
                                }
                            }
                            .textfieldframe(linewid: (focusedField == .Mail) ? 4.0 : 2.0)
                            .keyboardType(.emailAddress)
                    }
                    
                    VStack(alignment: .leading, spacing: 0.0) {
                        Text("パスワード")
                            .foregroundColor(.TextColor)
                            .padding(.leading, 8)
                        PasswordBar(password:$password)
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
                    }
                    
                    // 認証
                    Button(
                        action: {
                            self.focusedField = nil
                            // 認証する処理
                            Auth.auth().signIn(withEmail: self.mail, password: self.password) { authResult, error in
                                if authResult?.user != nil {
                                    // ログイン成功時、画面遷移
                                    signin.toggle()
                                } else {
                                    // ログイン失敗処理
                                    self.errorMessage = setErrorMessage(error)
                                    err.toggle()
                                }
                            }
                        }, label:{
                            Text("ログイン")
                                .decisionbutton(isable: !(mail.isEmpty || password.isEmpty))
                        }).alert(isPresented: $err) {
                            Alert(title: Text(errorMessage), dismissButton: .destructive(Text("OK")))
                        }.disabled(mail.isEmpty || password.isEmpty)
                }.navigationDestination(isPresented: $signin, destination: {
                    ContentView()
                })
                
                HStack(alignment: .bottom) {
                    Text("アカウントをお持ちでない方は")
                        .font(.caption)
                        .opacity(0.5)
                    Button(action: {
                        tosignup.toggle()
                    },label:  {
                        Text("新規登録")
                            .font(.caption)
                            .opacity(0.7)
                        
                    })
                }.navigationDestination(isPresented: $tosignup, destination: {
                    Signupview()
                })
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct Loginview_Previews: PreviewProvider {
    static var previews: some View {
        Loginview()
    }
}
