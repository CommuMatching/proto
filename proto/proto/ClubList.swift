//
//  ClubList.swift
//  proto
//
//  Created by 玉川悠真 on 2023/02/24.
//

import SwiftUI

struct ClubList: View {
    var body: some View {
        HStack(spacing: UIScreen.main.bounds.width/4) {
            Spacer()
            NavigationView {
                let clubs = ["club1"]
                List{
                    ForEach(0 ..< clubs.count, id: \.self) { index in
                            NavigationLink(destination: Text(clubs[index])) {
                            Text(clubs[index])
                                .foregroundColor(Color.TextColor)
                        }
                    }
                }
            }
        }
    }
}

struct ClubList_Previews: PreviewProvider {
    static var previews: some View {
        ClubList()
    }
}
