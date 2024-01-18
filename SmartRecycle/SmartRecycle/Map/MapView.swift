//
//  MapView.swift
//  SmartRecycle
//
//  Created by Crystal Chan on 8/1/2024.
//

import SwiftUI
import MapKit
import CoreLocationUI

struct Place: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}


struct MapView: View {
    
    let annotations = [
        Place(name: "Green in Aberdeen", coordinate: CLLocationCoordinate2D(latitude: 22.24941606003023 , longitude: 114.15454382325527)),
        Place(name: "Green in Ap Lei Chau", coordinate: CLLocationCoordinate2D(latitude: 22.24372983605652 , longitude: 114.15329726743536)),
        Place(name: "Green in Happy Valley", coordinate: CLLocationCoordinate2D(latitude: 22.27085992119161  , longitude: 114.18492157907545 )),
        Place(name: "Green in Kennedy Town ", coordinate: CLLocationCoordinate2D(latitude: 22.282541824374363 , longitude: 114.12955797907581 )),
        Place(name: "Green in Quarry Bay", coordinate: CLLocationCoordinate2D(latitude: 22.28461264757496   , longitude: 114.21182970976426 )),
        Place(name: "Green in Sai Ying Pun", coordinate: CLLocationCoordinate2D(latitude: 22.286875335377456    , longitude: 114.14375320976447 )),
        Place(name: "Green in Sheung Wan ", coordinate: CLLocationCoordinate2D(latitude: 22.287678235062486    , longitude: 114.14567435209223 )),
        Place(name: "Green in Tin Hau", coordinate: CLLocationCoordinate2D(latitude: 22.283800648555662    , longitude: 114.19160265209223 )),
        Place(name: "Green in Cheung Sha Wan", coordinate: CLLocationCoordinate2D(latitude: 22.33314335380351     , longitude: 114.16095809627384 )),
        Place(name: "Green in Hung Hom", coordinate: CLLocationCoordinate2D(latitude: 22.307445471796406 , longitude: 114.18568002510915 )),
        Place(name: "Green in Jordan", coordinate: CLLocationCoordinate2D(latitude: 22.306738646794077 , longitude: 114.16758926743701 )),
        Place(name: "Green in San Po Kong", coordinate: CLLocationCoordinate2D(latitude: 22.32142776167518  , longitude: 114.16022059325279 )),
        Place(name: "Green in Tai Kok Tsui", coordinate: CLLocationCoordinate2D(latitude: 22.32092892823195     , longitude: 114.1892490520932 )),
        Place(name: "Green in To Kwa Wan", coordinate: CLLocationCoordinate2D(latitude: 22.32951851497468     , longitude: 114.18834902510983 )),
        Place(name: "Green in Walled City", coordinate: CLLocationCoordinate2D(latitude: 22.314718232715492   , longitude: 114.2233131520929 )),
        Place(name: "Green in Fanling", coordinate: CLLocationCoordinate2D(latitude: 22.48538086356725    , longitude: 114.14152106744186 )),
        Place(name: "Green in Construction", coordinate: CLLocationCoordinate2D(latitude: 22.408835159769396     , longitude: 113.96844066743974 )),
        Place(name: "Green in Kwai Fong", coordinate: CLLocationCoordinate2D(latitude: 22.361064805081917     , longitude: 114.1306078309303 )),
        Place(name: "Green in LO TAK COURT", coordinate: CLLocationCoordinate2D(latitude: 22.37501883816775     , longitude: 114.11218450791442 )),
        Place(name: "Green in LONG PING", coordinate: CLLocationCoordinate2D(latitude: 22.443192633958507     , longitude: 114.02410989442438 )),
        Place(name: "Green in LUEN WO HUI", coordinate: CLLocationCoordinate2D(latitude: 22.498113574638097  , longitude: 114.14276874045844 )),
        Place(name: "Green in MUI WO", coordinate: CLLocationCoordinate2D(latitude: 22.26470134402995     , longitude: 114.0009271565296 )),
        Place(name: "Green in PO LAM", coordinate: CLLocationCoordinate2D(latitude: 22.32346315107748     , longitude: 114.25825216928976 )),
        Place(name: "Green in SAI KUNG TOWN", coordinate: CLLocationCoordinate2D(latitude: 22.380788972541836     , longitude: 114.27289458093078 )),
        Place(name: "Green in SAI KUNG TOWN - TIU KENG LENG BRANCH", coordinate: CLLocationCoordinate2D(latitude: 22.3027583781289     , longitude: 114.25309665579739 )),
        Place(name: "Green in SAN HUI", coordinate: CLLocationCoordinate2D(latitude: 22.395403497414783     , longitude: 113.97459559442314 )),
        Place(name: "Green in SHEK WU HUI", coordinate: CLLocationCoordinate2D(latitude: 22.503335958312825     , longitude: 114.1275327386061 )),
        Place(name: "Green in TAI PO MARKET", coordinate: CLLocationCoordinate2D(latitude: 22.449290263766578    , longitude: 114.16655479627687 )),
        Place(name: "Green in TAI WAI", coordinate: CLLocationCoordinate2D(latitude: 22.376303062651793    , longitude: 114.1778370692913 )),
        Place(name: "Green in ", coordinate: CLLocationCoordinate2D(latitude: 22.453216288073154     , longitude: 114.16853347327492 )),
        Place(name: "Green in TAI WO", coordinate: CLLocationCoordinate2D(latitude: 22.36640352432016     , longitude: 114.12497980780505 )),
        Place(name: "Green in TAI WO HAU", coordinate: CLLocationCoordinate2D(latitude: 22.36861937525298     , longitude: 114.11621113675015 )),
        Place(name: "Green in YI PEI SQUARE", coordinate: CLLocationCoordinate2D(latitude: 22.444992285403245     , longitude: 114.0317153539488 )),
        Place(name: "Green in YUEN LONG HUI", coordinate: CLLocationCoordinate2D(latitude: 22.444708538644917     , longitude: 114.0317315848083 ))
    ]
    
    var rating: String {
        return "Green@Recycling Stores"
    }
    
    @StateObject private var viewModel = MapViewModel()
    
    var body: some View {
        ZStack (alignment: .bottom){
            Map(coordinateRegion: $viewModel.region, showsUserLocation: true, annotationItems: annotations) { place in
                MapAnnotation(coordinate: place.coordinate) {
                    HStack {
                        Image(systemName: "arrow.3.trianglepath")
                            .foregroundColor(.green)
                        Text(rating)
                            .fixedSize()
                    }.padding(10)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
                        .overlay(
                            Image(systemName: "arrowtriangle.left.fill")
                                .rotationEffect(Angle(degrees: 270))
                                .foregroundColor(.white)
                                .offset(y: 10)
                            
                            , alignment: .bottom)
                }

            }//.ignoresSafeArea()
            
            LocationButton(.currentLocation){
                viewModel.requestAllowOnceLocationPermission()
            }
            .foregroundColor(.black)
            .cornerRadius(8)
            .labelStyle(.titleAndIcon)
            .symbolVariant(.fill)
            .tint(.sec)
            .padding(.bottom, 50)
            
        }
    }
}

final class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate{
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 22.316668 , longitude: 114.183334), latitudinalMeters: 6000, longitudinalMeters: 6000)
    
    let locationManger = CLLocationManager()
    
    override init() {
        super.init()
        locationManger.delegate = self
    }
    
    func requestAllowOnceLocationPermission(){
        locationManger.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let latestLocation = locations.first else{
            return
        }
        DispatchQueue.main.async {
            self.region = MKCoordinateRegion(center: latestLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}

#Preview {
    MapView()
}
