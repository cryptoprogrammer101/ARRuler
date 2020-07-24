//
//  Constants.swift
//  ARRuler
//
//  Created by Narayan Sajeev on 7/21/20.
//  Copyright © 2020 Narayan Sajeev. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class K {
    
    // enable statistics
    static let showsStatistics = true
    
    // maximum number of dots at a time
    static let maximumDots = 2
    
    // radius of the dot
    static let dotRadius: CGFloat = 0.005
    
    // index of the first dot
    static let startDotIndex = 0
    
    // index of the second dot
    static let endDotIndex = 1
    
    // power to raise the lengths of the triangle
    static let power: Float = 2
    
    // depth of the text
    static let textDepth: CGFloat = 1.0
    
    // color of the dot
    static let dotColor = UIColor.red

    // color of the text
    static let textColor = UIColor.red
    
    // change in y-position of the text node
    static let changeInYPosition: Float = 0.01
    
    // factor to scale the text
    static let textScale = 0.01
    
    // rotation component of the text on the x-axis
    static let xTextRotation = 1
    
    // rotation component of the text on the y-axis
    static let yTextRotation = 0
    
    // rotation component of the text on the z-axis
    static let zTextRotation = 0
    
    // rotation angle of the text
    static let angleTextRotation = 0
    
    // round the distance
    static let roundingFormat = "%.3f"
    
    // units for the distance (meters)
    static let units = "m"
    
    // array of indices
    static let indicesArray: [Int32] = [0, 1]
    
    // color of the line
    static let lineColor = UIColor.red
    
}
