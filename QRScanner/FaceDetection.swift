//
//  ViewController.swift
//  QRScanner
//
//  Created by Kirtikumar Pandya on 31.07.17.
//  Copyright © 2017 Kirtikumar Pandya. All rights reserved.
//

import UIKit
import AVFoundation

class FaceDetection: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
    var video = AVCaptureVideoPreviewLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let session = AVCaptureSession()
        
        let captureDevice = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        
        do {
            let input = try AVCaptureDeviceInput(device: captureDevice)
            session.addInput(input)
            
        } catch {
            print("Error")
        }
        
        let output = AVCaptureMetadataOutput()
        session.addOutput(output)
        
        output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        
        output.metadataObjectTypes = [AVMetadataObjectTypeFace]
        
        video = AVCaptureVideoPreviewLayer(session: session)
        video.frame = view.layer.bounds
        view.layer.addSublayer(video)
        
        session.startRunning()
        
    }
    
    func captureOutput(_ captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [Any]!, from connection: AVCaptureConnection!) {
//        if metadataObjects != nil && metadataObjects.count != 0 {
        
//            if let object = metadataObjects[0] as? AVMetadataMachineReadableCodeObject {
//                if object.type == AVMetadataObjectTypeFace {
        print(metadataObjects)
                    let alert = UIAlertController(title: "Human detection", message: " Human found", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Retake", style: .default, handler: nil))
//                    alert.addAction(UIAlertAction(title: "Copy", style: .default, handler: {(nil) in
//                        UIPasteboard.general.string = object.stringValue }))
                    present(alert, animated: true, completion: nil)
//                }
//            }
//        }
    }
 
    
}

