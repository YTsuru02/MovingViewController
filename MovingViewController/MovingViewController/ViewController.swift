//
//  ViewController.swift
//  MovingViewController
//
//  Created by 鶴貝康男 on 2015/10/31.
//  Copyright (c) 2015年 鶴貝康男. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var MVController: UIView!
    @IBOutlet weak var MV: UITableView!
    @IBOutlet weak var targetTopView: UIView!
    @IBOutlet weak var targetBottomView: UIView!
    @IBOutlet weak var Constraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var view = MovingViewController()
        view = self.view as MovingViewController
        
        view.MovingViewContoroller = self.MVController
        view.MovingView = self.MV
        view.TargetTopView = self.targetTopView
        view.TargetBottomView = self.targetBottomView
        view.Constraint = self.Constraint
        view.set()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

