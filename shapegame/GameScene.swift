//
//  GameScene.swift
//  shapegame
//
//  Created by Cameron on 1/24/17.
//  Copyright © 2017 Cameron. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    private var shape = SKShapeNode()
    
    override func didMove(to view: SKView) {
        
        self.physicsWorld.gravity = CGVector( dx: 0.0, dy: -5.0)
        self.physicsWorld.contactDelegate = self
        
        shape.path = UIBezierPath(roundedRect: CGRect(x: -128, y: -128, width: 100, height: 100), cornerRadius: 64).cgPath
        shape.fillColor = UIColor.red
        shape.lineWidth = 0
        shape.physicsBody = SKPhysicsBody(circleOfRadius: shape.xScale)
        shape.physicsBody?.isDynamic = true
        self.addChild(shape)
    }
    
    
    func touchMoved(touch: UITouch) {
        
        self.shape.physicsBody?.velocity = CGVector( dx: 0.0, dy: ((self.shape.physicsBody?.velocity.dy)! + (touch.force * 10)))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(touch: t) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(touch: t) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(touch: t) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(touch: t) }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
