//
//  MemberList.swift
//  proto
//
//  Created by 玉川悠真 on 2023/02/24.
//

import SwiftUI

struct MemberList: View {
    @EnvironmentObject private var communitydata: Communitydata
    @EnvironmentObject private var usersdata: Usersdata
    
    var body: some View {
        NavigationStack{
            VStack {
                List {
                    Spacer()
                    if let members = (communitydata.belongdata["\(communitydata.focus)"])?["members"], let crrntmembers = (members as? [String: Bool])?.filter({$1 == true}) {
                        ForEach(crrntmembers.keys.sorted(), id: \.self) { key in
                            if let member = usersdata.alldata[key], let name = member["name"] as? String{
                                ZStack {
                                    NavigationLink(destination: Userprofview(key: key)) {
                                        EmptyView()
                                    }
                                    .opacity(0)
                                    HStack {
                                        Image(systemName: "person.fill")
                                            .resizable()
                                            .frame(width: 25, height: 25)
                                            .padding(2)
                                            .cornerRadius(75)
                                            .foregroundColor(Color.black)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 75).stroke(Color.gray,lineWidth: 1)
                                            )
                                            .shadow(radius: 20)
                                        Text(name)
                                            .foregroundColor(.TextColor)
                                            .font(.body)
                                            .fontWeight(.regular)
                                        Spacer()
                                    }
                                    .contentShape(Rectangle())
                                }
                            }
                        }
                    }
                }.listStyle(.plain)
                Spacer()
            }
        }
    }
}

struct MemberList_Previews: PreviewProvider {
    static var previews: some View {
        MemberList()
    }
}
