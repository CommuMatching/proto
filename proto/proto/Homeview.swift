//
//  Homeview.swift
//  proto
//
//  Created by 玉川悠真 on 2023/01/22.
//

import SwiftUI

struct Homeview: View {
    @State private var memv: Bool = false
    @State private var clbv: Bool = false
    @State public var x_from_dragstart:CGFloat = 0
    //@State public var y_from_dragstart:CGFloat = 0
    private let scrnwidth = UIScreen.main.bounds.width
    
    func mcreset(){
        withAnimation(Animation.easeOut(duration: 0.1)){
            memv = false
            clbv = false
        }
    }
    
    func switchflag(){
        if x_from_dragstart < -30 {
            withAnimation(Animation.easeOut(duration: 0.1)) {memv.toggle()}
        }else if x_from_dragstart > 30 {
            withAnimation(Animation.easeOut(duration: 0.1)) {clbv.toggle()}
        }
        
        if memv && clbv {
            mcreset()
        }
    }
        
    var gesture: some Gesture{
            DragGesture()
                .onEnded{ value in
                    self.x_from_dragstart = value.translation.width
                    //self.y_from_dragstart = value.translation.height
                    switchflag()
                }
        //self.current_x = value.startLocation.x + value.translation.width
        //self.current_y = value.startLocation.y + value.translation.height
        }
    
    var body: some View {
        ZStack {
            Color.blue.opacity(1).edgesIgnoringSafeArea(.all)
            if memv != clbv {
                Color.black.opacity(0.3).edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        mcreset()
                    }
            }
            
            //ここにHomeの内容
            Text("Home")
            //ここにHomeの内容
            
            MemberList()
                .offset(x: (memv != clbv) && memv ? scrnwidth/4+10 : scrnwidth, y: 0)
            ClubList()
                .offset(x: (memv != clbv) && clbv ? -scrnwidth/4-10 : -scrnwidth, y: 0)
        }.gesture(self.gesture)
    }
}

struct Homeview_Previews: PreviewProvider {
    static var previews: some View {
        Homeview()
    }
}
