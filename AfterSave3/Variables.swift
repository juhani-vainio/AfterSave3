//
//  Variables.swift
//  AfterSave
//
//  Created by Juhani Vainio on 22/01/2018.
//  Copyright © 2018 JuhaniVainio. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit

struct variables {
    
    static var clockStoppedTime = Date()
    
    static var language = String("en")
    
    static var price = String("")
    
    static var isPremiumUser = Bool() {
        didSet {
            print("Premium User? :  \(isPremiumUser)")
        }
    }
    
    static var editButtons = Bool()
    static var torchOn = Bool()
    static var dimScreen = Bool()
    static var userBrightness = CGFloat(1.0)
    
    static var endTimeMoved = CMTime.zero
    
    static var customSave = Bool()
    static var dismissingTrimmer = Bool()
    static var composition = AVMutableComposition()
    static var mainComposition = AVMutableVideoComposition()
    
    static var sliderIsUp = Bool()
    static var exporting = Bool() {
        didSet {
            print("EXPORTING = \(exporting)")
        }
    }
    static var discSpace = Int64()
    static var durationForTimer = Double()
    static var b2HasValue = Bool()
    static var b3HasValue = Bool()
    static var b4HasValue = Bool()
    
    static var bMaxSeconds = Int()
    static var bMaxMinutes = Int()
    static var b1Seconds = Int()
    static var b1Minutes = Int()
    static var b2Seconds = Int()
    static var b2Minutes = Int()
    static var b3Seconds = Int()
    static var b3Minutes = Int()
    static var b4Seconds = Int()
    static var b4Minutes = Int()
    static var bCustomSeconds = Int()
    static var bCustomMinutes = Int()
    
    // each button has a time value in seconds
    static var button1Value = Double()
    static var button2Value = Double()
    static var button3Value = Double()
    static var button4Value = Double()
    static var maxButtonValue = Double()
    static var customButtonValue = Double()
    static var customStopTime = Double()
    
    static var customCount = Int()
    
    // session
    static var videoOutput = AVCaptureVideoDataOutput()
    static var audioDataOutput = AVCaptureAudioDataOutput()
    static var startCalled = false
    static var session:AVCaptureSession!
    static var cameraAccess: Bool!
    static var captureDevice : AVCaptureDevice?
    static var frontCamera = false
    static var audioSession = convertFromAVAudioSessionCategory(AVAudioSession.Category.playAndRecord)
    
     
    // Audio setting
    static let audioOutputSettings: Dictionary<String, AnyObject> = [
        AVFormatIDKey : Int(kAudioFormatMPEG4AAC) as AnyObject,
        AVNumberOfChannelsKey : 2 as AnyObject,
        AVSampleRateKey : 44100 as AnyObject
    ]
    // Video Settings
    static let videoOutputSettings: Dictionary<String, AnyObject> = [
        AVVideoCodecKey : AVVideoCodecH264 as AnyObject,
        AVVideoWidthKey : 1920 as NSNumber,
        AVVideoHeightKey : 1080 as NSNumber
    ]
    
    // Portrait Video Settings
    static let portraitVideoOutputSettings: Dictionary<String, AnyObject> = [
        AVVideoCodecKey : AVVideoCodecH264 as AnyObject,
        AVVideoWidthKey : 1080 as NSNumber,
        AVVideoHeightKey : 1920 as NSNumber
    ]
    
    static var isPortrait = Bool() 
    static var isLandscapeLeft = Bool()
    static var useFrontCamera = Bool()
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromAVAudioSessionCategory(_ input: AVAudioSession.Category) -> String {
	return input.rawValue
}
