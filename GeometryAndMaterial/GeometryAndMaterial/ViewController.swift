//
//  ViewController.swift
//  GeometryAndMaterial
//
//  Created by Samuel Zhou on 9/2/14.
//  Copyright (c) 2014 Samtina Studio. All rights reserved.
//
//  This file contains the demo code for the Part 3 of SceneKit Tutorial
//

import UIKit
import SceneKit

class ViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //
        // Create View and Scene
        //
        let myView = SCNView(frame: self.view.frame)
        let myScene = SCNScene()
        myView.scene = myScene
        myView.autoenablesDefaultLighting = true
        myView.allowsCameraControl = true
        myView.showsStatistics = true

        //
        // Create a floor (an infinite plain surface without round corner,
        // usually for background.)
        //
        let myFloor = SCNFloor()
        let myFloorNode = SCNNode(geometry: myFloor)
        myFloorNode.position = SCNVector3(x: 0, y: -10, z: 0)
        myScene.rootNode.addChildNode(myFloorNode)

        //
        // Create a sphere
        //
        let mySphere = SCNSphere(radius: 10)
        let mySphereNode = SCNNode(geometry: mySphere)
        mySphereNode.position = SCNVector3(x: -10, y: 0, z: 0)
        myScene.rootNode.addChildNode(mySphereNode)
        
        //
        // Create a pyramid
        //
        let myPyramid = SCNPyramid(width: 20, height: 20, length: 20)
        let myPyramidNode = SCNNode(geometry: myPyramid)
        myPyramidNode.position = SCNVector3(x: 20, y: -10, z: 0)
        myScene.rootNode.addChildNode(myPyramidNode)
        
        //
        // Create a material with image
        //
        let myStar = SCNMaterial()
        // Use the absolute path to refer the texture image file
        myStar.diffuse.contents = UIImage(contentsOfFile:
            "/Users/sam/git/SceneKitTutorials/Images/star.jpg")
        myStar.reflective.contents = UIColor.blueColor()
        
        //
        // Create a material with single color
        //
        let myBlue = SCNMaterial()
        myBlue.diffuse.contents = UIColor.blueColor()
        myBlue.reflective.contents = UIColor.whiteColor()

        myPyramid.materials = [myStar, myBlue]
        myFloor.materials = [myStar, myBlue]
        mySphere.materials = [myStar, myBlue]

        //
        // Use reflectivity properties of SCNFloor
        //
//        myFloor.reflectivity = 0.75
//        myFloor.reflectionResolutionScaleFactor = 1.0
//        myFloor.reflectionFalloffStart = 0.3
//        myFloor.reflectionFalloffEnd = 10.0
        
        //
        // Create a 3D text
        //
        let myText = SCNText(string: "Sphere and Pyramid", extrusionDepth: 5)
        myText.font = UIFont(name: "Optima", size: 9)
        myText.materials = [myStar, myBlue]
        let myTextNode = SCNNode(geometry: myText)
        myTextNode.position = SCNVector3(x: -30, y: -10, z: 10)
        myScene.rootNode.addChildNode(myTextNode)

        //
        // Create a camera
        //
        let myCamera = SCNCamera()
        myCamera.xFov = 80
        myCamera.yFov = 80
        let myCameraNode = SCNNode()
        myCameraNode.camera = myCamera
        myCameraNode.position = SCNVector3(x: -25, y: 10, z: 30)
        myCameraNode.orientation = SCNQuaternion(x: -0.26, y: -0.32, z: 0, w: 0.91)
        myScene.rootNode.addChildNode(myCameraNode)

        self.view.addSubview(myView)
    }
}

