//
//  Homeview.swift
//  proto
//
//  Created by 玉川悠真 on 2023/01/22.
//

import SwiftUI
import FirebaseAuth
import FirebaseDatabase

struct Homeview: View {
    let user = Auth.auth().currentUser
    var ref: DatabaseReference! = Database.database().reference()
    @ObservedObject var communitydata = CommunityData()
    
    @State public var errorMessage = ""
    @State private var err = false
    @State private var memv: Bool = false
    @State private var comv: Bool = false
    @State public var x_from_dragstart:CGFloat = 0
    // @State public var y_from_dragstart:CGFloat = 0
    private let scrnwidth = UIScreen.main.bounds.width
    
    func mcreset() {
        withAnimation(Animation.easeOut(duration: 0.1)) {
            memv = false
            comv = false
        }
    }
    
    func switchflag() {
        if x_from_dragstart < -30 {
            withAnimation(Animation.easeOut(duration: 0.1)) {memv.toggle()}
        } else if x_from_dragstart > 30 {
            withAnimation(Animation.easeOut(duration: 0.1)) {comv.toggle()}
        }
        
        if memv && comv {
            mcreset()
        }
    }
        
    var gesture: some Gesture {
            DragGesture()
                .onEnded{ value in
                    self.x_from_dragstart = value.translation.width
                    // self.y_from_dragstart = value.translation.height
                    switchflag()
                }
        // self.current_x = value.startLocation.x + value.translation.width
        // self.current_y = value.startLocation.y + value.translation.height
        }
    
    var body: some View {
        ZStack {
            Color.white.opacity(1).edgesIgnoringSafeArea(.all)
            if memv != comv {
                Color.black.opacity(0.3).edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        mcreset()
                    }
            }
            
            //ここにHomeの内容
            VStack{
            }
            //ここにHomeの内容
            
            MemberList().environmentObject(communitydata)
                .offset(x: (memv != comv) && memv ? scrnwidth/4+10 : scrnwidth, y: 0)
            CommunityList().environmentObject(communitydata)
                .offset(x: (memv != comv) && comv ? -scrnwidth/4-10 : -scrnwidth, y: 0)
        }
        .onAppear(){
            if let user = self.user {
                self.ref.child("users\(user.uid)/communities").observe(.value){snapshot in
                    DispatchQueue.main.async {
                        if let value = snapshot.value as? NSDictionary {
                            communitydata.data = value
                        } else {
                            errorMessage = "取得したデータが予期していない型です。"
                            err.toggle()
                        }
                    }
                }
            }else{
                errorMessage = "ログインしてください"
                err.toggle()
            }
        }
        .gesture(self.gesture)
        .alert(isPresented: $err) {
            Alert(title: Text(errorMessage), dismissButton: .destructive(Text("OK")))
        }
    }
}

struct Homeview_Previews: PreviewProvider {
    static var previews: some View {
        Homeview()
    }
}


class CommunityData: ObservableObject {
    @Published var data: NSDictionary = [:]
}
