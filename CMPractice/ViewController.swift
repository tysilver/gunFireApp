//
//  ViewController.swift
//  CMPractice
//
//  Created by Tyler Silverman on 11/17/15.
//  Copyright © 2015 Tyler Silverman. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    //Instance Variables
    
    var currentMaxAccelX: Double = 0.0
    var currentMaxAccelY: Double = 0.0
    var currentMaxAccelZ: Double = 0.0
    var currentMaxRotX: Double = 0.0
    var currentMaxRotY: Double = 0.0
    var currentMaxRotZ: Double = 0.0
    
    var motionManager = CMMotionManager()
    
    //Outlets
    
    @IBOutlet var accX: UILabel?
    @IBOutlet var accY: UILabel?
    @IBOutlet var accZ: UILabel?
    @IBOutlet var maxAccX: UILabel?
    @IBOutlet var maxAccY: UILabel?
    @IBOutlet var maxAccZ: UILabel?
    @IBOutlet var rotX: UILabel?
    @IBOutlet var rotY: UILabel?
    @IBOutlet var rotZ: UILabel?
    @IBOutlet var maxRotX: UILabel?
    @IBOutlet var maxRotY: UILabel?
    @IBOutlet var maxRotZ: UILabel?
    
    //Functions
    
    @IBAction func resetMaxValues() {
        currentMaxAccelX = 0
        currentMaxAccelY = 0
        currentMaxAccelZ = 0
        
        currentMaxRotX = 0
        currentMaxRotY = 0
        currentMaxRotZ = 0
    }
    
    override func viewDidLoad() {
        
        self.resetMaxValues()
        
        motionManager.accelerometerUpdateInterval = 0.2
        motionManager.gyroUpdateInterval = 0.2
        
        motionManager.startAccelerometerUpdatesToQueue(NSOperationQueue.mainQueue(), withHandler: { (accelerometerData, NSError) -> Void in
            self.outputAccelerationData(accelerometerData!.acceleration)
        })
        
        motionManager.startGyroUpdatesToQueue(NSOperationQueue.mainQueue(), withHandler: { (gyroData, NSError) -> Void in
            self.outputRotationData(gyroData!.rotationRate)
        })
    }
    
    func outputAccelerationData(acceleration: CMAcceleration) {
        accX?.text = "\(acceleration.x).2fg"
        
        if fabs(acceleration.x) > fabs(currentMaxAccelX) {
            currentMaxAccelX = acceleration.x
        }
        accY?.text = "\(acceleration.y).2fg"
        
        if fabs(acceleration.y) > fabs(currentMaxAccelY) {
            currentMaxAccelY = acceleration.y
        }
        accZ?.text = "\(acceleration.z).2fg"
        
        if fabs(acceleration.z) > fabs(currentMaxAccelZ) {
            currentMaxAccelZ = acceleration.z
        }
        
        maxAccX?.text = "\(currentMaxAccelX) .2f"
        maxAccY?.text = "\(currentMaxAccelY) .2f"
        maxAccZ?.text = "\(currentMaxAccelZ) .2f"
    }
    
    func outputRotationData(rotation: CMRotationRate) {
        rotX?.text = "\(rotation.x).2fr/s"
        
        if fabs(rotation.x) > fabs(currentMaxRotX) {
            currentMaxRotX = rotation.x
        }
        rotY?.text = "\(rotation.y).2fr/s"
        
        if fabs(rotation.y) > fabs(currentMaxRotY) {
            currentMaxRotY = rotation.y
        }
        rotZ?.text = "\(rotation.z).2fr/s"
        
        if fabs(rotation.z) > fabs(currentMaxRotZ) {
            currentMaxRotZ = rotation.z
        }
        
        maxRotX?.text = "\(currentMaxRotX) .2f"
        maxRotY?.text = "\(currentMaxRotY) .2f"
        maxRotZ?.text = "\(currentMaxRotZ) .2f"
    }
    
    
    var aButton:UIButton = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
    
    
    aButton.addTarget(self, action: Selector("holdRelease:"), forControlEvents: UIControlEvents.TouchUpInside);
    aButton.addTarget(self, action: Selector("HoldDown:"), forControlEvents: UIControlEvents.TouchDown)
    self.addSubview(testButton)
    
    //target functions
    func HoldDown(sender:UIButton)
    {
        println("hold down")
    }
    
    func holdRelease(sender:UIButton)
    {
        println("hold release")
    }
    
    
}

