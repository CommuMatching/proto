//
//  ContentView.swift
//  proto
//
//  Created by 玉川悠真 on 2023/01/22.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    
    init() {
      // 背景色
        UITabBar.appearance().backgroundColor = .white
    }
    
    var body: some View {
        NavigationStack {
            TabView{
                Homeview()
                    .tabItem {
                        Image(systemName: "house.fill")
                    }.tag(1)
                Mapview()
                    .tabItem {
                        Image(systemName: "map.fill")
                    }.tag(2)
                /*Reportview()
                    .tabItem {
                        Image(systemName: "bubble.left.fill")
                            .font(.system(size: 20))
                            .frame(width: 80,height: 45)
                    }.tag(3)*/
                Settingview()
                    .tabItem {
                        Image(systemName: "person.crop.circle.fill")
                    }.tag(4)
            }.accentColor(.black)
        }.navigationBarBackButtonHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
