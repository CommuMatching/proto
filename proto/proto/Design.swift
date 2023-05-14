//
//  Design.swift
//  proto
//
//  Created by 玉川悠真 on 2023/04/18.
//

import SwiftUI
import Foundation

extension Color {
    static let TextColor = Color("TextColor")
    static let BackgroundColor = Color("BackgroundColor")
    static let ErrorColor = Color("ErrorColor")
}

extension View {
    
    func textfieldframe(linewid: CGFloat) -> some View{
        return overlay(
                RoundedRectangle(cornerSize: CGSize(width: 8.0, height: 8.0))
                .stroke(Color.blue, lineWidth: linewid)
                .padding(-8.0)
                ).padding(16.0)
    }
    
    func decisionbutton(isable: Bool) -> some View{
        return padding()
            .frame(width: 120, height: 50)
            .foregroundColor(.white)
            .background(isable ? .blue : .gray)
            .cornerRadius(25)
    }
}
