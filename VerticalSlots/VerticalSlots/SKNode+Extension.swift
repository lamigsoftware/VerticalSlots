//
//  SKNode+Extension.swift
//  VerticalSlots
//
//  Created by Roy on 9/03/2017.
//  Copyright © 2017 Lamig Software. All rights reserved.
//

import Foundation
import SpriteKit

extension SKNode {
    
    /**
     Removes the node named nodeName.
     
     This function was created because
     a simple removeFromParent doesn't work.
     */
    func removeChildNode(_ nodeName:String) {
        enumerateChildNodes(withName: nodeName) {
            node, stop in
            node.removeFromParent()
        }
    }
    
    func scale(_ scaleFactor:CGFloat) {
        xScale = scaleFactor
        yScale = scaleFactor
    }
    
}
