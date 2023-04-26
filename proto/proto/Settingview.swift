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
    
    var body: some View {
        NavigationStack {

            let settings = ["User","Policy","News"]
            List{
                ForEach(0 ..< settings.count, id: \.self) { index in
                        NavigationLink(destination: Text(settings[index])) {
                        Text(settings[index])
                        }
                }
                NavigationLink(destination: Button(action: {
                    do {
                        try Auth.auth().signOut()
                        activie.toggle()
                    } catch let signOutError as NSError {
                        print("Error signing out: %@", signOutError)
                        }
                    }, label: {Text("LogOut")}
                )) {
                Text("Log out")
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
