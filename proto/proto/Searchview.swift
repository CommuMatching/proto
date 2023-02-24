//
//  Searchview.swift
//  proto
//
//  Created by 玉川悠真 on 2023/01/23.
//

import SwiftUI

struct Searchview: View {
    @Environment(\.dismiss) var dismiss
    @State private var searchText = ""
    @State var searchHistory: [String] = ["kai","lei"]
    
    var body: some View {
        NavigationView {
            Text("search")
                .toolbar{
                    ToolbarItem(placement: .navigationBarLeading){
                        Button(action: {dismiss()}) {
                            Text("Back")
                        }
                    }
                }
        }
    }
}

struct Searchview_Previews: PreviewProvider {
    static var previews: some View {
        Searchview()
    }
}
