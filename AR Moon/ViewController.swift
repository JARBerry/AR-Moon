//
//  ViewController.swift
//  AR Moon
//
//  Created by James and Ray Berry on 02/04/2018.
//  Copyright © 2018 JARBerry. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
    
    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
    
        // create 3D sphere shape
        
        let sphere = SCNSphere(radius: 0.2)
        
        let material = SCNMaterial()
        
        // overlay moon image on to sphere
        material.diffuse.contents = UIImage(named: "art.scnassets/8k_moon.jpg")
        
        sphere.materials = [material]
        
        let node = SCNNode()
        
        node.position = SCNVector3(x: 0, y: 0.1, z: -0.5)
        
        node.geometry = sphere
        
        // add nodes
        
        sceneView.scene.rootNode.addChildNode(node)
        
        sceneView.autoenablesDefaultLighting = true
        
        // Rotate the moon
        let action = SCNAction.rotateBy(x: 0, y: CGFloat(2 * Double.pi), z: 0, duration: 10)
        let repAction = SCNAction.repeatForever(action)
        node.runAction(repAction, forKey: "myrotate")
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
}
