//
//  Communityprofview.swift
//  proto
//
//  Created by 玉川悠真 on 2023/06/23.
//

import SwiftUI

struct Communityprofview: View {
    @EnvironmentObject private var communitydata: Communitydata
    var key: String
    
    var body: some View {
        if let community = communitydata.alldata[key] as? [String: AnyObject] {
            VStack {
                HStack {
                    icon().padding()
                    Text("\(community["name"] as! String)")
                        .foregroundColor(Color.TextColor)
                }
                Spacer()
            }
        }
    }
}

struct Communityprofview_Previews: PreviewProvider {
    static var previews: some View {
        Communityprofview(key: "")
    }
}
