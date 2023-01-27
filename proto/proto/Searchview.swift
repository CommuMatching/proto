//
//  Searchview.swift
//  proto
//
//  Created by 玉川悠真 on 2023/01/23.
//

import SwiftUI

struct Searchview: View {
    @State private var searchText = ""
    @State var searchHistory: [String] = ["kai","lei"]
    
    var body: some View {
        NavigationStack {
            Text("search")
        }
    }
}

struct Searchview_Previews: PreviewProvider {
    static var previews: some View {
        Searchview()
    }
}
