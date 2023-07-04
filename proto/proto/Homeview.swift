//
//  Homeview.swift
//  proto
//
//  Created by 玉川悠真 on 2023/01/22.
//

import SwiftUI

struct Homeview: View {
    @State var selection: Int = 1
    @EnvironmentObject private var communitydata: Communitydata
    @EnvironmentObject private var usersdata: Usersdata
   
    var body: some View {
        TabView(selection: $selection) {
            CommunityList()
                .environmentObject(communitydata)
                .tag(0)
            
            
            Text("Home")
                .tag(1)
            
            MemberList()
                .environmentObject(usersdata)
                .tag(2)
        }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}

struct Homeview_Previews: PreviewProvider {
    static var previews: some View {
        Homeview()
    }
}
