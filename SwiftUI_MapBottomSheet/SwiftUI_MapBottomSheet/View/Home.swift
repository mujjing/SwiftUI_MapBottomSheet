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
                .ignoresSafeArea()
            //MARK: Building Sheet UI
                .sheet(isPresented: .constant(true)) {
                    VStack(spacing: 15) {
                        TextField("Search Maps", text: .constant(""))
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background {
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(.ultraThickMaterial)
                        }
                    }
                    .padding()
                    .padding(.top)
                }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
