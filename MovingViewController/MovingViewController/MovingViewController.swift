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
    
    override init() {
        
        MovingViewContoroller = UIView()
        MovingView = UIView()
        Constraint = NSLayoutConstraint()
        TargetTopView = UIView()
        TargetBottomView = UIView()
        
        super.init()
    }

    required init(coder aDecoder: NSCoder) {
        
        MovingViewContoroller = UIView()
        MovingView = UIView()
        Constraint = NSLayoutConstraint()
        TargetTopView = UIView()
        TargetBottomView = UIView()
        
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        
        MovingViewContoroller = UIView()
        MovingView = UIView()
        Constraint = NSLayoutConstraint()
        TargetTopView = UIView()
        TargetBottomView = UIView()
        
        super.init(frame: frame)
    }


    func set() {
        
        let swipeUpGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "swipeUp")
        swipeUpGestureRecognizer.direction = UISwipeGestureRecognizerDirection.Up
        self.MovingViewContoroller.addGestureRecognizer(swipeUpGestureRecognizer)
        
        let swipeDownGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "swipeDown")
        swipeDownGestureRecognizer.direction = UISwipeGestureRecognizerDirection.Down
        self.MovingViewContoroller.addGestureRecognizer(swipeDownGestureRecognizer)
        
        
    }
    
    func swipeUp() {
        
        NSLog("swipeUp!")
        
        self.setNeedsUpdateConstraints()
        self.Constraint.constant = (UIScreen.mainScreen().bounds.size.height - (self.TargetTopView.center.y + self.TargetTopView.bounds.size.height / 2)) - self.MovingViewContoroller.bounds.height
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.layoutIfNeeded()
            }, completion: { _ in
            self.MovingViewContoroller.backgroundColor = UIColor.redColor()
        })
        
    }
    
    func swipeDown() {
        
        NSLog("swipeDown!")
        
        self.Constraint.constant = (UIScreen.mainScreen().bounds.size.height - (self.TargetBottomView.center.y + self.TargetBottomView.bounds.size.height / 2))
        
        self.MovingViewContoroller.backgroundColor = UIColor.redColor()
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.layoutIfNeeded()
            }, completion: { _ in
            self.MovingViewContoroller.backgroundColor = UIColor.redColor()
        })
        
        
    }
    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        
        let touch = touches.anyObject() as UITouch
        var location = touch.locationInView(self.MovingViewContoroller)
        
        self.setNeedsUpdateConstraints()
        
        NSLog("Constraint->%f", self.Constraint.constant)
        NSLog("Moving->%f", location.y)
        
        if (self.Constraint.constant >= (UIScreen.mainScreen().bounds.size.height - (self.TargetTopView.center.y + self.TargetTopView.bounds.size.height / 2)) - self.MovingViewContoroller.bounds.height) {
            
            NSLog("Collision.");
            self.MovingViewContoroller.backgroundColor = UIColor.redColor();
            
            if (location.y > 0.0) {
                self.Constraint.constant = ((UIScreen.mainScreen().bounds.size.height - (self.TargetTopView.center.y + self.TargetTopView.bounds.size.height / 2)) - self.MovingViewContoroller.bounds.height) - 0.1
                return
            }
            
            
            self.Constraint.constant = (UIScreen.mainScreen().bounds.size.height - (self.TargetTopView.center.y + self.TargetTopView.bounds.size.height / 2)) - self.MovingViewContoroller.bounds.height
            
            
        } else if (self.Constraint.constant <= (UIScreen.mainScreen().bounds.size.height - (self.TargetBottomView.center.y + self.TargetBottomView.bounds.size.height / 2))) {
            
            NSLog("Collision.")
            self.MovingViewContoroller.backgroundColor = UIColor.redColor()
            
            
            if (location.y < 0.0) {
                self.Constraint.constant = (UIScreen.mainScreen().bounds.size.height - (self.TargetBottomView.center.y + self.TargetBottomView.bounds.size.height / 2)) + 0.1
                return;
            }
            
            self.Constraint.constant = (UIScreen.mainScreen().bounds.size.height - (self.TargetBottomView.center.y + self.TargetBottomView.bounds.size.height / 2))
            
        } else {
            
            self.MovingViewContoroller.backgroundColor = UIColor.lightGrayColor();
            self.Constraint.constant -= location.y
        
        }
        
        UIView.animateWithDuration(0.01, animations: { () -> Void in
            self.layoutIfNeeded()
        })
    }
    

}
