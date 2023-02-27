//
//  Homeview.swift
//  proto
//
//  Created by 玉川悠真 on 2023/01/22.
//

import SwiftUI

struct Homeview: View {
    enum side {
        case home
        case memberlist
        case clublist
    }
    @State private var isShowingView: side = .home
    @State public var x_from_dragstart:CGFloat = 0
    //@State public var y_from_dragstart:CGFloat = 0
    
    func switchflag(){
        if x_from_dragstart < -30 {
            withAnimation {isShowingView = .memberlist}
        }else if x_from_dragstart > 30 {
            withAnimation {isShowingView = .clublist}
        }
    }
        
    var gesture: some Gesture{
            DragGesture()
                .onEnded{ value in
                    self.x_from_dragstart = value.translation.width
                    //self.y_from_dragstart = value.translation.height
                    switchflag()
                }
                .onChanged { value in
                    self.x_from_dragstart = value.translation.width
                    //self.y_from_dragstart = value.translation.height
                    switchflag()
                }
        //self.current_x = value.startLocation.x + value.translation.width
        //self.current_y = value.startLocation.y + value.translation.height
        }
    
    
    var body: some View {
        ZStack {
            Color.white.opacity(1).gesture(self.gesture)
            Text("Home")
            HStack {
                if isShowingView == .memberlist {
                    MemberList()
                            .transition(.move(edge: .trailing))
                }else if isShowingView == .clublist {
                    ClubList()
                            .transition(.move(edge: .leading))
                }
            }
        }
    }
}

struct Homeview_Previews: PreviewProvider {
    static var previews: some View {
        Homeview()
    }
}
