//
//  UserProfile.swift
//  proto
//
//  Created by 玉川悠真 on 2023/05/13.
//

import SwiftUI

class UserProfile: ObservableObject {
    
    @Published var Iconimage: Data {
        didSet {
            UserDefaults.standard.set(Iconimage, forKey: "Iconimage")
        }
    }
    
    @Published var Introduction: String {
        didSet {
            UserDefaults.standard.set(Introduction, forKey: "Introduction")
        }
    }
    
    /// 初期化処理
    init() {
        Iconimage = UserDefaults.standard.data(forKey: "Iconimage") ?? .init(capacity:0)
        Introduction = UserDefaults.standard.string(forKey: "Introduction") ?? ""
    }
}
