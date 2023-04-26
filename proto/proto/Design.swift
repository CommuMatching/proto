//
//  Design.swift
//  proto
//
//  Created by 玉川悠真 on 2023/04/18.
//

import SwiftUI


extension View {
    func yellowcircle() -> some View{
        return bold()
            .padding()
            .frame(width: 80, height: 70)
            .foregroundColor(Color.black)
            .overlay(
                Circle()
                    .stroke(Color.yellow, lineWidth: 3)
            )
    }
    
    func textfieldframe(linewid: CGFloat) -> some View{
        return overlay(
                RoundedRectangle(cornerSize: CGSize(width: 8.0, height: 8.0))
                .stroke(Color.blue, lineWidth: linewid)
                .padding(-8.0)
                ).padding(16.0)
    }
    
    func decisionbutton() -> some View{
        return padding()
            .frame(width: 120, height: 50)
            .foregroundColor(Color.white)
            .background(Color.blue)
            .cornerRadius(25)
    }
}
