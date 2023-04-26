//
//  ContentView.swift
//  proto
//
//  Created by 玉川悠真 on 2023/01/22.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    enum bottomtab {
        case home
        case map
        //case report
        case setting
    }
    @State private var isShowingView: bottomtab = .home
    
    var body: some View {
        NavigationStack {
            ZStack(/*spacing: .zero*/) {
                switch isShowingView {
                    case .home: Homeview()
                    case .map: Mapview()
                    //case .report: Reportview()
                    case .setting: Settingview()
                }
            }
            .toolbarBackground(.green, for: .bottomBar)
            .toolbarBackground(.visible, for: .bottomBar)
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Button(action: {isShowingView = .home}) {
                        Text("Home").yellowcircle()
                    }
                    Spacer()
                    Button(action: {isShowingView = .map}) {
                        Text("Map").yellowcircle()
                    }
                    Spacer()
                    //Button("report"){isShowingView = .report}
                    //Spacer()
                    Button(action: {isShowingView = .setting}) {
                        Text("Set").yellowcircle()
                    }
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
