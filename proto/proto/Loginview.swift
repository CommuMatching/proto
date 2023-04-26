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
    @State private var activie = false
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 30){
                // メールアドレス
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
                
                    
                // パスワード
                PasswordBar(password:$password)
                    .focused($focusedField, equals: .Password)
                    .toolbar{
                        ToolbarItemGroup(placement: .keyboard){
                            Spacer()
                            Button("Close"){
                                self.focusedField = nil
                            }
                        }
                    }
                
                // 認証
                Button(
                    action:{
                        if(mail == ""){
                            self.errorMessage = "メールアドレスが入力されていません"
                        } else if(self.password == ""){
                            self.errorMessage = "パスワードが入力されていません"
                        } else {
                            // 認証する処理
                            Auth.auth().signIn(withEmail: self.mail, password: self.password) { authResult, error in
                            if authResult?.user != nil {
                                // ログイン成功時、画面遷移
                                activie.toggle()
                            } else {
                                // ログイン失敗処理
                                if let error = error as NSError?, let errorCode = AuthErrorCode.Code(rawValue: error.code) {
                                    switch errorCode {
                                        case .invalidEmail:
                                            self.errorMessage = "メールアドレスの形式が正しくありません"
                                        case .emailAlreadyInUse:
                                            self.errorMessage = "このメールアドレスはすでに使われています。"
                                        case .weakPassword:
                                            self.errorMessage = "パスワードが弱すぎます。"
                                        case .userNotFound, .wrongPassword:
                                            self.errorMessage = "メールアドレス、またはパスワードが間違っています"
                                        case .userDisabled:
                                            self.errorMessage = "このユーザーアカウントは無効化されています"
                                        default:
                                            self.errorMessage = error.domain
                                        }
                                    }
                                }
                            }
                        }
                        if errorMessage != "" {
                            print(errorMessage)
                        }
                    }, label:{
                        Text("ログイン")
                            .decisionbutton()
                    })
            }.navigationDestination(isPresented: $activie, destination: {
                ContentView()
            })
        }.navigationBarBackButtonHidden(true)
    }
}

struct Loginview_Previews: PreviewProvider {
    static var previews: some View {
        Loginview()
    }
}
