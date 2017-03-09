//
//  Utils.swift
//  VerticalSlots
//
//  Created by Roy on 9/03/2017.
//  Copyright © 2017 Lamig Software. All rights reserved.
//

import Foundation

import Foundation

func delay(_ delay:Double, closure:@escaping ()->()) {
    DispatchQueue.main.asyncAfter(
        deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
}
