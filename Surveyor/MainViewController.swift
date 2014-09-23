//
//  MainViewController.swift
//  Surveyor
//
//  Created by Louis Cheung on 9/21/14.
//  Copyright (c) 2014 Louis Cheung. All rights reserved.
//

import AVFoundation
import CoreMotion
import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var cameraView: UIView!

    @IBOutlet weak var angle1TextField: UITextField!
    @IBOutlet weak var angle2TextField: UITextField!
    @IBOutlet weak var distanceTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!

    var captureSession: AVCaptureSession!
    var cameraPreview: AVCaptureVideoPreviewLayer!

    var motionManger: CMMotionManager!

// --------------------------------------------------------------------------------------------------- MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureCameraPreview()
        self.configureMotionSensors()
    }

    override func viewDidLayoutSubviews() {
        // Configure the camera preview layer.
        self.cameraPreview.videoGravity = AVLayerVideoGravityResizeAspectFill
        self.cameraPreview.frame = CGRect(x: 0, y: 0, width: self.cameraView.frame.size.width,
            height: self.cameraView.frame.size.height)
    }

// ------------------------------------------------------------------------------------------------------- MARK: - Segue

    @IBAction func unwindBackToViewController(segue: UIStoryboardSegue) {

    }

// ---------------------------------------------------------------------------------------------- MARK: - User Interface

    // Make the status bar light to stand out over the camera preview.
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

// ----------------------------------------------------------------------------------------------- MARK: - Target Action

    @IBAction func touchGpsButton(sender: UIButton) {
        
    }

    @IBAction func touchResetButton(sender: UIButton) {
        self.angle1TextField.text = ""
        self.angle2TextField.text = ""
        self.distanceTextField.text = ""
        self.heightTextField.text = ""
    }

    @IBAction func touchCaptureAngleButton(sender: UIButton) {
        // Sample the device's current pitch, roll, and yaw.
        let attitude = self.motionManger.deviceMotion.attitude
        let attitudeString = String(format: "p%.3f r%.3f y%.3f", attitude.pitch, attitude.roll, attitude.yaw)

        if self.angle1TextField.text.isEmpty {
            self.angle1TextField.text = attitudeString
        }
        else if self.angle2TextField.text.isEmpty {
            self.angle2TextField.text = attitudeString
        }
    }

// ---------------------------------------------------------------------------------------------- MARK: - Helper Methods

    func configureCameraPreview() {
        // Create capture session.
        self.captureSession  = AVCaptureSession()
        self.captureSession.sessionPreset = AVCaptureSessionPresetHigh

        // Add the rear camera as the input device to the capture session.
        var error: NSError?
        let device = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
        let deviceInput = AVCaptureDeviceInput.deviceInputWithDevice(device, error: &error) as AVCaptureDeviceInput

        if let unwrappedObject = error {
            NSLog("<%@:%d> %@", __FILE__.lastPathComponent, __LINE__, unwrappedObject)
        }
        else {
            self.captureSession.addInput(deviceInput)
        }

        // Create the camera preview layer and add it to the view that displays the camera image.
        self.cameraPreview = AVCaptureVideoPreviewLayer(session: self.captureSession)
        self.cameraView.layer.addSublayer(self.cameraPreview)

        // Start the camera.
        self.captureSession.startRunning()
    }

    func configureMotionSensors() {
        self.motionManger = CMMotionManager()
        self.motionManger.startDeviceMotionUpdatesUsingReferenceFrame(CMAttitudeReferenceFrameXArbitraryZVertical)
    }
}
