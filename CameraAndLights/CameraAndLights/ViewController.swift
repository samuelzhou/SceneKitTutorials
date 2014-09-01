//
//  ViewController.swift
//  CameraAndLights
//
//  Created by Samuel Zhou on 8/31/14.
//  Copyright (c) 2014 Samtina Studio. All rights reserved.
//
//  This file contains the demo code for the Part 2 of SceneKit Tutorial
//

import UIKit
import SceneKit

class ViewController: UIViewController {
    var myView : SCNView?
    override func viewDidLoad() {
        super.viewDidLoad()
    
        myView = SCNView(frame: self.view.frame)
        let myScene = SCNScene()
        myView?.scene = myScene
        
        // You can uncomment the following line when no custom light there.
        myView?.autoenablesDefaultLighting = true
        
        myView?.allowsCameraControl = true
        myView?.showsStatistics = true

        let myBox = SCNBox(width: 15, height: 10, length: 12, chamferRadius: 0)
        let myBoxNode = SCNNode(geometry: myBox)
        myBoxNode.position = SCNVector3(x: 0, y: 0, z: 0)
        myScene.rootNode.addChildNode(myBoxNode)
        
        //
        // Demo a sample Camera in scene
        //
        let myCamera = SCNCamera()
        myCamera.xFov = 40
        myCamera.yFov = 40
        let myCameraNode = SCNNode()
        myCameraNode.camera = myCamera
        myCameraNode.position = SCNVector3(x: -25, y: 20, z: 30)
        myCameraNode.orientation = SCNQuaternion(x: -0.26, y: -0.32, z: 0, w: 0.91)
        myScene.rootNode.addChildNode(myCameraNode)
        
        //
        // Demo Omni Light by uncommenting the following snippet
        //
        /*
        let myOmniLight = SCNLight()
        let myOmniLightNode = SCNNode()
        myOmniLight.type = SCNLightTypeOmni
        myOmniLight.color = UIColor.yellowColor()
        myOmniLightNode.light = myOmniLight
        myOmniLightNode.position = SCNVector3(x: -30, y: 30, z: 60)
        myScene.rootNode.addChildNode(myOmniLightNode)
        */

        //
        // Demo Ambient Light by uncommenting the following snippet
        //
        /*
        let myAmbientLight = SCNLight()
        myAmbientLight.type = SCNLightTypeAmbient
        myAmbientLight.color = UIColor.yellowColor()
        let myAmbientLightNode = SCNNode()
        myAmbientLightNode.light = myAmbientLight
        myScene.rootNode.addChildNode(myAmbientLightNode)
        */
        
        //
        // Demo Direct Light by uncommenting the following snippet
        //
        /*
        let myDirectLight = SCNLight()
        myDirectLight.type = SCNLightTypeDirectional
        myDirectLight.color = UIColor.yellowColor()
        let myDirectLightNode = SCNNode()
        myDirectLightNode.light = myDirectLight
        myDirectLightNode.orientation = SCNQuaternion(x: 0, y: 0, z: 1, w: 0)
        myScene.rootNode.addChildNode(myDirectLightNode)
        */

        //
        // Demo Spot Light by uncommenting the following snippet
        //
        /*
        let mySpotLight = SCNLight()
        mySpotLight.type = SCNLightTypeSpot
        mySpotLight.color = UIColor.yellowColor()
        let mySpotLightNode = SCNNode()
        mySpotLightNode.light = mySpotLight
        mySpotLightNode.position = SCNVector3(x: 0, y: 0, z: 20)
        mySpotLightNode.orientation = SCNQuaternion(x: 0, y: 0, z: 1, w: 0.5)
        myScene.rootNode.addChildNode(mySpotLightNode)
        */

        self.view.addSubview(myView!)
    }
    
    override func touchesEnded(touches: NSSet!, withEvent event: UIEvent!) {
        //
        // In this delegate, you can get the positions and orientations of camera
        // when setting allowsCameraControl to true.
        //
        let quaternion = myView?.pointOfView.orientation
        let position = myView?.pointOfView.position
        println("Orientation: (\(quaternion?.x),\(quaternion?.y),\(quaternion?.z),\(quaternion?.w)) Position: (\(position?.x),\(position?.y),\(position?.z)")
    }
}

