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
    
    var firstSpin = true
    var jpEnabled = false
    
    static let sideMargin:CGFloat = 50
    static let bufferX:CGFloat = 40
    static let minX:CGFloat = -375
    
    static let reel0X:CGFloat = minX + sideMargin + 0*162.5// + 1*bufferX
    static let reel1X:CGFloat = minX + sideMargin + 1*162.5// + 1*bufferX
    static let reel2X:CGFloat = minX + sideMargin + 2*162.5// + 1*bufferX
    static let reel3X:CGFloat = minX + sideMargin + 3*162.5// + 1*bufferX
    
    static let topMargin:CGFloat = 200
    static let maxY:CGFloat = 667
    
    static let elementHeight:CGFloat = 80
    static var reel0Y:CGFloat = maxY - topMargin - 0*elementHeight
    static var reel1Y:CGFloat = maxY - topMargin - 1*elementHeight
    static var reel2Y:CGFloat = maxY - topMargin - 2*elementHeight
    static var reel3Y:CGFloat = maxY - topMargin - 3*elementHeight
    static var reel4Y:CGFloat = maxY - topMargin - 4*elementHeight
    static var reel5Y:CGFloat = maxY - topMargin - 5*elementHeight
    static var reel6Y:CGFloat = maxY - topMargin - 6*elementHeight
    static var reel7Y:CGFloat = maxY - topMargin - 7*elementHeight
    static var reel8Y:CGFloat = maxY - topMargin - 8*elementHeight
    static var reel9Y:CGFloat = maxY - topMargin - 9*elementHeight
    
    static var reelContainer0 = ReelContainer(spriteNodes: [])
    static var reelContainer1 = ReelContainer(spriteNodes: [])
    static var reelContainer2 = ReelContainer(spriteNodes: [])
    static var reelContainer3 = ReelContainer(spriteNodes: [])
    static var reelContainers:[ReelContainer] = []
    
    static var nextContainer0 = ReelContainer(spriteNodes: [])
    static var nextContainer1 = ReelContainer(spriteNodes: [])
    static var nextContainer2 = ReelContainer(spriteNodes: [])
    static var nextContainer3 = ReelContainer(spriteNodes: [])
    static var nextContainers:[ReelContainer] = []
    
    static var reelContainersStartingYPos_Old:CGFloat = 840*2 + 84*176
    static var reelContainersStartingYPos:CGFloat = 84*6
    static var reelContainersEndingYPos:CGFloat = 84*7 //NOTE: Don't use the first row of the container. Start at the second row for win evaluation.
    
    func sprite(reelX:Int, reelY:Int) -> SKSpriteNode {
        let rand = arc4random_uniform(10)
        
        switch rand {
        case 0: return SKSpriteNode(imageNamed:"10 card")
        case 1: return SKSpriteNode(imageNamed:"Ace")
        case 2: return SKSpriteNode(imageNamed:"Bare")
        case 3: return SKSpriteNode(imageNamed:"Dog")
        case 4: return SKSpriteNode(imageNamed:"Jack")
        case 5: return SKSpriteNode(imageNamed:"King")
        case 6: return SKSpriteNode(imageNamed:"Lion")
        case 7: return SKSpriteNode(imageNamed:"Panda")
        case 8: return SKSpriteNode(imageNamed:"Puss")
        case 9: return SKSpriteNode(imageNamed:"Queen")
        default: return SKSpriteNode(color: .clear, size: CGSize(width: 1, height: 1))
        }
    }
    
    func generateReelSprites() -> [SKSpriteNode] {
        var sprites:[SKSpriteNode] = []
        
        for _ in 0..<200 {
            let element = sprite(reelX: 0, reelY: 0)
            sprites.append(element)
        }
        
        return sprites
    }
    
    func firstFullSpinAction() {
        let moveDown = SKAction.moveBy(x: 0, y: -84*189, duration: 2)
        let wait = SKAction.wait(forDuration: 0.1)
        var actions:[SKAction] = []
        
        for reelContainer in GameScene.reelContainers {
            let containerSpin = SKAction.run {
                reelContainer.run(moveDown)
            }
            
            actions.append(containerSpin)
            actions.append(wait)
        }
        
        run(SKAction.sequence(actions))
    }
    
    func createNextContainers() {
        GameScene.nextContainer0 = ReelContainer(spriteNodes: generateReelSprites())
        GameScene.nextContainer1 = ReelContainer(spriteNodes: generateReelSprites())
        GameScene.nextContainer2 = ReelContainer(spriteNodes: generateReelSprites())
        GameScene.nextContainer3 = ReelContainer(spriteNodes: generateReelSprites())
        
        GameScene.nextContainer0.anchorPoint = CGPoint(x: 0.5, y: 1)
        GameScene.nextContainer1.anchorPoint = CGPoint(x: 0.5, y: 1)
        GameScene.nextContainer2.anchorPoint = CGPoint(x: 0.5, y: 1)
        GameScene.nextContainer3.anchorPoint = CGPoint(x: 0.5, y: 1)
        
        GameScene.nextContainer0.position = CGPoint(x: GameScene.reel0X, y: GameScene.reelContainersStartingYPos + 84*200)
        GameScene.nextContainer1.position = CGPoint(x: GameScene.reel1X, y: GameScene.reelContainersStartingYPos + 84*200)
        GameScene.nextContainer2.position = CGPoint(x: GameScene.reel2X, y: GameScene.reelContainersStartingYPos + 84*200)
        GameScene.nextContainer3.position = CGPoint(x: GameScene.reel3X, y: GameScene.reelContainersStartingYPos + 84*200)
        
        GameScene.nextContainer0.zPosition = ZPosStruct.reelContainer
        GameScene.nextContainer1.zPosition = ZPosStruct.reelContainer
        GameScene.nextContainer2.zPosition = ZPosStruct.reelContainer
        GameScene.nextContainer3.zPosition = ZPosStruct.reelContainer
        
        addChild(GameScene.nextContainer0)
        addChild(GameScene.nextContainer1)
        addChild(GameScene.nextContainer2)
        addChild(GameScene.nextContainer3)
        
        GameScene.nextContainers.append(GameScene.nextContainer0)
        GameScene.nextContainers.append(GameScene.nextContainer1)
        GameScene.nextContainers.append(GameScene.nextContainer2)
        GameScene.nextContainers.append(GameScene.nextContainer3)
    }
    
    override func didMove(to view: SKView) {
        
        GameScene.reelContainer0 = ReelContainer(spriteNodes: generateReelSprites())
        GameScene.reelContainer1 = ReelContainer(spriteNodes: generateReelSprites())
        GameScene.reelContainer2 = ReelContainer(spriteNodes: generateReelSprites())
        GameScene.reelContainer3 = ReelContainer(spriteNodes: generateReelSprites())
        
        GameScene.reelContainer0.anchorPoint = CGPoint(x: 0.5, y: 1)
        GameScene.reelContainer1.anchorPoint = CGPoint(x: 0.5, y: 1)
        GameScene.reelContainer2.anchorPoint = CGPoint(x: 0.5, y: 1)
        GameScene.reelContainer3.anchorPoint = CGPoint(x: 0.5, y: 1)
        
        GameScene.reelContainer0.position = CGPoint(x: GameScene.reel0X, y: GameScene.reelContainersStartingYPos)
        GameScene.reelContainer1.position = CGPoint(x: GameScene.reel1X, y: GameScene.reelContainersStartingYPos)
        GameScene.reelContainer2.position = CGPoint(x: GameScene.reel2X, y: GameScene.reelContainersStartingYPos)
        GameScene.reelContainer3.position = CGPoint(x: GameScene.reel3X, y: GameScene.reelContainersStartingYPos)
        
        GameScene.reelContainer0.zPosition = ZPosStruct.reelContainer
        GameScene.reelContainer1.zPosition = ZPosStruct.reelContainer
        GameScene.reelContainer2.zPosition = ZPosStruct.reelContainer
        GameScene.reelContainer3.zPosition = ZPosStruct.reelContainer
        
        addChild(GameScene.reelContainer0)
        addChild(GameScene.reelContainer1)
        addChild(GameScene.reelContainer2)
        addChild(GameScene.reelContainer3)
        
        GameScene.reelContainers.append(GameScene.reelContainer0)
        GameScene.reelContainers.append(GameScene.reelContainer1)
        GameScene.reelContainers.append(GameScene.reelContainer2)
        GameScene.reelContainers.append(GameScene.reelContainer3)
        
        createNextContainers()
        
        
        let reelSurrounds = SKSpriteNode(imageNamed: "reelSurrounds")
        reelSurrounds.zPosition = ZPosStruct.reelSurrounds
        addChild(reelSurrounds)
        
        let reelsBackground = SKSpriteNode(imageNamed: "reelsBackground")
        reelsBackground.position = CGPoint(x: 0, y: 96)
        reelsBackground.zPosition = ZPosStruct.reelsBackground
        addChild(reelsBackground)
        
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
        crown.name = "crown"
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
        spinBtn.name = "spin"
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
    
    func partialSpinAction() -> SKAction {
        let moveDown = SKAction.moveBy(x: 0, y: -84*11, duration: 0.1164021163998)
        let wait = SKAction.wait(forDuration: 0.1)
        var actions:[SKAction] = []
        
        for reelContainer in GameScene.reelContainers {
            let containerSpin = SKAction.run {
                reelContainer.run(moveDown)
            }
            
            actions.append(containerSpin)
            actions.append(wait)
        }
        
        let sequence = SKAction.sequence(actions)
        return sequence
    }
    
    func secondaryFullSpinAction() -> SKAction {
//        let moveDown = SKAction.moveBy(x: 0, y: -84*189 - 84*10, duration: 2)
        let moveDown = SKAction.moveBy(x: 0, y: -84*189 + 84*10, duration: 2)
        let wait = SKAction.wait(forDuration: 0.1)
        var actions:[SKAction] = []
        
        for reelContainer in GameScene.nextContainers {
            let containerSpin = SKAction.run {
                reelContainer.run(moveDown)
            }
            
            actions.append(containerSpin)
            actions.append(wait)
        }
        
        let sequence = SKAction.sequence(actions)
        return sequence
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            let node = childNode(withName: "spin")
            if (node?.frame.contains(location))! {

                let group = SKAction.group([partialSpinAction(), secondaryFullSpinAction()])
                
                let createNext = SKAction.run {
                    GameScene.nextContainers.removeAll()
                    self.createNextContainers()
                    
                    GameScene.reelContainers.removeAll()
                    
                    GameScene.reelContainer0 = GameScene.nextContainer0
                    GameScene.reelContainer1 = GameScene.nextContainer1
                    GameScene.reelContainer2 = GameScene.nextContainer2
                    GameScene.reelContainer3 = GameScene.nextContainer3
                    
                    GameScene.reelContainers.append(GameScene.reelContainer0)
                    GameScene.reelContainers.append(GameScene.reelContainer1)
                    GameScene.reelContainers.append(GameScene.reelContainer2)
                    GameScene.reelContainers.append(GameScene.reelContainer3)
                }
                
                let sequence:SKAction?
                if jpEnabled {
                    
                    let jpImage = SKSpriteNode(imageNamed: "trumpFunny")
                    jpImage.zPosition = 2000
                    jpImage.position = CGPoint(x: 800, y: 0)
                    addChild(jpImage)
                    let jpAnimation = SKAction.move(to: CGPoint.zero, duration: 1)
                    
                    let show = SKAction.run {
                        jpImage.run(jpAnimation)
                    }
                    
                    let wait = SKAction.wait(forDuration: 1)
                    
                    
                    
                    let dropMoney = SKAction.run {
                        let money = SKSpriteNode(imageNamed: "Trump Dollar")
                        let randX = arc4random_uniform(750)
//                        money.position = CGPoint(x: Int(randX) - 375, y: 800)
                        money.position = CGPoint(x: 175, y: 100)
                        money.zPosition = 3000
                        self.addChild(money)
                        
                        let randTime = arc4random_uniform(30) / 10
//                        let fall = SKAction.moveBy(x: 0, y: -1600, duration: TimeInterval(randTime))
                        let fall = SKAction.moveBy(x: 0, y: -1600, duration: 4)
                        money.run(fall)
                    }
                    
                    let forever = SKAction.repeatForever(dropMoney)
                    
                    
                    sequence = SKAction.sequence([group, createNext, show, wait, forever])
                } else {
                    sequence = SKAction.sequence([group, createNext])
                }

                run(sequence!)
            }
            
            
            let node2 = childNode(withName: "crown")
            if (node2?.frame.contains(location))! {
                jpEnabled = true
            }
        }
    }
    
    func showJackpot() {
        //
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
