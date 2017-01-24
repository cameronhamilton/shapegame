//
//  ForceGestureRecognizer.swift
//  shapegame
//
//  Created by Cameron on 1/24/17.
//  Copyright © 2017 Cameron. All rights reserved.
//

import UIKit.UIGestureRecognizerSubclass
import UIKit

class ForceGestureRecognizer: UIGestureRecognizer {
    
    var forceValue: CGFloat = 0
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        handleForceWithTouches(touches: touches)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent) {
        handleForceWithTouches(touches: touches)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent) {
        handleForceWithTouches(touches: touches)
    }
    
    func handleForceWithTouches(touches: Set<UITouch>) {
        
        for touch in touches {
            let location = touch.location(in: view)
            
            let shape = SKShapeNode()
            shape.path = UIBezierPath(roundedRect: CGRect(x: -128, y: -128, width: 100, height: 100), cornerRadius: 64).cgPath
            shape.fillColor = UIColor.red
            shape.repeatCount = 1
            shape.position = location
            shape.fromValueForRadius = 0.5
            shape.keyTimeForHalfOpacity = 0.7
            shape.animationDuration = 0.8
            view.layer.addSublayer(shape)
        }
    }
}
