//
//  ZPosStruct.swift
//  VerticalSlots
//
//  Created by Roy on 9/03/2017.
//  Copyright © 2017 Lamig Software. All rights reserved.
//

import Foundation
import UIKit

struct ZPosStruct {
    
    //Main displays
    static let mainBackground:CGFloat = 1
    static let reelsBackground:CGFloat = 2
    static let reelContainer:CGFloat = 3//section?
    static let element:CGFloat = 4
    static let elementEffect:CGFloat = 5
    static let reelSurrounds:CGFloat = 6
    
    //Dashboard
    static let dashBoard:CGFloat = 101//there is an upper and lower dashboard
    
    //Level up
    static let levelUpContainer:CGFloat = 201
    static let levelUpBar:CGFloat = 202
    static let levelUpIcon:CGFloat = 203
    
    //Feature banner
    static let featureBanner:CGFloat = 301
    static let featureEffects:CGFloat = 302
    
    //Meters
    static let creditMeterContainer:CGFloat = 401
    static let creditMeterLabel:CGFloat = 402
    static let creditMeterAmount:CGFloat = 403
    
    static let betMeterContainer:CGFloat = 401
    static let betMeterLabel:CGFloat = 402
    static let betMeterAmount:CGFloat = 403
    
    static let winMeterContainer:CGFloat = 401
    static let winMeterLabel:CGFloat = 402
    static let winMeterAmount:CGFloat = 403
    
    //Buttons
    static let buyCoinsButton:CGFloat = 501
    static let menuButton:CGFloat = 501
    
    static let spinButton:CGFloat = 501
    static let decreaseBetButton:CGFloat = 501
    static let increaseBetButton:CGFloat = 501
    
    //No user interaction
    static let invisibleWall:CGFloat = 1001
    static let bigWinCoins:CGFloat = 1002
}
