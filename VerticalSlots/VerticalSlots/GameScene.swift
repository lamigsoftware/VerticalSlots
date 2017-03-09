//
//  GameScene.swift
//  VerticalSlots
//
//  Created by Roy on 9/03/2017.
//  Copyright © 2017 Lamig Software. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    override func didMove(to view: SKView) {
        
        let bg = SKSpriteNode(imageNamed: "farm")
        addChild(bg)
        
        let menuBtn = SKSpriteNode(imageNamed: "menuButton")
        menuBtn.anchorPoint = CGPoint(x: 0, y: 1)
        menuBtn.position = CGPoint(x: -350, y: 667)
        menuBtn.zPosition = ZPosStruct.menuButton
        addChild(menuBtn)
        
        let crown = SKSpriteNode(imageNamed: "crown")
        crown.position = CGPoint(x: 50, y: 50)
        crown.zPosition = ZPosStruct.levelUpIcon
        addChild(crown)
        

    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}

// MARK: Selectors

private extension Selector {
    //    static let applicationDidEnterBackground = #selector(GameScene.applicationDidEnterBackground)
    
}
