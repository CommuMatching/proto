//
//  Errorview.swift
//  proto
//
//  Created by 玉川悠真 on 2023/04/19.
//

import SwiftUI

struct Errorview: View {
    
    @Binding var err: String
    
    var body: some View {
        Text(err)
    }
}

struct Errorview_Previews: PreviewProvider {
    static var previews: some View {
        Errorview(err: .constant("エラー"))
    }
}
