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
                        
                        //MARK: Songs List View
                        songList
                    }
                    .padding()
                    .padding(.top)
                }
        }
    }
}

extension Home {
    private var songList: some View {
        ZStack {
            VStack(spacing: 25) {
                ForEach(albums) { album in
                    HStack(spacing: 12) {
                        Text("#\(getIndex(album: album) + 1)")
                            .fontWeight(.semibold)
                        
                        Image(systemName: "person.crop.square.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 50, height: 50)
                            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Text(album.albumName)
                                .fontWeight(.semibold)
                            
                            Label {
                                Text("65, 78, 909")
                            } icon: {
                                Image(systemName: "beats.headphones")
                            }
                            .font(.caption)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Button {
                            
                        } label: {
                            Image(systemName: album.isLiked ? "suit.heart.fill" : "suit.heart")
                                .font(.title3)
                                .foregroundColor(album.isLiked ? .red : .primary)
                        }

                    }
                }
            }
        }
    }
    
    private func getIndex(album: Album) -> Int {
        return albums.firstIndex { CAlbum in
            CAlbum.id == album.id
        } ?? 0
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
