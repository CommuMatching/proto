//
//  SearchBar.swift
//  SearchBarExampleSwiftUI
//
//  Created by 玉川悠真 on 2022/04/21.
//

import SwiftUI

extension View {
    func placeholder<Content: View>(
            when shouldShow: Bool,
            alignment: Alignment = .leading,
            color: Color,
            @ViewBuilder placeholder: () -> Content) -> some View {

            ZStack(alignment: alignment) {
                placeholder()
                    .opacity(shouldShow ? 1 : 0)
                    .foregroundColor(color)
                self
            }
        }
}

struct SearchBar: View {
    
    @Binding var text: String
    
    var body: some View {
        VStack {
            ZStack {
                // background
                //RoundedRectangle(cornerRadius: 8)
                Capsule()
                    .fill(Color.white)
                    .frame(height: 50)
                HStack(spacing: 6) {
                    Spacer()
                        .frame(width: 0)
                    
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    
                    // TextField
                    TextField("", text: $text)
                        .placeholder(when: text.isEmpty, color: .gray) {
                            Text("Search")
                        }
                    
                    if !text.isEmpty {
                        Button {
                            text.removeAll()
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.gray)
                        }
                        .padding(.trailing, 6)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""))
    }
}
