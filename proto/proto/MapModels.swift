//
//  MapModels.swift
//  proto
//
//  Created by 玉川悠真 on 2023/02/28.
//

import MapKit

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    @Published  var region =  MKCoordinateRegion(
        center : CLLocationCoordinate2D(
            latitude: 35.710057714926265,  // 緯度
            longitude: 139.81071829999996 // 経度
        ),
        latitudinalMeters: 1000.0, // 南北
        longitudinalMeters: 1000.0 // 東西
    )

    override init() {
        super.init() // スーパクラスのイニシャライザを実行
        manager.delegate = self // 自身をデリゲートプロパティに設定
        manager.requestWhenInUseAuthorization() // 位置情報を利用許可をリクエスト
        manager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters // 10メートル単位の精度の位置情報を要求
        //kCLLocationAccuracyBest // 最高精度
        //kCLLocationAccuracyKilometer // キロメートル単位の精度
        //kCLLocationAccuracyNearestTenMeters // 10メートル単位の精度
        manager.distanceFilter = 10.0 // 更新距離(m)
        manager.startUpdatingLocation()
    }
    
    // 領域の更新をするデリゲートメソッド
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // 配列の最後に最新のロケーションが格納される
        // map関数を使って全要素にアクセス map{ $0←要素に参照 }
        locations.last.map {
            let center = CLLocationCoordinate2D(
                latitude: $0.coordinate.latitude,
                longitude: $0.coordinate.longitude)

                // 地図を表示するための領域を再構築
                region = MKCoordinateRegion(
                    center: center,
                    latitudinalMeters: 1000.0,
                    longitudinalMeters: 1000.0
            )
        }
    }
}
