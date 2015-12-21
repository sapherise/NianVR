//
//  ViewController.swift
//  SceneKitLumberjackDemo
//
//  Created by Munahil Murrieum on 19/11/2015.
//  Copyright © 2015 Munahil Murrieum. All rights reserved.
//

import UIKit
import SceneKit
import CoreMotion

class ViewController: UIViewController {
    
    var stage: SCNView!
    var button: UIButton!
    var penguin: SCNNode!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        
        // 舞台
        stage = SCNView(frame: CGRectMake(globalWidth/2 - 160, globalHeight/2 - 160, 320, 320))
        stage.allowsCameraControl = true
        stage.autoenablesDefaultLighting = true
        stage.backgroundColor = UIColor.yellowColor()
        self.view.addSubview(stage)
        self.view.backgroundColor = UIColor.yellowColor()
        stage.scene = SCNScene(named: "penguin.dae")
        
        // 摄像机
//        let camera = SCNCamera()
//        camera.zNear = 0.01
//        let cameraNode = SCNNode()
//        cameraNode.position = SCNVector3(3, -3, 1.5)
//        cameraNode.camera = camera
//        stage.scene?.rootNode.addChildNode(cameraNode)
        
        // 企鹅
        penguin = stage.scene!.rootNode.childNodeWithName("penguin", recursively: true)
        
        // 按钮
        button = UIButton(frame: CGRectMake(globalWidth/2 - 50, globalHeight - 32 - 100, 100, 32))
        button.backgroundColor = SeaColor
        button.setTitle("旋转", forState: UIControlState())
        button.setTitleColor(UIColor.whiteColor(), forState: UIControlState())
        button.titleLabel?.font = UIFont.systemFontOfSize(12)
        button.layer.cornerRadius = 16
        button.layer.masksToBounds = true
        button.addTarget(self, action: "onClick", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
    }
    
    func onClick() {
        let animation: CABasicAnimation = CABasicAnimation(keyPath: "rotation")
        animation.toValue = NSValue(SCNVector4: SCNVector4(x: 0, y: 1, z: 0, w: Float(M_PI)*2))
        animation.duration = 5
        animation.repeatCount = MAXFLOAT
        penguin.addAnimation(animation, forKey: nil)
    }
}

