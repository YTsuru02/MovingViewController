//
//  MovingViewController.swift
//  MovingViewController
//
//  Created by 鶴貝康男 on 2015/10/31.
//  Copyright (c) 2015年 鶴貝康男. All rights reserved.
//

import UIKit

class MovingViewController: UIView {

    var MovingViewContoroller:UIView
    var MovingView:UIView
    var Constraint:NSLayoutConstraint
    var TargetTopView:UIView
    var TargetBottomView:UIView
    var BackgroundView:UIView
    
    
    override init() {
        
        MovingViewContoroller = UIView()
        MovingView = UIView()
        Constraint = NSLayoutConstraint()
        TargetTopView = UIView()
        TargetBottomView = UIView()
        BackgroundView = UIView()
        
        super.init()
    }

    required init(coder aDecoder: NSCoder) {
        
        MovingViewContoroller = UIView()
        MovingView = UIView()
        Constraint = NSLayoutConstraint()
        TargetTopView = UIView()
        TargetBottomView = UIView()
        BackgroundView = UIView()

        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        
        MovingViewContoroller = UIView()
        MovingView = UIView()
        Constraint = NSLayoutConstraint()
        TargetTopView = UIView()
        TargetBottomView = UIView()
        BackgroundView = UIView()
        
        super.init(frame: frame)
    }
    
    func set() {
        
        let swipeUpGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "swipeUp")
        swipeUpGestureRecognizer.direction = UISwipeGestureRecognizerDirection.Up
        self.MovingViewContoroller.addGestureRecognizer(swipeUpGestureRecognizer)
        
        let swipeDownGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "swipeDown")
        swipeDownGestureRecognizer.direction = UISwipeGestureRecognizerDirection.Down
        self.MovingViewContoroller.addGestureRecognizer(swipeDownGestureRecognizer)
        
        let SPACE_FOR_TOP = ((self.TargetBottomView.center.y - self.TargetTopView.center.y) - self.TargetBottomView.bounds.size.height / 2 - self.TargetTopView.bounds.size.height / 2) - self.MovingViewContoroller.bounds.size.height
        
        self.BackgroundView.backgroundColor = UIColor.yellowColor()
        var ratio = self.Constraint.constant / SPACE_FOR_TOP
        self.BackgroundView.alpha = ratio
        
    }
    
    func swipeUp() {
        
        NSLog("swipeUp!")
        
        let SPACE_FOR_TOP = ((self.TargetBottomView.center.y - self.TargetTopView.center.y) - self.TargetBottomView.bounds.size.height / 2 - self.TargetTopView.bounds.size.height / 2) - self.MovingViewContoroller.bounds.size.height
        
        self.setNeedsUpdateConstraints()
        self.Constraint.constant = SPACE_FOR_TOP
        
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.layoutIfNeeded()
            }, completion: { _ in
            self.MovingViewContoroller.backgroundColor = UIColor.redColor()
                
            self.BackgroundView.backgroundColor = UIColor.yellowColor()
            self.BackgroundView.alpha = 1.0

        })
    }
    
    func swipeDown() {
        
        NSLog("swipeDown!")
        
        let SPACE_FOR_BOTTOM = 0.0 as CGFloat
        
        self.Constraint.constant = SPACE_FOR_BOTTOM
        
        self.MovingViewContoroller.backgroundColor = UIColor.redColor()
        
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.layoutIfNeeded()
            }, completion: { _ in
            self.MovingViewContoroller.backgroundColor = UIColor.redColor()
            self.BackgroundView.backgroundColor = UIColor.yellowColor()
            self.BackgroundView.alpha = 0.0

        })
        
        
    }
    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        
        let SPACE_FOR_TOP = ((self.TargetBottomView.center.y - self.TargetTopView.center.y) - self.TargetBottomView.bounds.size.height / 2 - self.TargetTopView.bounds.size.height / 2) - self.MovingViewContoroller.bounds.size.height
        
        let SPACE_FOR_BOTTOM = 0.0 as CGFloat
        var constraint_float = self.Constraint.constant
        
        
        let touch = touches.anyObject() as UITouch
        var location = touch.locationInView(self.MovingViewContoroller)
        
        self.setNeedsUpdateConstraints()
        
        if (self.Constraint.constant >= SPACE_FOR_TOP) {
            
            NSLog("Collision.")
            self.MovingViewContoroller.backgroundColor = UIColor.redColor()
            
            if (location.y > 0.0) {
                self.Constraint.constant = SPACE_FOR_TOP - 0.1
                return
            }
        
            self.Constraint.constant = SPACE_FOR_TOP
            
            
        } else if (self.Constraint.constant <= SPACE_FOR_BOTTOM) {
            
            NSLog("Collision.")
            self.MovingViewContoroller.backgroundColor = UIColor.redColor()
            
            if (location.y < 0.0) {
                self.Constraint.constant = SPACE_FOR_BOTTOM + 0.1
                return;
            }
            
            self.Constraint.constant = SPACE_FOR_BOTTOM
            
        } else {
            
            self.MovingViewContoroller.backgroundColor = UIColor.lightGrayColor();
            self.Constraint.constant -= location.y

            self.BackgroundView.backgroundColor = UIColor.yellowColor()
            var ratio = self.Constraint.constant / SPACE_FOR_TOP
            self.BackgroundView.alpha = ratio
            
        }
        
        UIView.animateWithDuration(0.01, animations: { () -> Void in
            self.layoutIfNeeded()
        })
        
        NSLog("Constraint->\(self.Constraint.constant)")
        NSLog("Moving->\(location.y)")
    }
    

}
