//
//  ContentView.swift
//  proto
//
//  Created by 玉川悠真 on 2023/01/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    enum bottomtab {
        case home
        case map
        //case report
        case setting
    }
    @State private var isShowingView: bottomtab = .home
    
    var body: some View {
        NavigationView {
            VStack(spacing: .zero) {
                switch isShowingView {
                case .home: Homeview()
                case .map: Mapview()
                //case .report: Reportview()
                case .setting: Settingview()
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Button(action: {isShowingView = .home}) {
                        Text("Home")
                            .bold()
                            .padding()
                            .frame(width: 80, height: 70)
                            .foregroundColor(Color.black)
                            .overlay(
                                Circle()
                                    .stroke(Color.yellow, lineWidth: 3)
                            )
                    }
                    Spacer()
                    Button(action: {isShowingView = .map}) {
                        Text("Map")
                            .bold()
                            .padding()
                            .frame(width: 70, height: 70)
                            .foregroundColor(Color.black)
                            .overlay(
                                Circle()
                                    .stroke(Color.yellow, lineWidth: 3)
                            )
                    }
                    Spacer()
                    //Button("report"){isShowingView = .report}
                    //Spacer()
                    Button(action: {isShowingView = .setting}) {
                        Text("Set")
                            .bold()
                            .padding()
                            .frame(width: 70, height: 70)
                            .foregroundColor(Color.black)
                            .overlay(
                                Circle()
                                    .stroke(Color.yellow, lineWidth: 3)
                            )
                    }
                }
            }
        }
        
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
