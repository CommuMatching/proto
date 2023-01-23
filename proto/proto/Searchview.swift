//
//  Searchview.swift
//  proto
//
//  Created by 玉川悠真 on 2023/01/23.
//

import SwiftUI
import MapKit

struct Searchview: View {
    @State  var region = MKCoordinateRegion(
            center : CLLocationCoordinate2D(
                latitude: 35.710057714926265,  // 緯度
                longitude: 139.81071829999996 // 経度
            ),
            latitudinalMeters: 1000.0, // 南北
            longitudinalMeters: 1000.0 // 東西
        )
    var body: some View {
        Map(coordinateRegion: $region,interactionModes: .all,showsUserLocation: true,userTrackingMode: .none)
                    .edgesIgnoringSafeArea(.all)
    }
}

struct Searchview_Previews: PreviewProvider {
    static var previews: some View {
        Searchview()
    }
}
