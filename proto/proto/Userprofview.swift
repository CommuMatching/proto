//
//  Userprofview.swift
//  proto
//
//  Created by 玉川悠真 on 2023/06/17.
//

import SwiftUI

struct Userprofview: View {
    @EnvironmentObject private var usersdata: Usersdata
    var key: String
    
    var body: some View {
        if let member = usersdata.alldata[key] as? [String: AnyObject] {
            VStack {
                HStack {
                    icon().padding()
                    Text("\(member["name"] as! String)")
                        .foregroundColor(Color.TextColor)
                }
                Spacer()
            }
        }
    }
}

struct Userprofview_Previews: PreviewProvider {
    static var previews: some View {
        Userprofview(key: "")
    }
}
