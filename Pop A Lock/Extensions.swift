//
//  Extensions.swift
//  Pop A Lock
//
//  Created by Alex Retter on 3/17/16
//  Copyright © 2016 Re.Group Apps. All rights reserved.
//


import Foundation
import SpriteKit

extension CGFloat {
    
    static func random(min: CGFloat, max: CGFloat) -> CGFloat {
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF) * (max - min) + min
    }
    
}