//
//  CommunityList.swift
//  proto
//
//  Created by 玉川悠真 on 2023/02/24.
//

import SwiftUI

struct CommunityList: View {
    @EnvironmentObject private var communitydata: Communitydata
    @State private var tocomprofview = false
    
    var body: some View {
        NavigationStack{
            HStack {
                List{
                    ForEach(communitydata.belongdata.keys.sorted(), id: \.self) { key in
                        if let community = communitydata.belongdata[key], let name = community["name"] as? String {
                            HStack {
                                Image(systemName: "figure.2.arms.open")
                                    .resizable()
                                    .frame(width: 45, height: 45)
                                    .padding(2)
                                    .cornerRadius(75)
                                    .foregroundColor(Color.black)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 75).stroke(
                                            (key == communitydata.focus) ? Color.blue : Color.gray,
                                            lineWidth: (key == communitydata.focus) ? 2 : 3)
                                    )
                                    .shadow(radius: 20)
                                Text(name)
                                    .foregroundColor(.TextColor)
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                Spacer()
                            }
                            .contentShape(Rectangle())
                            .onTapGesture {
                                if communitydata.focus == key {
                                    tocomprofview = true
                                } else {
                                    communitydata.focus = key
                                }
                            }
                        }
                    }
                }.listStyle(.plain)
            }.navigationDestination(isPresented: $tocomprofview, destination: {
                Communityprofview(key: communitydata.focus)
            })
        }
    }
}

struct CommunityList_Previews: PreviewProvider {
    static var previews: some View {
        CommunityList()
    }
}
