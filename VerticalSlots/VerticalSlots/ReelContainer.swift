//
//  ReelContainer.swift
//  VerticalSlots
//
//  Created by Roy on 10/03/2017.
//  Copyright © 2017 Lamig Software. All rights reserved.
//

import UIKit
import SpriteKit

class ReelContainer: SKSpriteNode {

    
    convenience init(spriteNodes:[SKSpriteNode]) {
        self.init(color: .clear, size: CGSize(width: 160, height: 840*2))
        anchorPoint = CGPoint(x: 0.5, y: 1)
        
        for (index,sprite) in spriteNodes.enumerated() {
            sprite.anchorPoint = CGPoint(x: 0.5, y: 1)
            let yPos = -index*84
            sprite.position = CGPoint(x: 80, y: yPos)
            addChild(sprite)
        }
    }
}
