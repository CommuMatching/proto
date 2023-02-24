//
//  Mapview.swift
//  proto
//
//  Created by 玉川悠真 on 2023/01/23.
//

import SwiftUI
import MapKit

struct Mapview: View {
    @State  var region = MKCoordinateRegion(
            center : CLLocationCoordinate2D(
                latitude: 35.710057714926265,  // 緯度
                longitude: 139.81071829999996 // 経度
            ),
            latitudinalMeters: 1000.0, // 南北
            longitudinalMeters: 1000.0 // 東西
        )
    @State private var searchText = ""
    
    func geocode(completionHandler: @escaping (CLLocationCoordinate2D? , Error?) -> (), errorHandler: @escaping () -> ()){
        
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(searchText) { (placemarks, error) in
            guard let unwrapPlacemark = placemarks else {
                DispatchQueue.main.async {
                    // エラーを返す
                    completionHandler(nil, error)
                }
                return
            }
        
            let firstPlacemark = unwrapPlacemark.first!
            let location = firstPlacemark.location!
            
            DispatchQueue.main.async {
                // 取得した住所を返す
                completionHandler(location.coordinate, nil)
            }
        }
    }

    func reloadRegion(address: String) {
        geocode { location, error in
            guard let location = location else {
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    print("Unknown error.")
                }
                return
            }
            
            let center = CLLocationCoordinate2D(
                        latitude: location.latitude,
                        longitude: location.longitude)
            
            region = MKCoordinateRegion(
                        center: center,
                        latitudinalMeters: 1000.0,
                        longitudinalMeters: 1000.0
                    )
        } errorHandler: {
            print("error")
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top){
                Map(coordinateRegion: $region,interactionModes: .all,showsUserLocation: true,userTrackingMode: .none)
                    .edgesIgnoringSafeArea(.all)
                SearchBar(text: $searchText)
                    .onSubmit {
                        reloadRegion(address: searchText)
                  }
            }
        }
    }
}

struct Mapview_Previews: PreviewProvider {
    static var previews: some View {
        Mapview()
    }
}
