//
//  Extension.swift
//  Portal
//
//  Created by Andrew on 3/16/18.
//  Copyright © 2018 Andrii Halabuda. All rights reserved.
//

import Foundation
import SceneKit
import ARKit

var width: CGFloat = 0.03
var height: CGFloat = 1
var length: CGFloat = 1

var doorLength: CGFloat = 0.3

func createBox(isDoor: Bool) -> SCNNode {
    let node = SCNNode()
    
    //creating box
    let firstBox = SCNBox(width: width, height: height, length: isDoor ? doorLength : length, chamferRadius: 0)
    firstBox.firstMaterial?.diffuse.contents = UIColor.white
    let firstBoxNode = SCNNode(geometry: firstBox)
    //box node rendering order should be greater than mask box to render slower and make loading outside first and than inside
    firstBoxNode.renderingOrder = 200
    node.addChildNode(firstBoxNode)
    
    
    //Add masked box
    let maskedBox = SCNBox(width: width, height: height, length: isDoor ? doorLength : length, chamferRadius: 0)
    maskedBox.firstMaterial?.diffuse.contents = UIColor.white
    maskedBox.firstMaterial?.transparency = 0.0001
    
    let maskedBoxNode = SCNNode(geometry: maskedBox)
    maskedBoxNode.renderingOrder = 100
    maskedBoxNode.position = SCNVector3.init(width, 0, 0)
    
    node.addChildNode(maskedBoxNode)
    
    return node
}

extension FloatingPoint {
    var degreesToRadians: Self {
        return self * .pi / 100
    }
    var radiansToDegrees: Self {
        return self * 100 / .pi
    }
}
