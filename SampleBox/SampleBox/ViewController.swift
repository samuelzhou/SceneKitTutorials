//
//  ViewController.swift
//  SampleBox
//
//  Created by Samuel Zhou on 8/27/14.
//  Copyright (c) 2014 Samtina Studio. All rights reserved.
//

import UIKit
import SceneKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    
        /*
            Part 1 : SCNView, SCNScene, SCNNode, SCNLight, SCNCamera
        */
        let myView = SCNView(frame: self.view.frame)
        let myScene = SCNScene()
        myView.scene = myScene
        myView.autoenablesDefaultLighting = true
        myView.allowsCameraControl = true
        myView.showsStatistics = true
        
        let myBox = SCNBox(width: 15, height: 10, length: 12, chamferRadius: 0)
        let myBoxNode = SCNNode(geometry: myBox)
        myBoxNode.position = SCNVector3(x: 0, y: 0, z: 0)
        myBoxNode.rotation = SCNVector4(x: 1, y: 1, z: 0.5, w: 0.6)
        myScene.rootNode.addChildNode(myBoxNode)
        
        let myLight = SCNLight()
        let myLightNode = SCNNode()
        myLight.type = SCNLightTypeOmni
        myLight.color = UIColor.yellowColor()
        myLightNode.light = myLight
        myLightNode.position = SCNVector3(x: -30, y: 30, z: 60)
        myScene.rootNode.addChildNode(myLightNode)
    
        let myCamera = SCNCamera()
        myCamera.xFov = 50
        myCamera.yFov = 50
        let myCameraNode = SCNNode()
        myCameraNode.camera = myCamera
        myCameraNode.position = SCNVector3(x: -5, y: 10, z: 40)
        myScene.rootNode.addChildNode(myCameraNode)
        
        self.view.addSubview(myView)
    }
}

