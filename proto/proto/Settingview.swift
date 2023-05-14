//
//  Settingview.swift
//  proto
//
//  Created by 玉川悠真 on 2023/01/23.
//

import SwiftUI
import FirebaseAuth

struct Settingview: View {
    @State private var activie = false
    @ObservedObject var profile = UserProfile()
    
    var body: some View {
        let user = Auth.auth().currentUser
        NavigationStack {
            VStack {
                VStack {
                    HStack {
                        icon()
                            .padding(.leading)
                            .padding(.top)
                            .padding(.trailing)
                        Spacer()
                    }
                    HStack {
                        VStack(alignment: .leading) {
                            Text(user?.displayName ?? "ゲスト")
                                .foregroundColor(Color.TextColor)
                                .bold()
                            Text(profile.Introduction)
                                .foregroundColor(Color.TextColor)
                        }.padding()
                        Spacer()
                    }
                }
                let settings = ["アカウント","Policy","News"]
                List{
                    ForEach(0 ..< settings.count, id: \.self) { index in
                            NavigationLink(destination: Text(settings[index])) {
                                Text(settings[index]).foregroundColor(Color.TextColor)
                            }
                    }
                    NavigationLink(destination: Button(action: {
                        do {
                            try Auth.auth().signOut()
                            activie.toggle()
                        } catch let signOutError as NSError {
                            print("Error signing out: %@", signOutError)
                            }
                    }, label: {Text("ログアウト").decisionbutton(isable: true)}
                    )) {
                        Text("Log Out")
                    }
                }
            }
        }.navigationDestination(isPresented: $activie, destination: {
            Loginview()
        })
    }
}

struct Settingview_Previews: PreviewProvider {
    static var previews: some View {
        Settingview()
    }
}
