//
//  DataClass.swift
//  proto
//
//  Created by 玉川悠真 on 2023/06/17.
//

import Foundation

class Communitydata: ObservableObject {
    @Published var belongdata: [String: AnyObject] = [:]
    @Published var alldata: [String: AnyObject] = [:]
    @Published var focus: String = ""
}

class Usersdata: ObservableObject {
    @Published var mydata: [String: AnyObject] = [:]
    @Published var alldata: [String: AnyObject] = [:]
}
