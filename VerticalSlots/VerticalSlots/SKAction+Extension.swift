//
//  SKAction+Extension.swift
//  VerticalSlots
//
//  Created by Roy on 9/03/2017.
//  Copyright © 2017 Lamig Software. All rights reserved.
//

import Foundation
import SpriteKit

extension SKAction {
    class func emptyAction() -> SKAction {
        return SKAction.wait(forDuration: 0)
    }
}
