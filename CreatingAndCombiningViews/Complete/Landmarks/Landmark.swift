//
//  Landmark.swift
//  Landmarks
//
//  Created by main on 7/28/23.
//  Copyright © 2023 Apple. All rights reserved.
//

import Foundation
import SwiftUI

struct Landmark: Hashable, Codable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    
    // to read the name of the image from the data
    private var imageName: String
    
    var image: Image {
        Image(imageName)
    }
}
