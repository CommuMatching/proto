//
//  ClubList.swift
//  proto
//
//  Created by 玉川悠真 on 2023/02/24.
//

import SwiftUI

struct CommunityList: View {
    @EnvironmentObject private var communitydata: CommunityData
    
    var body: some View {
        HStack(spacing: UIScreen.main.bounds.width/4) {
            Spacer()
            NavigationView {
                let communities = communitydata
                List{
                    if let filteredDictionary = (communities as? [String: Bool])?.filter({ $1 == true }) {
                        ForEach(filteredDictionary.keys.sorted(), id: \.self) { key in
                            if let value = filteredDictionary[key] {
                                NavigationLink(destination: Communityhomeview()) {
                                    Text(key)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

struct CommunityList_Previews: PreviewProvider {
    static var previews: some View {
        CommunityList()
    }
}
