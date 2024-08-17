//
//  PlaceModel.swift
//  Foursquare
//
//  Created by Alperen KARACA on 17.08.2024.
//

import Foundation
import UIKit

class PlaceModel {
    static let sharedInstance = PlaceModel()
    
    var placeName = ""
    var placeNote = ""
    var placeImage = UIImage()
    
    private init() {}
    
}
