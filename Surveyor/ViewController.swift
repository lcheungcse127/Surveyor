//
//  ViewController.swift
//  Surveyor
//
//  Created by Louis Cheung on 9/21/14.
//  Copyright (c) 2014 Louis Cheung. All rights reserved.
//

import AVFoundation
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cameraView: UIView!
    
    var captureSession: AVCaptureSession!
    var cameraPreview: AVCaptureVideoPreviewLayer!

// --------------------------------------------------------------------------------------------------- MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

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

    override func viewDidLayoutSubviews() {
        // Configure the camera preview layer.
        self.cameraPreview.videoGravity = AVLayerVideoGravityResizeAspectFill
        self.cameraPreview.frame = CGRect(x: 0, y: 0, width: self.cameraView.frame.size.width,
            height: self.cameraView.frame.size.height)
    }
}
