//
//  MemberList.swift
//  proto
//
//  Created by 玉川悠真 on 2023/02/24.
//

import SwiftUI
import CoreData

struct MemberList: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        entity: Member.entity(),
        sortDescriptors: [NSSortDescriptor(key: "id", ascending: false)],
        animation: .default
    ) var fetchedMemberList: FetchedResults<Member>
    
    var body: some View {
        VStack(spacing: UIScreen.main.bounds.height/64){
                HStack(spacing: UIScreen.main.bounds.width/4) {
                    NavigationView {
                        List{
                            ForEach(fetchedMemberList) { member in
                                NavigationLink(destination: Text(member.name ?? "")) {
                                    Text(member.name ?? "")
                                }
                            }
                        }
                    }
                    Spacer()
                }
            Spacer()
        }
    }
}

struct MemberList_Previews: PreviewProvider {
    static var previews: some View {
        MemberList().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
