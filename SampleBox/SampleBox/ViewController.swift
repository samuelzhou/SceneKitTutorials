//
//  ViewController.swift
//  SampleBox
//
//  Created by Samuel Zhou on 8/27/14.
//  Copyright (c) 2014 Samtina Studio. All rights reserved.
//
//  This file contains the demo code for the Part 1 of SceneKit Tutorial
//

import UIKit
import SceneKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        Part 1 : Create a SceneKit Project
        */
        
        //
        // Create Objects for SCNView and SCNScene
        //
        let myView = SCNView(frame: self.view.frame)
        let myScene = SCNScene()
        myView.scene = myScene

        //
        // Properties of SCNView
        //
        myView.autoenablesDefaultLighting = true
        myView.allowsCameraControl = true
        myView.showsStatistics = true

        //
        // Create an object of SCNBox which is derived from SCNGeometry
        //
        let myBox = SCNBox(width: 15, height: 10, length: 12, chamferRadius: 0)
        let myBoxNode = SCNNode(geometry: myBox)
        myBoxNode.position = SCNVector3(x: 0, y: 0, z: 0)
        myBoxNode.rotation = SCNVector4(x: 1, y: 1, z: 0.5, w: 0.6)
        myScene.rootNode.addChildNode(myBoxNode)
        
        //
        // Create an object of SCNLight so that we can see the object
        //
        let myLight = SCNLight()
        let myLightNode = SCNNode()
        myLight.type = SCNLightTypeOmni
        myLight.color = UIColor.yellowColor()
        myLightNode.light = myLight
        myLightNode.position = SCNVector3(x: -30, y: 30, z: 60)
        myScene.rootNode.addChildNode(myLightNode)
        
        //
        // Create an object of SCNCamera so that we can ajust our view to the scene
        //
        let myCamera = SCNCamera()
        myCamera.xFov = 50
        myCamera.yFov = 50
        let myCameraNode = SCNNode()
        myCameraNode.camera = myCamera
        myCameraNode.position = SCNVector3(x: -5, y: 10, z: 40)
        myScene.rootNode.addChildNode(myCameraNode)

        //
        // Add SCNView to current view
        //
        self.view.addSubview(myView)
    }
}

