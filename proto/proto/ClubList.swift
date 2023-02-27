//
//  ClubList.swift
//  proto
//
//  Created by 玉川悠真 on 2023/02/24.
//

import SwiftUI

struct ClubList: View {
    @State private var isHome = false
    @State public var x_from_dragstart:CGFloat = 0
    
    func backhome() {
        if x_from_dragstart < -10 {
            withAnimation {isHome.toggle()}
        }
    }
    var gesture: some Gesture {
            DragGesture()
                .onEnded{ value in
                    self.x_from_dragstart = value.translation.width
                    backhome()
                }
                .onChanged { value in
                    self.x_from_dragstart = value.translation.width
                    backhome()
                }
        }
    
    var body: some View {
        NavigationView {
            ZStack {
                let clubs = ["club1"]
                List{
                    ForEach(0 ..< clubs.count, id: \.self) { index in
                            NavigationLink(destination: Text(clubs[index])) {
                            Text(clubs[index])
                            }
                    }
                }
                if isHome {
                    Homeview().transition(.move(edge: .trailing))
                }
            }.gesture(self.gesture)
        }
    }
}

struct ClubList_Previews: PreviewProvider {
    static var previews: some View {
        ClubList()
    }
}
