//
//  MemberList.swift
//  proto
//
//  Created by 玉川悠真 on 2023/02/24.
//

import SwiftUI

struct MemberList: View {
    
    var body: some View {
        HStack(spacing: UIScreen.main.bounds.width/4) {
            NavigationView {
                let members = ["member1"]
                List{
                    ForEach(0 ..< members.count, id: \.self) { index in
                            NavigationLink(destination: Text(members[index])) {
                            Text(members[index])
                        }
                    }
                }
            }
            Spacer()
        }
    }
}

struct MemberList_Previews: PreviewProvider {
    static var previews: some View {
        MemberList()
    }
}
