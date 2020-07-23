//
//  ViewController.swift
//  ARRuler
//
//  Created by Narayan Sajeev on 7/21/20.
//  Copyright © 2020 Narayan Sajeev. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
    
    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set the view's delegate
        sceneView.delegate = self
        
        // show statistics such as fps and timing information
        sceneView.showsStatistics = K.showsStatistics
        
        // show the yellow dots when AR analysis is being done
        sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        // run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // pause the view's session
        sceneView.session.pause()
    }
    
    /// When touches are detected
    /// - Parameters:
    ///   - touches: the list of touches detected
    ///   - event: the event to which the touches belong
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // try to access the first touch detected
        // and retrieve its location on the screen (sceneView)
        if let touchLocation = touches.first?.location(in: sceneView) {
            
            // perform a hit test with the location we found on the screen to see roughly where that point corresponds to in the real world
            // we want the result of the hit test to be in the form of a feature point
            // a feature point is a point detected by ARKit, but not a part of any detected plane
            
            // this hit test will yield a 3D location corresponding to the location clicked on the screen
            let hitTestResults = sceneView.hitTest(touchLocation, types: .featurePoint)
            
            // try to retrieve the first hit test result
            if let hitTestResult = hitTestResults.first {
                
                // add a dot at that location
                addDot(at: hitTestResult)
            }
            
        }
        
    }
    
    /// Add a dot at a specific 3D location
    /// - Parameter hitResult: the location of the dot
    func addDot(at hitResult: ARHitTestResult) {
        
        // create a dot as a 3D sphere with a radius of 0.5 cm
        let dotGeometry = SCNSphere(radius: 0.005)
        
        // create a material to go on the dot
        let material = SCNMaterial()
        
        // change the color to red
        material.diffuse.contents = UIColor.red
        
        // give this red color to the dotGeometry
        dotGeometry.materials = [material]
        
        // create a node with the geometry we made
        let dotNode = SCNNode(geometry: dotGeometry)
        
        // retrieve the x, y, and z values of the position of the hitResult
        // put those values into the position of the node
        dotNode.position = SCNVector3(hitResult.worldTransform.columns.3.x, hitResult.worldTransform.columns.3.y, hitResult.worldTransform.columns.3.z)
        
        // display the node
        sceneView.scene.rootNode.addChildNode(dotNode)
        
    }
    
}
