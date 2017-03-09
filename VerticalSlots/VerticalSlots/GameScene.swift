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
    
    override func didMove(to view: SKView) {
        
        let reelSurrounds = SKSpriteNode(imageNamed: "reelSurrounds")
        reelSurrounds.zPosition = ZPosStruct.reelSurrounds
        addChild(reelSurrounds)
        
        let menuBtn = SKSpriteNode(imageNamed: "menuButton")
        menuBtn.anchorPoint = CGPoint(x: 0, y: 1)
        menuBtn.position = CGPoint(x: -365, y: 652)
        menuBtn.zPosition = ZPosStruct.menuButton
        addChild(menuBtn)
        
        let buyBtn = SKSpriteNode(imageNamed: "buyIcon")
        buyBtn.anchorPoint = CGPoint(x: 0.5, y: 1)
        buyBtn.position = CGPoint(x: 0, y: 655)
        buyBtn.zPosition = ZPosStruct.buyCoinsButton
        addChild(buyBtn)
        
        let crown = SKSpriteNode(imageNamed: "crown")
        crown.anchorPoint = CGPoint(x: 0, y: 1)
        crown.position = CGPoint(x: -325, y: -340)
        crown.zPosition = ZPosStruct.levelUpIcon
        addChild(crown)

        let levelContainer = SKSpriteNode(color: .brown, size: CGSize(width: 410, height: 30))
        levelContainer.position = CGPoint(x: -35, y: -400)
        levelContainer.zPosition = ZPosStruct.levelUpContainer
        addChild(levelContainer)
        
        let levelBar = SKSpriteNode(color: .yellow, size: CGSize(width: 400, height: 20))
        levelBar.position = CGPoint(x: -35, y: -400)
        levelBar.zPosition = ZPosStruct.levelUpBar
        addChild(levelBar)
        
        let creditMeterContainer = SKShapeNode()
        creditMeterContainer.path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 240, height: 50), cornerRadius: 8).cgPath
        creditMeterContainer.fillColor = .black
        creditMeterContainer.position = CGPoint(x: -305, y: 600)
        creditMeterContainer.zPosition = ZPosStruct.creditMeterContainer
        addChild(creditMeterContainer)
        
        let creditMeterLabel = SKLabelNode(fontNamed: "Arial Narrow")
        creditMeterLabel.fontSize = 24
        creditMeterLabel.text = "CRE"
        creditMeterLabel.position = CGPoint(x: -275, y: 615)
        creditMeterLabel.zPosition = ZPosStruct.creditMeterLabel
        addChild(creditMeterLabel)
        
        let winMeterContainer = SKShapeNode()
        winMeterContainer.path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 240, height: 50), cornerRadius: 8).cgPath
        winMeterContainer.fillColor = .black
        winMeterContainer.position = CGPoint(x: 70, y: 600)
        winMeterContainer.zPosition = ZPosStruct.winMeterContainer
        addChild(winMeterContainer)
        
        let winMeterLabel = SKLabelNode(fontNamed: "Arial Narrow")
        winMeterLabel.fontSize = 24
        winMeterLabel.text = "WIN"
        winMeterLabel.position = CGPoint(x: 100, y: 615)
        winMeterLabel.zPosition = ZPosStruct.winMeterLabel
        addChild(winMeterLabel)
        
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
        minus.position = CGPoint(x: -260, y: -500)
        minus.zPosition = ZPosStruct.decreaseBetButton
        addChild(minus)
        
        let betMeterContainer = SKShapeNode()
        betMeterContainer.path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 240, height: 50), cornerRadius: 8).cgPath
        betMeterContainer.fillColor = .black
        betMeterContainer.position = CGPoint(x: -250, y: -505)
        betMeterContainer.zPosition = ZPosStruct.betMeterContainer
        addChild(betMeterContainer)
        
        let betMeterLabel = SKLabelNode(fontNamed: "Arial Narrow")
        betMeterLabel.fontSize = 24
        betMeterLabel.text = "BET"
        betMeterLabel.position = CGPoint(x: -220, y: -490)
        betMeterLabel.zPosition = ZPosStruct.betMeterAmount
        addChild(betMeterLabel)
        
        let plus = SKSpriteNode(imageNamed: "plus")
        plus.anchorPoint = CGPoint(x: 1, y: 0)
        plus.position = CGPoint(x: 50, y: -500)
        plus.zPosition = ZPosStruct.increaseBetButton
        addChild(plus)

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
