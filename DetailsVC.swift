//
//  DetailsVC.swift
//  Foursquare
//
//  Created by Alperen KARACA on 16.08.2024.
//

import UIKit
import MapKit
import Parse

class DetailsVC: UIViewController , MKMapViewDelegate {

    @IBOutlet weak var detailsPlaceNote: UILabel!
    @IBOutlet weak var detailsPlaceName: UILabel!
    @IBOutlet weak var detailsMapKit: MKMapView!
    @IBOutlet weak var detailsImageView: UIImageView!
    
    var chosenPlaceId = ""
    var chosenLatitude = Double()
    var chosenLongitude = Double()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        let query = PFQuery(className: "Places")
        query.whereKey("objectId", equalTo: chosenPlaceId)
        query.findObjectsInBackground { (objects, error) in
            if error != nil {
                
            }else {
                if objects != nil {
                    let chosenPlaceObject = objects![0]
                    
                    if let placeName = chosenPlaceObject.object(forKey: "Name") as? String{
                        self.detailsPlaceName.text = placeName
                    }
                    
                    if let placeNote = chosenPlaceObject.object(forKey: "Note") as? String{
                        self.detailsPlaceNote.text = placeNote
                    }
                    
                    if let placeLatitude = chosenPlaceObject.object(forKey: "latitude") as? String {
                        if let placeLatitudeDouble = Double(placeLatitude) {
                            self.chosenLatitude = placeLatitudeDouble
                        }
                    }
                    
                    if let placeLongitude = chosenPlaceObject.object(forKey: "Longitude") as? String {
                        if let placeLongitudeDouble = Double(placeLongitude) {
                            self.chosenLongitude = placeLongitudeDouble
                        }
                    }
                    
                    if let imageData = chosenPlaceObject.object(forKey: "image") as? PFFileObject {
                        imageData.getDataInBackground { (data, error) in
                            if error == nil {
                                if data != nil {
                                    self.detailsImageView.image = UIImage(data: data!)
                                }
                                
                            }
                        }
                    }
                    
//                    MAPS
                    
                    let location = CLLocationCoordinate2D(latitude: self.chosenLatitude, longitude: self.chosenLongitude)
                    let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                    let region = MKCoordinateRegion(center: location, span: span)
                    self.detailsMapKit.setRegion(region, animated: true)
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = location
                    annotation.title =  self.detailsPlaceName.text!
                    annotation.subtitle = self.detailsPlaceNote.text!
                    self.detailsMapKit.addAnnotation(annotation)
                    
                    self.detailsMapKit.delegate = self
                    
                }
            }
        }
        
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: any MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        
        let reuseId = "pin"
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId)
        if pinView == nil {
            pinView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView?.canShowCallout = true
            let button = UIButton(type: UIButton.ButtonType.detailDisclosure)
            pinView?.rightCalloutAccessoryView = button
        }else{
            pinView?.annotation = annotation
        }
        
        return pinView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if self.chosenLatitude != 0.0 && self.chosenLongitude != 0.0 {
            let requestLocation = CLLocation(latitude: self.chosenLatitude, longitude: self.chosenLongitude)
            
            CLGeocoder().reverseGeocodeLocation(requestLocation) { (placeMarks, error) in
                if let placemark = placeMarks{
                 
                    if placemark.count > 0 {
                        let mkPlaceMark = MKPlacemark(placemark: placemark[0])
                        let mapItem = MKMapItem(placemark: mkPlaceMark)
                        mapItem.name = self.detailsPlaceName.text
                        
                        let launchOptions = [MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeWalking]
                        
                        mapItem.openInMaps(launchOptions: launchOptions)
                    }
                    
                        
                    
                }
            }
        }
    }
    
    

    

}
