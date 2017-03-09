//
//  LayoutPosition.swift
//  VerticalSlots
//
//  Created by Roy on 9/03/2017.
//  Copyright © 2017 Lamig Software. All rights reserved.
//

import Foundation
import UIKit

struct LayoutPosition {
    let reelNumber:Int
    let verticalPosition:Int
    
    //based on reelNumber and verticalPosition
    func screenPosition() -> CGPoint {
        return CGPoint(x: 50, y: 50)//change this
    }
}
