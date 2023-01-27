//
//  Mapview.swift
//  proto
//
//  Created by 玉川悠真 on 2023/01/23.
//

import SwiftUI
import MapKit

class ConversionSpot {
    // ジオコーディング
    func geocoding(address: String){
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(address) {(placemarks, error) in
            let lat = placemarks?.first?.location?.coordinate.latitude
            let long = placemarks?.first?.location?.coordinate.longitude
        }
    }
}

struct Mapview: View {
    var convspot = ConversionSpot()
    @State  var region = MKCoordinateRegion(
            center : CLLocationCoordinate2D(
                latitude: 35.710057714926265,  // 緯度
                longitude: 139.81071829999996 // 経度
            ),
            latitudinalMeters: 1000.0, // 南北
            longitudinalMeters: 1000.0 // 東西
        )
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            Map(coordinateRegion: $region,interactionModes: .all,showsUserLocation: true,userTrackingMode: .none)
                //.edgesIgnoringSafeArea(.all)
        }
    }
}

struct Mapview_Previews: PreviewProvider {
    static var previews: some View {
        Mapview()
    }
}
