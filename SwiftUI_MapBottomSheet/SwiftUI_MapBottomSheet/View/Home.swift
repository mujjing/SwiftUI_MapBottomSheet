//
//  Home.swift
//

import SwiftUI
import MapKit

struct Home: View {
    var body: some View {
        ZStack {
            //MARK: Sample Coordinate Region
            let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 25.2048, longitude: 55.2708), latitudinalMeters: 10000, longitudinalMeters: 10000)
            Map(coordinateRegion: .constant(region))
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
