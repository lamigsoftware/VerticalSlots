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
        menuBtn.position = CGPoint(x: -365, y: 667)
        menuBtn.zPosition = ZPosStruct.menuButton
        addChild(menuBtn)
        
        let crown = SKSpriteNode(imageNamed: "crown")
        crown.anchorPoint = CGPoint(x: 0, y: 1)
        crown.position = CGPoint(x: -365, y: 400)
        crown.zPosition = ZPosStruct.levelUpIcon
        addChild(crown)
        
        let levelContainer = SKSpriteNode(color: .brown, size: CGSize(width: 50, height: 600))
        levelContainer.position = CGPoint(x: -315, y: 0)
        levelContainer.zPosition = ZPosStruct.levelUpContainer
        addChild(levelContainer)
        
        let levelBar = SKSpriteNode(color: .yellow, size: CGSize(width: 40, height: 590))
        levelBar.position = CGPoint(x: -315, y: 0)
        levelBar.zPosition = ZPosStruct.levelUpBar
        addChild(levelBar)
        
        let adBanner = SKSpriteNode(imageNamed: "adBanner")
        adBanner.anchorPoint = CGPoint(x: 0.5, y: 0)
        adBanner.position = CGPoint(x: 0, y: -667)
        adBanner.zPosition = ZPosStruct.adBanner
        addChild(adBanner)
        
        let spinBtn = SKSpriteNode(imageNamed: "spinButton")
        spinBtn.anchorPoint = CGPoint(x: 1, y: 0)
        spinBtn.position = CGPoint(x: 375, y: -560)
        spinBtn.zPosition = ZPosStruct.spinButton
        addChild(spinBtn)
        
        let minus = SKSpriteNode(imageNamed: "minus")
        minus.anchorPoint = CGPoint(x: 1, y: 0)
        minus.position = CGPoint(x: -200, y: -560)
        minus.zPosition = ZPosStruct.decreaseBetButton
        addChild(minus)

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
