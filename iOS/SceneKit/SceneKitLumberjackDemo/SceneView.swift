//
//  SceneView.swift
//  SceneKitLumberjackDemo
//
//  Created by Munahil Murrieum on 19/11/2015.
//  Copyright © 2015 Munahil Murrieum. All rights reserved.
//

import UIKit
import SceneKit

class SceneView: SCNView, OverlaySceneDelegate {

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    func commonInit()
    {
        print("commoninit")
        self.backgroundColor = UIColor.yellowColor()
        self.scene = SCNScene(named:"penguin.dae")
        self.allowsCameraControl = true
        self.autoenablesDefaultLighting = true
        
        
        let objectMaterial = SCNMaterial()
        
//        objectMaterial.diffuse.contents = UIImage(named: "lumberJack_diffuse2.png")
//        let node = self.scene!.rootNode.childNodeWithName("penguin", recursively: true)!
//        let a = node.childNodeWithName("body", recursively: true)
//        print(a)
//        a?.geometry?.firstMaterial = objectMaterial
////        let a = self.scene?.rootNode.childNodes
////        print(a)
//        node.geometry?.firstMaterial = objectMaterial
        
        let overlayScene = OverlayScene(size:UIScreen.mainScreen().bounds.size) //screenSize
        overlayScene.overlayDelegate = self
        
        self.overlaySKScene = overlayScene
        
        
//        let objectMaterial = SCNMaterial()
        objectMaterial.diffuse.contents = UIImage(named: "lumberJack_diffuse2.png")
        let node = self.scene!.rootNode.childNodeWithName("penguin", recursively: true)!
        let a = node.childNodeWithName("body", recursively: true)
        print(a)
        a!.geometry?.firstMaterial = objectMaterial
    }

    func changedToWhite(boolValue: Bool)
    {
        if (boolValue == false)
        {
            print("change Color OffWhite")
            let objectMaterial = SCNMaterial()
            objectMaterial.diffuse.contents = UIImage(named: "body_blue.png")
            let node = self.scene!.rootNode.childNodeWithName("penguin", recursively: true)!
            let a = node.childNodeWithName("body", recursively: true)
            print(a)
            print("==")
            print(node)
            a?.geometry?.firstMaterial = objectMaterial
//            node.geometry?.firstMaterial = objectMaterial
            
        }
        else
        {
            print("change Color Green")
            let objectMaterial = SCNMaterial()
            objectMaterial.diffuse.contents = UIImage(named: "body_blue.png")
            let node = self.scene!.rootNode.childNodeWithName("body", recursively: true)!
            node.geometry?.firstMaterial = objectMaterial
            
        }
        
    }

}
