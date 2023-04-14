//
//  Settingview.swift
//  proto
//
//  Created by 玉川悠真 on 2023/01/23.
//

import SwiftUI

struct Settingview: View {
    var body: some View {
        NavigationView {
            let settings = ["User","Policy","News"]
            List{
                ForEach(0 ..< settings.count, id: \.self) { index in
                        NavigationLink(destination: Text(settings[index])) {
                        Text(settings[index])
                        }
                }
                NavigationLink(destination: Userauth()) {
                Text("ユーザー登録")
                }
            }
        }
    }
}

struct Settingview_Previews: PreviewProvider {
    static var previews: some View {
        Settingview()
    }
}
