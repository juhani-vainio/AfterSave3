//
//  ViewController.swift
//  AfterSave
//
//  Created by Juhani Vainio on 22/01/2018.
//  Copyright © 2018 JuhaniVainio. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController, AVCaptureAudioDataOutputSampleBufferDelegate, AVCaptureVideoDataOutputSampleBufferDelegate, UIGestureRecognizerDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var orientationButtonText: UILabel!
    @IBOutlet weak var settingsButtonBackground: UIView!
    @IBOutlet weak var upgradeHintView: UIView!
    @IBOutlet weak var upgradeHintText: UILabel!
    
    func mainRotation() -> Void {}
    
    @IBOutlet weak var updateRequiredView: UIView!
    
    // OUTLETS
    @IBOutlet weak var userInterface: UIView!
    
    static let shared = ViewController()
    
    @IBOutlet weak var portraitStatusViewBackground: UIView!
    @IBOutlet weak var portraitStatusView: UIView!
    @IBOutlet weak var portraitTimerView: UIView!
    @IBOutlet weak var portraitUIView: UIView!
    @IBOutlet weak var portraitTimerBackground: UIView!
    @IBOutlet weak var portraitIndicator: UIActivityIndicatorView!
    @IBOutlet weak var portraitStatusLabel: UILabel!
    @IBOutlet weak var portraitCheckMarkView: UIImageView!
    @IBOutlet weak var portraitSettingsButton: UIButton!
    
    
    
    @IBOutlet weak var stackViewBottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var landscapeUIView: UIView!
    @IBOutlet weak var progressBar: UIView!
    @IBOutlet weak var progressBarWidthConstant: NSLayoutConstraint!
    
    
    @IBOutlet weak var editQuickView: UIView!
    @IBOutlet weak var editQuickBackground: UIView!
    
    // UPGRADE BUTTON
    
    @IBOutlet weak var goPremiumPriceLabel: UILabel!
    @IBOutlet weak var upgradeButton: UIButton!
    @IBOutlet weak var goPremiumView: UIView!
    @IBOutlet weak var goPremiumView2: UIView!
    @IBOutlet weak var goPremiumButtonBackground: UIView!
    @IBOutlet weak var goPremiumButtonBackground2: UIView!
    @IBOutlet weak var editButtonsDoneView: UIView!
    
    
    // LEFT BUTTONS STACK
    @IBOutlet weak var leftButtonsStackView: UIStackView!
    
    // EDIT BUTTON
    @IBOutlet weak var editQuicSaveButtonsView: UIView!
    @IBOutlet weak var editQuickSaveTimesButton: UIButton!
    @IBOutlet weak var editQuicksaveButtonsBackgrounds: UIButton!
    @IBOutlet weak var editqsButtonsBackFrame: UIView!
    var editTapGesture = UITapGestureRecognizer()
    @IBOutlet weak var editShadeFrame: UIView!
    @IBOutlet weak var closeEditButtonsView: UIView!
    var closeEditViewTapGesture = UITapGestureRecognizer()
    
    // FLASH BUTTON
    @IBOutlet weak var flashButtonView: UIView!
    @IBOutlet weak var flashButton: UIButton!
    @IBOutlet weak var flashButtonBackground: UIButton!
    @IBOutlet weak var flashBackgroundFrame: UIView!
    var flashTapGesture = UITapGestureRecognizer()
    @IBOutlet weak var flashShadeFrame: UIView!
    
    // SETTINGS BUTTON
    @IBOutlet weak var settingsButton: UIButton!
    
    var settingsTapGesture = UITapGestureRecognizer()
    
    // ORIENTATION BUTTON
    @IBOutlet weak var orientationButtonView: UIView!
    @IBOutlet weak var orientationButton: UIButton!
    var orientationTapGesture = UITapGestureRecognizer()
    @IBOutlet weak var orientationShadeFrame: UIView!
    
    // FLIP BUTTON
    @IBOutlet weak var flipButtonView: UIView!
    @IBOutlet weak var flipButtonBackground: UIButton!
    @IBOutlet weak var flipButton: UIButton!
    var flipTapGesture = UITapGestureRecognizer()
    @IBOutlet weak var flipsShadeFrame: UIView!
    
    // REC BUTTON
    @IBOutlet weak var recordButtonView: UIView!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var recordButtonRing: UIView!
    var recordTapGesture = UITapGestureRecognizer()
    @IBOutlet weak var recordShadeFrame: UIView!
    @IBOutlet weak var redRecButton: UIView!
    
    
    
    
    @IBOutlet weak var interfaceView: UIView!
    
    @IBOutlet weak var leftInterfaceView: UIView!
    @IBOutlet weak var rightInterfaceView: UIView!
    
    // QUICKSAVE BUTTONS
    @IBOutlet weak var qsView1: UIView!
    @IBOutlet weak var button1View: UIView!
    @IBOutlet weak var quickSave1Button: UIButton!
    @IBOutlet weak var qs1ArrowButton: UIButton!
    @IBOutlet weak var quickSave1FillHeight: NSLayoutConstraint!
    @IBOutlet weak var quickSave1FillWidth: NSLayoutConstraint!
    @IBOutlet weak var qs1StackFrame: UIView!
    var qs1TapGesture = UITapGestureRecognizer()
    @IBOutlet weak var qs1Shade: UIView!
    
    @IBOutlet weak var qsView2: UIView!
    @IBOutlet weak var button2View: UIView!
    @IBOutlet weak var quickSave2Button: UIButton!
    @IBOutlet weak var qs2ArrowButton: UIButton!
    @IBOutlet weak var quickSave2FillHeight: NSLayoutConstraint!
    @IBOutlet weak var quickSave2FillWidth: NSLayoutConstraint!
    @IBOutlet weak var qs2StackFrame: UIView!
    var qs2TapGesture = UITapGestureRecognizer()
    @IBOutlet weak var qs2Shade: UIView!
    
    @IBOutlet weak var qsView3: UIView!
    @IBOutlet weak var button3View: UIView!
    @IBOutlet weak var quickSave3Button: UIButton!
    @IBOutlet weak var qs3ArrowButton: UIButton!
    @IBOutlet weak var quickSave3FillHeight: NSLayoutConstraint!
    @IBOutlet weak var quickSave3FillWidth: NSLayoutConstraint!
    @IBOutlet weak var qs3StackFrame: UIView!
    var qs3TapGesture = UITapGestureRecognizer()
    @IBOutlet weak var qs3Shade: UIView!
    
    @IBOutlet weak var qsView4: UIView!
    @IBOutlet weak var button4View: UIView!
    @IBOutlet weak var quickSave4Button: UIButton!
    @IBOutlet weak var qs4ArrowButton: UIButton!
    @IBOutlet weak var quickSave4FillHeight: NSLayoutConstraint!
    @IBOutlet weak var quickSave4FillWidth: NSLayoutConstraint!
    @IBOutlet weak var qs4StackFrame: UIView!
    var qs4TapGesture = UITapGestureRecognizer()
    @IBOutlet weak var qs4Shade: UIView!
    
    
    @IBOutlet weak var statusViewBackground: UIView!
    
    
    @IBOutlet weak var horizontalViewBackground: UIView!
    @IBOutlet weak var checkMarkView: UIImageView!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    
    @IBOutlet weak var dimButton: UIButton!
    
    @IBOutlet weak var forwardTimeLabel: UILabel!
    @IBOutlet weak var portraitForwardTimeLabel: UILabel!
    
    
    
    @IBOutlet weak var settingsBlurView = UIVisualEffectView(effect: UIBlurEffect(style: .extraLight))
    
    // TIMERS
    // timer for total video time
    weak var videoTimer: Timer?
    // timer for looping writer
    weak var timer: Timer?
    
    // OTHER
    
    var savedFocusPoint = CGPoint(x: 0.0, y: 0.0)
    
    var stopped = Bool()
    
    var stackDown = Bool(false)
    var stackLeft = Bool(false)
    
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var customSaveView: UIView!
    
    @IBOutlet weak var customButtonsViewBackground: UIView!
    
    
    @IBOutlet weak var darkBackView: UIView!
    
    
    @IBOutlet weak var editNormalsaveRingLarge: UIView!
    @IBOutlet weak var editNormalsaveRingSmall: UIView!
    
    
    //@IBOutlet weak var editButtonsBackgroundView: UIView!
    @IBOutlet weak var timePickerView1: UIPickerView!
    @IBOutlet weak var timePickerView2: UIPickerView!
    @IBOutlet weak var timePickerView3: UIPickerView!
    @IBOutlet weak var timePickerView4: UIPickerView!
    @IBOutlet weak var customSaveTimePicker: UIPickerView!
    
    @IBOutlet weak var editQuickButtonsView: UIView!
    @IBOutlet weak var quickSaveButtonsView: UIView!
    
    
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var portraitCurrentTimeLabel: UILabel!
    @IBOutlet weak var portraitClockBackground: UIView!
    @IBOutlet weak var clockBackground: UIView!
    
    var clock = Timer()
    
    override func viewDidAppear(_ animated: Bool) {
        setupUiForPremium()
        if variables.dismissingTrimmer == true {
            if variables.customSave == true {
                customSave()
            }
            else if variables.customSave == false {
                print("SAVE CANCELLED")
                variables.startCalled = false
                resetCamera()
                Helper.helper.clearAllFilesFromTempDirectory()
                continueRecording()
            }
        }
        if !variables.isPortrait {
            flipLandscapeOrientation()
        }
        
    }
    
    override var preferredScreenEdgesDeferringSystemGestures: UIRectEdge {
        return .all
    }
    
    @objc func tick() {
        portraitCurrentTimeLabel.text = DateFormatter.localizedString(from: Date(), dateStyle: .none, timeStyle: .medium)
        currentTimeLabel.text = DateFormatter.localizedString(from: Date(), dateStyle: .none, timeStyle: .medium)
    }
    
    @objc func handleOrientationTap() {
        
        orientationFlip()
        
    }
    
    @objc func handleFlipCameraTap(){
        flipCamera()
        
    }
    
    @objc func handleFlashTap() {
        flashToggle()
    }
    
    @objc func handleRecordTap() {
        if recordButton.isEnabled {
            recButtonAction()
        }
        
    }
    
    @objc func handleEditTap() {
        editAction()
    }
    
    @objc func handleEditClosingTap() {
        editAction()
    }
    
    func upgradeHint() {
        
        self.upgradeHintView.alpha = 0
        self.upgradeHintView.isHidden = false
        self.goPremiumView.shakes()
        self.upgradeButton.setTitleColor(Colors.main.color1, for: .normal)
        UIView.animate(withDuration: 0.25, animations: {
            self.upgradeHintView.alpha = 1
        }, completion: { _ in
            UIView.animate(withDuration: 1.75, animations: {
                self.upgradeHintView.alpha = 0
            }, completion: { _ in
                
                UIView.animate(withDuration: 1, animations: {
                    
                    self.upgradeHintView.isHidden = true
                }, completion: { _ in
                    self.goPremiumView.pulsates()
                    UIView.animate(withDuration: 1, animations: {
                        self.upgradeButton.setTitleColor(Colors.main.color3, for: .normal)
                    })
                })
            })
        })
        
    }
    
    
    @objc func qs1Tap() {
        if quickSave1Button.isEnabled == true {
            let time = String(quickSave1Button.currentTitle!)
            self.statusLabel.text = "Saving \(time)"
            self.portraitStatusLabel.text = "Saving \(time)"
            variables.startCalled = false
            stopCamera(quickSaveTime: variables.button1Value, count: variables.iCount!, stopTime: 0)
        }
        
    }
    
    @objc func qs2Tap() {
        if quickSave2Button.isEnabled == true {
            if !variables.isPremiumUser {
                // show alert "this is only for premium users , update now?"
                upgradeHintText.textColor = Colors.main.color2
                upgradeHint()
                print("Karvalakki user, can't use qs2 button")
            }
            else {
                let time = String(quickSave2Button.currentTitle!)
                self.statusLabel.text = "Saving \(time)"
                self.portraitStatusLabel.text = "Saving \(time)"
                variables.startCalled = false
                stopCamera(quickSaveTime: variables.button2Value, count: variables.iCount!, stopTime: 0)
            }
        }
    }
    
    @objc func qs3Tap() {
        if quickSave3Button.isEnabled == true {
            if !variables.isPremiumUser {
                // show alert "this is only for premium users , update now?"
                upgradeHintText.textColor = Colors.main.color3
                upgradeHint()
                
                print("Karvalakki user, can't use qs3 button")
            }
            else {
                let time = String(quickSave3Button.currentTitle!)
                self.statusLabel.text = "Saving \(time)"
                self.portraitStatusLabel.text = "Saving \(time)"
                variables.startCalled = false
                stopCamera(quickSaveTime: variables.button3Value, count: variables.iCount!, stopTime: 0)
            }
        }
    }
    @objc func qs4Tap() {
        if quickSave4Button.isEnabled == true {
            if !variables.isPremiumUser {
                // show alert "this is only for premium users , update now?"
                upgradeHintText.textColor = Colors.main.color4
                upgradeHint()
                print("Karvalakki user, can't use qs3 button")
            }
            else {
                let time = String(quickSave4Button.currentTitle!)
                self.statusLabel.text = "Saving \(time)"
                self.portraitStatusLabel.text = "Saving \(time)"
                variables.startCalled = false
                stopCamera(quickSaveTime: variables.button4Value, count: variables.iCount!, stopTime: 0)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Helper.helper.checkUserDefaults()
        orientationSet()
        
        self.qs1TapGesture = UITapGestureRecognizer(target: self, action: #selector(qs1Tap))
        self.qs1StackFrame.addGestureRecognizer(qs1TapGesture)
        self.qs1StackFrame.isUserInteractionEnabled = true
        
        self.qs2TapGesture = UITapGestureRecognizer(target: self, action: #selector(qs2Tap))
        self.qs2StackFrame.addGestureRecognizer(qs2TapGesture)
        self.qs2StackFrame.isUserInteractionEnabled = true
        
        self.qs3TapGesture = UITapGestureRecognizer(target: self, action: #selector(qs3Tap))
        self.qs3StackFrame.addGestureRecognizer(qs3TapGesture)
        self.qs3StackFrame.isUserInteractionEnabled = true
        
        self.qs4TapGesture = UITapGestureRecognizer(target: self, action: #selector(qs4Tap))
        self.qs4StackFrame.addGestureRecognizer(qs4TapGesture)
        self.qs4StackFrame.isUserInteractionEnabled = true
        
        self.orientationTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleOrientationTap))
        self.orientationButtonView.addGestureRecognizer(orientationTapGesture)
        self.orientationButtonView.isUserInteractionEnabled = true
        
        self.flipTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleFlipCameraTap))
        self.flipButtonView.addGestureRecognizer(flipTapGesture)
        self.flipButtonView.isUserInteractionEnabled = true
        
        self.flashTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleFlashTap))
        self.flashButtonView.addGestureRecognizer(flashTapGesture)
        self.flashButtonView.isUserInteractionEnabled = true
        
        self.recordTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleRecordTap))
        self.recordButtonView.addGestureRecognizer(recordTapGesture)
        self.recordButtonView.isUserInteractionEnabled = true
        
        self.editTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleEditTap))
        self.editQuicSaveButtonsView.addGestureRecognizer(editTapGesture)
        self.editQuicSaveButtonsView.isUserInteractionEnabled = true
        
        self.closeEditViewTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleEditClosingTap))
        self.closeEditButtonsView.addGestureRecognizer(closeEditViewTapGesture)
        self.closeEditButtonsView.isUserInteractionEnabled = true
        
        
        variables.userBrightness = UIScreen.main.brightness
        print(variables.userBrightness)
        
        clock = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector(self.tick) , userInfo: nil, repeats: true)
        
        
        // variables.isPortrait = false
        
        // PREVENT APP FROM GOING TO BACKGROUND
        UIApplication.shared.isIdleTimerDisabled = true
        
        stopped = false
        
        //indicator.stopAnimating()
        
        
        checkCoreData()
        variables.maxButtonValue = Helper.helper.calculateMaxSpace()
        setButtonVariables()
        setupInterface()
        
        // OBSERVE APP NOTIFICATIONS
        NotificationCenter.default.addObserver(self, selector:#selector(wakeUp), name: UIApplication.willEnterForegroundNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector:#selector(resign), name: UIApplication.willResignActiveNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector:#selector(goToSleep), name: UIApplication.didEnterBackgroundNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(flipLandscapeOrientation), name: UIDevice.orientationDidChangeNotification, object: nil)
        
        
        
        // Comment these for interface testing
        // uncomment for real device
        setVideoRecorder()
        setWriterDirectory()
        continueRecording()
        setCamera()
    }
    
    func checkCoreData(){
        // SET BUTTON VALUES
        let buttonValues = Helper.helper.configureButtonVariables()
        if buttonValues.exist == false {
            variables.button1Value = 5.00
            variables.button2Value = 10.00
            variables.button3Value = 30.00
            variables.button4Value = 60.00
        } else {
            variables.button1Value = buttonValues.first
            variables.button2Value = buttonValues.second
            variables.button3Value = buttonValues.third
            variables.button4Value = buttonValues.fourth
        }
        print("CORE DATA BUTTON VALUES...\(variables.button1Value)...\(variables.button2Value)...\(variables.button3Value)...\(variables.button4Value)")
        /*
         if Helper.helper.getUnfinishedExportAssets() == false {
         print("Continue Exporting Unfinished Assets")
         exportVideo()
         } else {
         print("No Unfinished Assets Found in Core Data")
         }
         */
    }
    
    func setVideoRecorder() {
        
        // VIDEO RECORDING INITIATIONS
        variables.cameraAccess = false
        variables.captureDevice = nil
        variables.isVideoFramesWritten = false
        variables.currentTime = 0
        variables.iCount = 0
        initializeSession()
        variables.hasWritingStarted = false
        variables.video_queue = DispatchQueue(label: "video_queue")
        startScreenVideoStream()
        
        
    }
    func setWriterDirectory() {
        // SET DIRECTORY FOR WRITER
        do {
            let content = try FileManager.default.contentsOfDirectory(atPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0])
            for file in content {
                // Create writer
                let documentsPath = NSURL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0])
                let url1 = documentsPath.appendingPathComponent(file)
                
                try FileManager.default.removeItem(at: url1!)
            }
        } catch _ {
        }
        
    }
    
    @objc func wakeUp() {
        print("wakeup")
        
        continueRecording()
    }
    
    @objc func resign() {
        if variables.dimScreen == true {
            toggleScreenDimmer(on: false)
        }
    }
    
    @objc func goToSleep() {
        print("go sleep")
        
        
        if variables.exporting == true {
            print("EXPORTING VIDEO NOT FINISHED")

            
        } else {
            print("NOT EXPORTING")
        }
        variables.startCalled = false
        resetCamera()
    }
    
    @IBAction func dimButtonAction(_ sender: Any) {
        if variables.dimScreen == true {
            toggleScreenDimmer(on: false)
            
        } else {
            toggleScreenDimmer(on: true)
            
        }
    }
    
    func toggleScreenDimmer(on: Bool) {
        if on == true {
            variables.captureLayer.isHidden = true
            UIScreen.main.brightness = CGFloat(0.0)
            variables.dimScreen = true
        }
        else {
            variables.captureLayer.isHidden = false
            UIScreen.main.brightness = CGFloat(variables.userBrightness)
            variables.dimScreen = false
        }
        
    }
    
    func editAction() {
        if variables.editButtons == true {
            toggleEditButtons(on: false)
            
        } else {
            toggleEditButtons(on: true)
            
        }
        
    }
    
    @IBAction func editButtonsAction(_ sender: Any) {
        
        editAction()
        
    }
    
    func toggleEditButtons(on: Bool) {
        
        if on == true {
            self.closeEditButtonsView.isHidden = false
            self.editQuickBackground.isHidden = false
            self.editQuickView.isHidden = false
            variables.editButtons = true
            self.editqsButtonsBackFrame.backgroundColor = Colors.main.color5
            
            
            self.settingsButton.isHidden = true
            self.settingsButtonBackground.isHidden = true
            if variables.isPortrait {
                self.portraitTimerView.isHidden = true
                self.portraitSettingsButton.isHidden = true
            }
            
            if !variables.isPremiumUser {
                self.goPremiumView.isHidden = true
                self.goPremiumView2.isHidden = false
            }
        } else {
            self.closeEditButtonsView.isHidden = true
            self.editQuickBackground.isHidden = true
            self.editQuickView.isHidden = true
            self.resetButtonVariables()
            variables.editButtons = false
            self.editqsButtonsBackFrame.backgroundColor = UIColor.clear
            
            self.settingsButton.isHidden = false
            self.settingsButtonBackground.isHidden = false
            
            if variables.isPortrait {
                self.portraitTimerView.isHidden = false
                
                self.portraitSettingsButton.isHidden = false
                
            }
            if !variables.isPremiumUser {
                self.goPremiumView.isHidden = false
                self.goPremiumView2.isHidden = true
            }
        }
        
    }
    

    @objc func runTimedCode() {
        
        // THIS IS WHERE THE MAGIC HAPPENS
        // DELETED FROM THIS PUBLIC REPOSITORY
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    func continueRecording() {
        
        startCamera()
        
       
    }
    
    func recButtonAction() {
        variables.clockStoppedTime = Date()
        let stopTime = Date().timeIntervalSinceReferenceDate - variables.videoStartTime
        print("variables.loopStartTimes COUNT \(variables.loopStartTimes.count)")
        print("variables.loopStartTimes \(variables.loopStartTimes)")
        if variables.loopStartTimes.count > 1 {
            variables.doubleStopTime = Date().timeIntervalSinceReferenceDate - variables.loopStartTimes[1]
        }
        
        
        variables.dismissingTrimmer = false
        goToTrimmerViewController(quickSaveTime: variables.maxButtonValue, count: variables.iCount!, stopTime:stopTime)
        
      
    }
    
    @IBAction func OnRecordingButtonPress(_ sender: Any) {
        recButtonAction()
    }
    
    func goToTrimmerViewController(quickSaveTime: Double, count: Int, stopTime: Double) {
        
        self.resetCamera()
        
        // set custom save values
        variables.customStopTime = stopTime
        if stopTime < variables.maxButtonValue {
            variables.customButtonValue = stopTime
        } else {
            variables.customButtonValue = variables.maxButtonValue
        }
        variables.customCount = count
        
        resign()
        
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "trimmerViewController") as? VideoTrimmerViewController
        {
            present(vc, animated: true, completion: nil)
        }
        
    }
    
    func customSave() {
        print("CUSTOM SAVE WITH NEW VALUES")
        
        print("customButtonValue = \(variables.customButtonValue) customStopTime = \(variables.customStopTime)")
        variables.startCalled = false
        self.merge(quickSaveTime: variables.customButtonValue, count: variables.customCount, stopTime: variables.customStopTime)
        DispatchQueue.main.async {
            if variables.isPortrait {
                self.portraitIndicator.startAnimating()
                self.portraitTimerView.isHidden = true
                self.portraitStatusView.isHidden = false
                self.portraitStatusViewBackground.isHidden = false
                self.portraitStatusLabel.text = "Saving"
            } else {
                self.settingsButton.isHidden = true
                self.settingsButtonBackground.isHidden = true
                self.statusViewBackground.isHidden = false
                self.indicator.startAnimating()
                self.statusLabel.text = "Saving"
                
            }
            
        }
    }
    
    
    @IBAction func customSaveAction(_ sender: Any) {
        variables.startCalled = false
        stopCamera(quickSaveTime: variables.customButtonValue, count: variables.customCount, stopTime: variables.customStopTime)
        
        UIView.animate(withDuration: 0.3, delay: 0.0, options: [.curveEaseInOut], animations: {
            self.customSaveView.frame.origin.y += 100
            
        }, completion: { (finished: Bool) in
            // self.settingsView.isHidden = false
            self.forwardTimeLabel.isHidden = false
        })
    }
    
    @IBAction func settingsAction(_ sender: Any) {
        
        if !variables.isPremiumUser {
            if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SettingsTableViewController") as? SettingsTableViewController
            {
                present(vc, animated: true, completion: nil)
            }
            
        }
        else {
            if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PremiumSettingsTableViewController") as? PremiumSettingsTableViewController
            {
                present(vc, animated: true, completion: nil)
            }
            
        }
        stackLeft = false
        stackDown = false
        
    }
    
    func setCustomButtonVariables() {
        if variables.customButtonValue >= 60 {
            // Calculate minutes
            let minutes = variables.customButtonValue / 60.0
            let min = Int(floor(minutes))
            variables.bCustomMinutes = min
            
            // Calculate seconds
            let seconds = variables.customButtonValue.truncatingRemainder(dividingBy: 60)
            let sec = Int(seconds)
            variables.bCustomSeconds = sec
            
        } else {
            variables.bCustomSeconds = Int(variables.customButtonValue)
        }
        setCustomTimePicker()
    }
    
    
    func initializeSession() {
        let authorizationStatus = AVCaptureDevice.authorizationStatus(for: AVMediaType(rawValue: convertFromAVMediaType(AVMediaType.video)))
        
        switch authorizationStatus {
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: AVMediaType(rawValue: convertFromAVMediaType(AVMediaType.video)),
                                          completionHandler: { (granted:Bool) -> Void in
                                            if granted {
                                                
                                                variables.cameraAccess = true
                                            }
                                            else
                                            {
                                                print(" Access denied, cannot use the app ")
                                            }
            })
            break
        case .authorized:
            variables.cameraAccess = true
            break
        case .denied, .restricted:
            break
        }
        
        AVAudioSession.sharedInstance().requestRecordPermission( { (granted: Bool) -> Void in
            
        });
    }
    
  
    
    func startScreenVideoStream() {
        // Get the device
 
        variables.captureDevice = AVCaptureDevice.default(.builtInWideAngleCamera,
                                                          for: AVMediaType(rawValue: convertFromAVMediaType(AVMediaType.video)),
                                                          position: .back)
        

        // Create capture session
        variables.session = AVCaptureSession()
        do {
            let input = try AVCaptureDeviceInput(device: variables.captureDevice!)
            variables.session.addInput(input)
            variables.activeInput = input
            
            let ainput =  try AVCaptureDeviceInput(device:AVCaptureDevice.default(for: AVMediaType(rawValue: convertFromAVMediaType(AVMediaType.audio)))!)
            variables.session.addInput(ainput)
            
            
            variables.captureLayer = AVCaptureVideoPreviewLayer(
                session: variables.session)
            
            //variables.captureLayer!.frame = self.view.bounds
            variables.captureLayer!.videoGravity = AVLayerVideoGravity(rawValue: convertFromAVLayerVideoGravity(AVLayerVideoGravity.resizeAspectFill))
            
            self.view.layer.insertSublayer(variables.captureLayer, at: 0)
            
        }
        catch{
            print(error)
            return
        }
        variables.session.startRunning()
        
        let videoserialQueue = DispatchQueue(label: "videoQueue")
        variables.videoOutput.alwaysDiscardsLateVideoFrames = false
        
        let connection = variables.videoOutput.connection(with: AVMediaType(rawValue: convertFromAVMediaType(AVMediaType.video)))
        
        updatePreviewLayer(layer: (variables.captureLayer?.connection)!, orientation: .landscapeRight)
        
        variables.videoOutput.setSampleBufferDelegate(self, queue: videoserialQueue)
        
        let serialQueue = DispatchQueue(label: "audioQueue")
        variables.audioDataOutput.setSampleBufferDelegate(self, queue: serialQueue)
        
    }
    
    private func updatePreviewLayer(layer: AVCaptureConnection, orientation: AVCaptureVideoOrientation) {
        
        layer.videoOrientation = orientation
        
        variables.captureLayer.frame = self.view.bounds
        
    }
    
    func startCamera()
    {
        
        Helper.helper.setSound()
        
        variables.maxButtonValue = Helper.helper.calculateMaxSpace()
        variables.durationForTimer = variables.maxButtonValue
        
        InitFirstWriter()
        InitSecondWriter()
        
        variables.avActiveWriter = variables.avWriter1
        variables.avActiveAudioInput = variables.avAudioInput1
        variables.avActiveVideoInput = variables.avVideoInput1
        
        if (variables.session?.canAddOutput(variables.videoOutput) != nil) {
            variables.session?.addOutput(variables.videoOutput)
            let connection = variables.videoOutput.connection(with: AVMediaType(rawValue: convertFromAVMediaType(AVMediaType.video)))
            if connection?.isVideoOrientationSupported == true {
                print("Video Orientation Supported ")
                if variables.isPortrait {
                    connection?.videoOrientation = .portrait
                }
                else {
                    if variables.activeInput.device.position == .front  {
                        if !variables.isLandscapeLeft {
                            connection?.videoOrientation = .landscapeRight
                        } else {
                            connection?.videoOrientation = .landscapeLeft
                        }
                        
                    } else {
                        if !variables.isLandscapeLeft {
                            connection?.videoOrientation = .landscapeRight
                        } else {
                            connection?.videoOrientation = .landscapeLeft
                        }
                    }
                    
                }
                
            }
            else {
                print("Video Orientation NOT Supported")
                
             
            }
        }
        
        if (variables.session?.canAddOutput(variables.audioDataOutput) != nil) {
            variables.session?.addOutput(variables.audioDataOutput)
        }
        
        // adjust camerafocus point to last known point
        let zeroPoint = CGPoint(x: 0.0, y: 0.0)
        if savedFocusPoint != zeroPoint {
            if let device = variables.captureDevice {
                do {
                    try device.lockForConfiguration()
                    if device.isFocusPointOfInterestSupported {
                        device.focusPointOfInterest = savedFocusPoint
                        device.focusMode = AVCaptureDevice.FocusMode.autoFocus
                    }
                    if device.isExposurePointOfInterestSupported {
                        device.exposurePointOfInterest = savedFocusPoint
                        device.exposureMode = AVCaptureDevice.ExposureMode.autoExpose
                    }
                    device.unlockForConfiguration()
                    
                    print("Resetting camera focus point to \(savedFocusPoint)")
                    
                } catch {
                    // Handle errors here
                }
            }
        }
        
        
        // wait 1 seconds and trim from video beginnig (to handle delay problems in initiating session and writers)
        timer = Timer.scheduledTimer(timeInterval: variables.durationForTimer, target: self, selector: #selector(runTimedCode), userInfo: nil, repeats: true)
        
        let when = DispatchTime.now() + 1 // wait one second
        DispatchQueue.main.asyncAfter(deadline: when) {
            // Start video timer
            self.start()
        }
        
        
        
    }
    
    func stopCamera(quickSaveTime: Double, count: Int, stopTime: Double)
    {
        timer?.invalidate()
        stopped = true
 
                self.merge(quickSaveTime: quickSaveTime, count: count, stopTime: stopTime)
                DispatchQueue.main.async {
                    
                    if variables.isPortrait {
                        self.portraitStatusView.isHidden = false
                        self.portraitStatusViewBackground.isHidden = false
                        self.portraitTimerView.isHidden = true
                        self.portraitIndicator.startAnimating()
                        //  self.portraitStatusLabel.text = "Saving"
                        
                    } else {
                        
                        if !variables.isPremiumUser {
                            self.goPremiumView.isHidden = true
                        }
                        self.settingsButton.isHidden = true
                        self.settingsButtonBackground.isHidden = true
                        self.statusViewBackground.isHidden = false
                        self.indicator.startAnimating()
                        // self.statusLabel.text = "Saving"
                    }
                }
                
         
    }

   
    func getCurrentMillis()->Int64 {
        return Int64(Date().timeIntervalSince1970 * 1000)
    }
    
    func captureOutput(_ output: AVCaptureOutput, didDrop sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
   
    }
    
    func captureOutput(_ captureOutput: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        
    }
    
    func cameraWithPosition(position: AVCaptureDevice.Position) -> AVCaptureDevice? {
        //let devices = AVCaptureDevice.devices(withMediaType: AVMediaTypeVideo)
        if #available(iOS 10.0, *) {
            
            return AVCaptureDevice.default(.builtInWideAngleCamera,
                                           for: AVMediaType(rawValue: convertFromAVMediaType(AVMediaType.video)),
                                           position: position)
        } else {
            // Fallback on earlier versions
            let devices = AVCaptureDevice.devices(for: AVMediaType(rawValue: convertFromAVMediaType(AVMediaType.video)))
            for device in devices {
                if (device as AnyObject).position == position {
                    return device as? AVCaptureDevice
                }
            }
        }
        
        return nil
    }
    
    
    func rotateInterface() {
        print("rotating")
        self.interfaceView.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
  
        self.view.setNeedsDisplay()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touchPoint = touches.first! as UITouch
        let screenSize = self.view.bounds.size
        let touchX = touchPoint.location(in: self.view).y / screenSize.height
        let touchY = 1.0 - touchPoint.location(in: self.view).x / screenSize.width
        
        // print("X: \(touchX)  Y: \(touchY)")
        
        let focusPoint = CGPoint(x: touchX, y: touchY)
        print("POINT: \(focusPoint)")
        if focusPoint.y <= 0.1 || focusPoint.y >= 0.9 {
            print("Out of Bounds")
        } else {
            print("Safe")
            savedFocusPoint = focusPoint
            if let device = variables.captureDevice {
                do {
                    try device.lockForConfiguration()
                    if device.isFocusPointOfInterestSupported {
                        device.focusPointOfInterest = focusPoint
                        device.focusMode = AVCaptureDevice.FocusMode.autoFocus
                    }
                    if device.isExposurePointOfInterestSupported {
                        device.exposurePointOfInterest = focusPoint
                        device.exposureMode = AVCaptureDevice.ExposureMode.autoExpose
                    }
                    device.unlockForConfiguration()
                    
                } catch {
                    // Handle errors here
                }
            }
        }
        
    }
    
    func flashToggle() {
        // UNCOMMENT TO BLOCK FROM Non-Premium Users
        /*
         if !variables.isPremiumUser {
         // show alert "this is only for premium users , update now?"
         upgradeButton.shake()
         print("Karvalakki user, no flash for you")
         }
         */
        if variables.torchOn == true {
            toggleTorch(on: false)
            
        } else {
            toggleTorch(on: true)
            
        }
    }
    
    @IBAction func toggleFlash(_ sender: Any) {
        
        flashToggle()
        
    }
    
    func toggleTorch(on: Bool) {
        
        if (variables.captureDevice?.hasTorch)! {
            do {
                try variables.captureDevice?.lockForConfiguration()
                
                if on == true {
                    variables.captureDevice?.torchMode = .on
                    variables.torchOn = true
                    self.flashBackgroundFrame.backgroundColor = Colors.main.color5
                    
                } else {
                    variables.captureDevice?.torchMode = .off
                    variables.torchOn = false
                    self.flashBackgroundFrame.backgroundColor = UIColor.clear
                    
                }
                
                variables.captureDevice?.unlockForConfiguration()
            } catch {
                print("Torch could not be used")
            }
        } else {
            print("Torch is not available")
        }
    }
    
    @IBAction func pinchZoom(_ sender: Any) {
        guard let device = variables.captureDevice else { return }
        
        if (sender as AnyObject).state == .changed {
            
            let maxZoomFactor = device.activeFormat.videoMaxZoomFactor
            let pinchVelocityDividerFactor: CGFloat = 5.0
            
            do {
                
                try device.lockForConfiguration()
                defer { device.unlockForConfiguration() }
                
                let desiredZoomFactor = device.videoZoomFactor + atan2((sender as AnyObject).velocity, pinchVelocityDividerFactor)
                device.videoZoomFactor = max(1.0, min(desiredZoomFactor, maxZoomFactor))
                
            } catch {
                print(error)
            }
        }
    }
    
    
    @objc func flipLandscapeOrientation() {
        
        if !variables.isPortrait {
            if UIDevice.current.orientation == UIDeviceOrientation.landscapeLeft || UIDevice.current.orientation == UIDeviceOrientation.landscapeRight {
                let connection = variables.videoOutput.connection(with: AVMediaType(rawValue: convertFromAVMediaType(AVMediaType.video)))
                
                if connection?.isVideoOrientationSupported == true {
                    print("Video Orientation Supported ")
                    if UIDevice.current.orientation == UIDeviceOrientation.landscapeLeft {
                        self.userInterface.transform = CGAffineTransform.init(rotationAngle: 0)
                        connection?.videoOrientation = .landscapeRight
                        variables.isLandscapeLeft = false
                        
                    } else if UIDevice.current.orientation == UIDeviceOrientation.landscapeRight {
                        self.userInterface.transform = CGAffineTransform.init(rotationAngle: 180 * .pi / 180)
                        connection?.videoOrientation = .landscapeLeft
                        variables.isLandscapeLeft = true
                    }
                }
            }
        }
        
    }
    
    func orientationSet() {
        
        if variables.isPortrait {
            
            // go to Portrait
            self.userInterface.transform = CGAffineTransform.init(rotationAngle: 0)
            
            self.upgradeHintView.transform = CGAffineTransform.init(rotationAngle: 270 * .pi/180)
            
            
            self.qsView1.transform = CGAffineTransform.init(rotationAngle: 270 * .pi/180)
            self.flashButton.transform = CGAffineTransform.init(rotationAngle: 270 * .pi/180)
            self.flashButtonBackground.transform = CGAffineTransform.init(rotationAngle: 270 * .pi/180)
            self.landscapeUIView.isHidden = true
            
            self.editQuickSaveTimesButton.transform = CGAffineTransform.init(rotationAngle: 270 * .pi/180)
            self.editQuicksaveButtonsBackgrounds.transform = CGAffineTransform.init(rotationAngle: 270 * .pi/180)
            self.qsView2.transform = CGAffineTransform.init(rotationAngle: 270 * .pi/180)
            
            
            self.recordButton.transform = CGAffineTransform.init(rotationAngle: 270 * .pi/180)
            self.qsView3.transform = CGAffineTransform.init(rotationAngle: 270 * .pi/180)
            
            self.flipButton.transform = CGAffineTransform.init(rotationAngle: 270 * .pi/180)
            self.flipButtonBackground.transform = CGAffineTransform.init(rotationAngle: 270 * .pi/180)
            self.qsView4.transform = CGAffineTransform.init(rotationAngle: 270 * .pi/180)
            self.orientationButtonText.text = "L"
            self.orientationShadeFrame.transform = CGAffineTransform.init(rotationAngle: 270 * .pi/180)
            self.portraitUIView.isHidden = false
            
            
            
            
            
            
        } else {
            // go to LANDSCAPE
            
            self.upgradeHintView.transform = CGAffineTransform.init(rotationAngle: 0.0)
            
            
            self.flipButton.transform = CGAffineTransform.init(rotationAngle: 0.0)
            self.flipButtonBackground.transform = CGAffineTransform.init(rotationAngle: 0.0)
            self.qsView4.transform = CGAffineTransform.init(rotationAngle: 0.0)
            self.orientationButtonText.text = "P"
            self.orientationShadeFrame.transform =  CGAffineTransform.init(rotationAngle: 0.0)
            self.portraitUIView.isHidden = true
            
            self.recordButton.transform = CGAffineTransform.init(rotationAngle: 0.0)
            self.qsView3.transform = CGAffineTransform.init(rotationAngle: 0.0)
            
            
            
            self.editQuickSaveTimesButton.transform = CGAffineTransform.init(rotationAngle: 0.0)
            self.editQuicksaveButtonsBackgrounds.transform = CGAffineTransform.init(rotationAngle: 0.0)
            self.qsView2.transform = CGAffineTransform.init(rotationAngle: 0.0)
            
            
            self.flashButton.transform = CGAffineTransform.init(rotationAngle: 0.0)
            self.flashButtonBackground.transform = CGAffineTransform.init(rotationAngle: 0.0)
            self.qsView1.transform = CGAffineTransform.init(rotationAngle: 0.0)
            self.landscapeUIView.isHidden = false
            
        }
        
        
    }
    
    func orientationFlip() {
        
        if variables.isPortrait {
            // go to LANDSCAPE
            
            variables.startCalled = false
            self.resetCamera()
            Helper.helper.clearAllFilesFromTempDirectory()
            
            UserDefaults.standard.setValue(false, forKey: "OrientationIsPortrait")
            variables.isPortrait = false
            
            self.continueRecording()
            
            if variables.torchOn {
                //self.flashButtonBackground.backgroundColor = UIColor.clear
                self.flashBackgroundFrame.backgroundColor = UIColor.clear
            }
            self.upgradeHintView.transform = CGAffineTransform.init(rotationAngle: 0.0)
            
            UIView.animate(withDuration: 0.2, delay: 0.0, options: [.curveEaseInOut], animations: {
                self.flipButton.transform = CGAffineTransform.init(rotationAngle: 0.0)
                self.flipButtonBackground.transform = CGAffineTransform.init(rotationAngle: 0.0)
                self.qsView4.transform = CGAffineTransform.init(rotationAngle: 0.0)
                self.orientationButtonText.text = "P"
                self.orientationShadeFrame.transform =  CGAffineTransform.init(rotationAngle: 0.0)
                self.portraitUIView.isHidden = true
            }, completion: { _ in
                
                UIView.animate(withDuration: 0.2, delay: 0.0, options: [.curveEaseInOut], animations: {
                    self.recordButton.transform = CGAffineTransform.init(rotationAngle: 0.0)
                    self.qsView3.transform = CGAffineTransform.init(rotationAngle: 0.0)
                    
                    
                }, completion: { _ in
                    UIView.animate(withDuration: 0.2, delay: 0.0, options: [.curveEaseInOut], animations: {
                        self.editQuickSaveTimesButton.transform = CGAffineTransform.init(rotationAngle: 0.0)
                        self.editQuicksaveButtonsBackgrounds.transform = CGAffineTransform.init(rotationAngle: 0.0)
                        self.qsView2.transform = CGAffineTransform.init(rotationAngle: 0.0)
                        
                    }, completion: { _ in
                        UIView.animate(withDuration: 0.2, delay: 0.0, options: [.curveEaseInOut], animations: {
                            self.flashButton.transform = CGAffineTransform.init(rotationAngle: 0.0)
                            self.flashButtonBackground.transform = CGAffineTransform.init(rotationAngle: 0.0)
                            self.qsView1.transform = CGAffineTransform.init(rotationAngle: 0.0)
                            self.landscapeUIView.isHidden = false
                        })
                    })
                })
            })
            
            
            
            
            
            
        } else {
            // go to Portrait
            self.userInterface.transform = CGAffineTransform.init(rotationAngle: 0)
            
            variables.startCalled = false
            self.resetCamera()
            Helper.helper.clearAllFilesFromTempDirectory()
            
            UserDefaults.standard.setValue(true, forKey: "OrientationIsPortrait")
            variables.isPortrait = true
            
            self.continueRecording()
            
            if variables.editButtons {
                
                
                self.portraitSettingsButton.isHidden = true
                self.portraitTimerView.isHidden = true
            }
            if variables.torchOn {
                
                self.flashBackgroundFrame.backgroundColor = UIColor.clear
            }
            
            self.upgradeHintView.transform = CGAffineTransform.init(rotationAngle: 270 * .pi/180)
            
            UIView.animate(withDuration: 0.2, delay: 0.0, options: [.curveEaseInOut], animations: {
                self.qsView1.transform = CGAffineTransform.init(rotationAngle: 270 * .pi/180)
                self.flashButton.transform = CGAffineTransform.init(rotationAngle: 270 * .pi/180)
                self.flashButtonBackground.transform = CGAffineTransform.init(rotationAngle: 270 * .pi/180)
                self.landscapeUIView.isHidden = true
            }, completion: { _ in
                
                UIView.animate(withDuration: 0.2, delay: 0.0, options: [.curveEaseInOut], animations: {
                    self.editQuickSaveTimesButton.transform = CGAffineTransform.init(rotationAngle: 270 * .pi/180)
                    self.editQuicksaveButtonsBackgrounds.transform = CGAffineTransform.init(rotationAngle: 270 * .pi/180)
                    self.qsView2.transform = CGAffineTransform.init(rotationAngle: 270 * .pi/180)
                    
                    
                }, completion: { _ in
                    UIView.animate(withDuration: 0.2, delay: 0.0, options: [.curveEaseInOut], animations: {
                        self.recordButton.transform = CGAffineTransform.init(rotationAngle: 270 * .pi/180)
                        self.qsView3.transform = CGAffineTransform.init(rotationAngle: 270 * .pi/180)
                        
                    }, completion: { _ in
                        UIView.animate(withDuration: 0.2, delay: 0.0, options: [.curveEaseInOut], animations: {
                            self.flipButton.transform = CGAffineTransform.init(rotationAngle: 270 * .pi/180)
                            self.flipButtonBackground.transform = CGAffineTransform.init(rotationAngle: 270 * .pi/180)
                            self.qsView4.transform = CGAffineTransform.init(rotationAngle: 270 * .pi/180)
                            self.orientationButtonText.text = "L"
                            self.orientationShadeFrame.transform = CGAffineTransform.init(rotationAngle: 270 * .pi/180)
                            self.portraitUIView.isHidden = false
                        })
                    })
                })
            })
            
            
        }
        
        
    }
    
    @IBAction func orientationFlipAction(_ sender: Any) {
        
        orientationFlip()
        
    }
    
    func setCamera() {
        if variables.useFrontCamera == true {
            flipCamera()
        }
        
    }
    
    func flipCamera() {
        // UNCOMMENT TO BLOCK FROM Non-Premium Users
        /*
         if !variables.isPremiumUser {
         // show alert "this is only for premium users , update now?"
         upgradeButton.shake()
         print("Karvalakki user, no front camera acces")
         }
         */
        
        
        variables.startCalled = false
        self.resetCamera()
        Helper.helper.clearAllFilesFromTempDirectory()
        //let currentCameraInput: AVCaptureInput = variables.session.inputs[0] as! AVCaptureInput
        //variables.session.removeInput(currentCameraInput)
        let currentCameraInput = variables.activeInput
        var newCamera: AVCaptureDevice
        if (currentCameraInput)?.device.position == .back {
            newCamera = self.cameraWithPosition(position: .front)!
            variables.captureDevice = newCamera
            variables.frontCamera = true
            self.flashButton.isHidden = true
            self.flashButtonBackground.isHidden = true
            self.flashBackgroundFrame.isHidden = true
            variables.useFrontCamera = true
            UserDefaults.standard.setValue(true, forKey: "UseFrontCamera")
            
        } else {
            newCamera = self.cameraWithPosition(position: .back)!
            variables.captureDevice = newCamera
            variables.frontCamera = false
            self.flashButton.isHidden = false
            self.flashButtonBackground.isHidden = false
            self.flashBackgroundFrame.isHidden = false
            variables.useFrontCamera = false
            UserDefaults.standard.setValue(false, forKey: "UseFrontCamera")
        }
        do{
            
            let newVideoInput = try AVCaptureDeviceInput(device: newCamera)//AVCaptureDeviceInput(device: newCamera, error: nil)
            variables.session.removeInput(variables.activeInput)
            variables.session.addInput(newVideoInput)
            variables.activeInput = newVideoInput
            self.continueRecording()
        }
        catch {
            print(error)
        }
        // }
    }
    
    @IBAction func flipCameraAction(_ sender: UIButton) {
        
        flipCamera()
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var rows = 0
        if !variables.isPremiumUser {
            if pickerView == timePickerView1 {
                if component == 0 {
                    rows = 0
                }
                else {
                    rows = 11
                }
            }
            else {
                if component == 0 {
                    
                    rows = 0
                }
                else {
                    rows = 0
                }
                
            }
            
        }
            
        else {
            if component == 0 {
                // TODO: tarkista videon maximimitta
                rows = 10
            }
            else {
                rows = 60
            }
        }
        return rows
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if !variables.isPremiumUser {
            print("karvalakki user, no access to change button values")
            if pickerView == timePickerView1 {
                
                var min = variables.b1Minutes
                var sec = variables.b1Seconds
                
                switch component {
                case 0:
                    min = row
                case 1:
                    sec = row
                default:
                    print("No component with number \(component)")
                }
                
                if (min == 0 && sec == 0) {
                    sec = 1
                }
                timePickerView1.selectRow(min, inComponent: 0, animated: true)
                timePickerView1.selectRow(sec, inComponent: 1, animated: true)
                
                variables.b1Minutes = min
                variables.b1Seconds = sec
                
                let b1MinutesToSeconds = variables.b1Minutes * 60
                variables.button1Value = Double(b1MinutesToSeconds + variables.b1Seconds)
                
                quickSave1Button.setTitle(Helper.helper.buttonTime(min: variables.b1Minutes, sec: variables.b1Seconds), for: .normal)
            }
        }
        else {
            if pickerView == timePickerView1 {
                
                var min = variables.b1Minutes
                var sec = variables.b1Seconds
                
                switch component {
                case 0:
                    min = row
                case 1:
                    sec = row
                default:
                    print("No component with number \(component)")
                }
      
                if (min == 0 && sec == 0) {
                    sec = 1
                }
                timePickerView1.selectRow(min, inComponent: 0, animated: true)
                timePickerView1.selectRow(sec, inComponent: 1, animated: true)
                
                
                variables.b1Minutes = min
                variables.b1Seconds = sec
                
                let b1MinutesToSeconds = variables.b1Minutes * 60
                variables.button1Value = Double(b1MinutesToSeconds + variables.b1Seconds)
                
                quickSave1Button.setTitle(Helper.helper.buttonTime(min: variables.b1Minutes, sec: variables.b1Seconds), for: .normal)
            }
            
            if pickerView == timePickerView2 {
                
                var min = variables.b2Minutes
                var sec = variables.b2Seconds
                
                switch component {
                case 0:
                    min = row
                case 1:
                    sec = row
                default:
                    print("No component with number \(component)")
                }
   
                if (min == 0 && sec == 0) {
                    sec = 1
                }
                timePickerView2.selectRow(min, inComponent: 0, animated: true)
                timePickerView2.selectRow(sec, inComponent: 1, animated: true)
                
                
                variables.b2Minutes = min
                variables.b2Seconds = sec
                
                let b2MinutesToSeconds = variables.b2Minutes * 60
                variables.button2Value = Double(b2MinutesToSeconds + variables.b2Seconds)
                
                quickSave2Button.setTitle(Helper.helper.buttonTime(min: variables.b2Minutes, sec: variables.b2Seconds), for: .normal)
            }
            if pickerView == timePickerView3 {
                
                var min = variables.b3Minutes
                var sec = variables.b3Seconds
                
                switch component {
                case 0:
                    min = row
                case 1:
                    sec = row
                default:
                    print("No component with number \(component)")
                }
    
                if (min == 0 && sec == 0) {
                    sec = 1
                }
                timePickerView3.selectRow(min, inComponent: 0, animated: true)
                timePickerView3.selectRow(sec, inComponent: 1, animated: true)
                
                
                variables.b3Minutes = min
                variables.b3Seconds = sec
                
                let b3MinutesToSeconds = variables.b3Minutes * 60
                variables.button3Value = Double(b3MinutesToSeconds + variables.b3Seconds)
                
                quickSave3Button.setTitle(Helper.helper.buttonTime(min: variables.b3Minutes, sec: variables.b3Seconds), for: .normal)
            }
            
            if pickerView == timePickerView4 {
                
                var min = variables.b4Minutes
                var sec = variables.b4Seconds
                
                switch component {
                case 0:
                    min = row
                case 1:
                    sec = row
                default:
                    print("No component with number \(component)")
                }
    
                if (min == 0 && sec == 0) {
                    sec = 1
                }
                timePickerView4.selectRow(min, inComponent: 0, animated: true)
                timePickerView4.selectRow(sec, inComponent: 1, animated: true)
                
                
                variables.b4Minutes = min
                variables.b4Seconds = sec
                
                let b4MinutesToSeconds = variables.b4Minutes * 60
                variables.button4Value = Double(b4MinutesToSeconds + variables.b4Seconds)
                
                quickSave4Button.setTitle(Helper.helper.buttonTime(min: variables.b4Minutes, sec: variables.b4Seconds), for: .normal)
            }
            
            if pickerView == customSaveTimePicker {
                
                // get time from somewhere???
                var min = variables.bCustomMinutes
                var sec = variables.bCustomSeconds
                
                switch component {
                case 0:
                    min = row
                case 1:
                    sec = row
                default:
                    print("No component with number \(component)")
                }
                if (min == 0 && sec == 0) {
                    sec = 1
                    customSaveTimePicker.selectRow(1, inComponent: 1, animated: true)
                }
                if min > variables.bCustomMinutes {
                    customSaveTimePicker.selectRow(variables.bCustomMinutes, inComponent: 0, animated: true)
                }
                if min == variables.bCustomMinutes && sec > variables.bCustomSeconds {
                    customSaveTimePicker.selectRow(variables.bCustomSeconds, inComponent: 1, animated: true)
                }
                
                // set value for custom savetime
                let customMinutesToSeconds = min * 60
                variables.customButtonValue = Double(customMinutesToSeconds + sec)
                print(variables.customButtonValue)
            }
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        if (view != nil) {
            (view as! UILabel).text = String(format:"%02lu", row)
            return view!
        }
        let columnView = UILabel(frame: CGRect(origin: CGPoint(x:0,y:0), size: timePickerView1.frame.size))
        columnView.text = String(format:"%02lu", row)
        columnView.textAlignment = NSTextAlignment.center
        columnView.textColor = UIColor.white
        columnView.font = UIFont.systemFont(ofSize: 20)
        columnView.adjustsFontSizeToFitWidth = true
        //columnView.font = UIFont(name: "", size: )
        
        return columnView
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 40
    }
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 40
    }
    
    func setButtonVariables() {
        
        // Calculate minutes
        if variables.maxButtonValue >= 60 {
            let minutes = variables.maxButtonValue / 60.0
            let min = Int(floor(minutes))
            variables.bMaxMinutes = min
            
            // Calculate seconds
            let seconds = variables.maxButtonValue.truncatingRemainder(dividingBy: 60)
            let sec = Int(seconds)
            variables.bMaxSeconds = sec
            
        } else {
            variables.bMaxSeconds = Int(variables.maxButtonValue)
            
        }
        
        // Calculate minutes
        if variables.button1Value >= 60 {
            let minutes = variables.button1Value / 60.0
            let min = Int(floor(minutes))
            variables.b1Minutes = min
            
            // Calculate seconds
            let seconds = variables.button1Value.truncatingRemainder(dividingBy: 60)
            let sec = Int(seconds)
            variables.b1Seconds = sec
            
        } else {
            variables.b1Seconds = Int(variables.button1Value)
            
        }
        
        if variables.button2Value == 0 {
            variables.b2HasValue = false
        }
        else if variables.button2Value >= 60 {
            // Calculate minutes
            let minutes = variables.button2Value / 60.0
            let min = Int(floor(minutes))
            variables.b2Minutes = min
            
            // Calculate seconds
            let seconds = variables.button2Value.truncatingRemainder(dividingBy: 60)
            let sec = Int(seconds)
            variables.b2Seconds = sec
            variables.b2HasValue = true
            
        } else {
            variables.b2Seconds = Int(variables.button2Value)
            variables.b2HasValue = true
        }
        
        if variables.button3Value == 0 {
            variables.b3HasValue = false
        }
        else if variables.button3Value >= 60 {
            // Calculate minutes
            let minutes = variables.button3Value / 60.0
            let min = Int(floor(minutes))
            variables.b3Minutes = min
            
            // Calculate seconds
            let seconds = variables.button3Value.truncatingRemainder(dividingBy: 60)
            let sec = Int(seconds)
            variables.b3Seconds = sec
            variables.b3HasValue = true
            
        } else {
            variables.b3Seconds = Int(variables.button3Value)
            variables.b3HasValue = true
        }
        
        if variables.button4Value == 0 {
            variables.b4HasValue = false
        }
        else if variables.button4Value >= 60 {
            // Calculate minutes
            let minutes = variables.button4Value / 60.0
            let min = Int(floor(minutes))
            variables.b4Minutes = min
            
            // Calculate seconds
            let seconds = variables.button4Value.truncatingRemainder(dividingBy: 60)
            let sec = Int(seconds)
            variables.b4Seconds = sec
            variables.b4HasValue = true
            
        } else {
            variables.b4Seconds = Int(variables.button4Value)
            variables.b4HasValue = true
        }
        
        quickSave1Button.setTitle(Helper.helper.buttonTime(min: variables.b1Minutes, sec: variables.b1Seconds), for: .normal)
        //quickSave1Button.isHidden = true
        quickSave2Button.setTitle(Helper.helper.buttonTime(min: variables.b2Minutes, sec: variables.b2Seconds), for: .normal)
        // quickSave2Button.isHidden = true
        quickSave3Button.setTitle(Helper.helper.buttonTime(min: variables.b3Minutes, sec: variables.b3Seconds), for: .normal)
        // quickSave3Button.isHidden = true
        quickSave4Button.setTitle(Helper.helper.buttonTime(min: variables.b4Minutes, sec: variables.b4Seconds), for: .normal)
        // quickSave4Button.isHidden = true
        
    }
    
    func resetButtonVariables() {
        // 1
        let b1MinutesToSeconds = variables.b1Minutes * 60
        variables.button1Value = Double(b1MinutesToSeconds + variables.b1Seconds)
        self.quickSave1Button.setTitle(Helper.helper.buttonTime(min: variables.b1Minutes, sec: variables.b1Seconds ), for: .normal)
        
        if !variables.isPremiumUser {
            print("Not premium user, do not attempt to save button2 values")
        }
        else {
            //2
            let b2MinutesToSeconds = variables.b2Minutes * 60
            variables.button2Value = Double(b2MinutesToSeconds + variables.b2Seconds)
            if variables.button2Value == 0 {
                variables.b2HasValue = false
            } else {
                variables.b2HasValue = true
            }
            self.quickSave2Button.setTitle(Helper.helper.buttonTime(min: variables.b2Minutes, sec: variables.b2Seconds ), for: .normal)
            
            // 3
            let b3MinutesToSeconds = variables.b3Minutes * 60
            variables.button3Value = Double(b3MinutesToSeconds + variables.b3Seconds)
            if variables.button3Value == 0 {
                variables.b3HasValue = false
            } else {
                variables.b3HasValue = true
            }
            self.quickSave3Button.setTitle(Helper.helper.buttonTime(min: variables.b3Minutes, sec: variables.b3Seconds ), for: .normal)
            
            // 4
            let b4MinutesToSeconds = variables.b4Minutes * 60
            variables.button4Value = Double(b4MinutesToSeconds + variables.b4Seconds)
            if variables.button4Value == 0 {
                variables.b4HasValue = false
            } else {
                variables.b4HasValue = true
            }
            self.quickSave4Button.setTitle(Helper.helper.buttonTime(min: variables.b4Minutes, sec: variables.b4Seconds ), for: .normal)
            
        }
        
        
        // save button values to core data
        Helper.helper.saveButtonValues(first: variables.button1Value, second: variables.button2Value, third: variables.button3Value, fourth: variables.button4Value)
        
    }
    
    func reset() {
        
        recButtonToRing()
        
        // hide buttons & reset animations
        recordButton.isEnabled = false
        recordButtonRing.isHidden = true
        progressBarWidthConstant.constant = 0
        
        quickSave1FillHeight.constant = 0
        quickSave2FillHeight.constant = 0
        quickSave3FillHeight.constant = 0
        quickSave4FillHeight.constant = 0
        
        quickSave1FillWidth.constant = 0
        quickSave2FillWidth.constant = 0
        quickSave3FillWidth.constant = 0
        quickSave4FillWidth.constant = 0
 
        
        quickSave1Button.isEnabled = false
        quickSave2Button.isEnabled = false
        quickSave3Button.isEnabled = false
        quickSave4Button.isEnabled = false
        
        qs1ArrowButton.isEnabled = false
        qs2ArrowButton.isEnabled = false
        qs3ArrowButton.isEnabled = false
        qs4ArrowButton.isEnabled = false
        
        qs1ArrowButton.setImage(UIImage(named: "download-empty"), for: .normal)
        qs2ArrowButton.setImage(UIImage(named: "download-empty"), for: .normal)
        qs3ArrowButton.setImage(UIImage(named: "download-empty"), for: .normal)
        qs4ArrowButton.setImage(UIImage(named: "download-empty"), for: .normal)
        
        
        // Invalidate timer
        videoTimer?.invalidate()
        
        // Reset timer variables
        variables.videoStartTime = 0
        // variables.doubleStopTime = 0
        variables.loopStartTimes.removeAll()
        variables.time = 0
        
        
        // Reset all three labels to 00
        
        if variables.isPortrait {
            
            portraitForwardTimeLabel.text = ""
            
        } else {
            
            forwardTimeLabel.text = ""
            
        }
        
        
    }
    
    func start() {
        variables.videoStartTime = Date().timeIntervalSinceReferenceDate
        videoTimer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
        // Enable recordButton  ... the "RingButton"
        let when = DispatchTime.now() + 5 // wait
        DispatchQueue.main.asyncAfter(deadline: when) {
            self.recordButton.isEnabled = true
            self.recordButtonRing.isHidden = false
            self.recButtonToSquare()
        }
        
        if variables.isPortrait {
            
        } else {
            
        }
        
    }
    
    @objc func updateCounter() {
        
        // Calculate total time since timer started in seconds
        variables.time = Date().timeIntervalSinceReferenceDate - variables.videoStartTime
        
        //animate buttons if slider is not up
        if variables.sliderIsUp == false {
            
            // quicksave buttons
            let duration = Double(2)
            let timeTo1 = variables.button1Value - duration
            let timeTo2 = variables.button2Value - duration
            let timeTo3 = variables.button3Value - duration
            let timeTo4 = variables.button4Value - duration
            let graphicsPercentile = (variables.time - timeTo1) / duration
            let graphics2Percentile = (variables.time - timeTo2) / duration
            let graphics3Percentile = (variables.time - timeTo3) / duration
            let graphics4Percentile = (variables.time - timeTo4) / duration
            //  print(" ...1 \(graphicsPercentile)% ...2 \(graphics2Percentile)% ...3 \(graphics3Percentile)% ...4 \(graphics4Percentile)%")
            
            if variables.time < timeTo1 {
                
                quickSave1FillHeight.constant = 0
                quickSave1FillWidth.constant = 0
                quickSave1Button.setTitleColor(UIColor.lightGray, for: .disabled)
                
                qs1ArrowButton.setImage(UIImage(named: "download-empty"), for: .normal)
                qs1ArrowButton.isEnabled = false
                quickSave1Button.isEnabled = false
                qsView1.layer.borderColor = UIColor.clear.cgColor
                
            }
            else if variables.time < variables.button1Value {
                
                quickSave1FillHeight.constant = 40 * CGFloat(graphicsPercentile)
                quickSave1FillWidth.constant = 40 * CGFloat(graphicsPercentile)
                button1View.layer.cornerRadius = (40 * CGFloat(graphicsPercentile)) / 3
                quickSave1Button.isEnabled = false
                // quickSave1Button.isHidden = true
                //qs1ArrowButton.setImage(UIImage(named: "download-tight"), for: .normal)
                qs1ArrowButton.isEnabled = false
                // qs1ArrowButton.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                // button1View.alpha = CGFloat(graphicsPercentile)
                button1View.backgroundColor = Colors.main.color1
                button1View.alpha = 0.7
                
                qsView1.layer.borderColor = UIColor.clear.cgColor
            } else {
                //  qs1Shade.backgroundColor = UIColor.clear
                quickSave1Button.setTitleColor(UIColor.white, for: .normal)
                button1View.alpha = 0.7
                button1View.backgroundColor = Colors.main.color1
                // qs1ArrowButton.transform = CGAffineTransform(scaleX: 1, y: 1)
                quickSave1Button.isEnabled = true
                quickSave1Button.isHidden = false
                qs1ArrowButton.isEnabled = true
                quickSave1FillHeight.constant = 36
                quickSave1FillWidth.constant = 36
                button1View.layer.cornerRadius = 0
                quickSave1Button.setTitleColor(UIColor.white, for: .normal)
                qs1ArrowButton.setImage(UIImage(named: "download-tight"), for: .normal)
                qsView1.layer.borderColor = Colors.main.color1.cgColor
                
            }
            
            
            if variables.time < timeTo2  {
                quickSave2FillHeight.constant = 0
                quickSave2FillWidth.constant = 0
                quickSave2Button.setTitleColor(UIColor.lightGray, for: .disabled)
                qs2ArrowButton.setImage(UIImage(named: "download-empty"), for: .normal)
                qs2ArrowButton.isEnabled = false
                quickSave2Button.isEnabled = false
                qsView2.layer.borderColor = UIColor.clear.cgColor
                button2View.alpha = 0.7
            }
            else if variables.time < variables.button2Value {
                if variables.b2HasValue == true {
                    quickSave2FillHeight.constant = 40 * CGFloat(graphics2Percentile)
                    quickSave2FillWidth.constant = 40 * CGFloat(graphics2Percentile)
                    button2View.layer.cornerRadius = (40 * CGFloat(graphics2Percentile)) / 3
                    quickSave2Button.isEnabled = false
                    //qs2ArrowButton.setImage(UIImage(named: "download-tight"), for: .normal)
                    qs2ArrowButton.isEnabled = false
                    // quickSave2Button.isHidden = true
                    // button2View.alpha = CGFloat(graphicsPercentile)
                    button2View.alpha = 0.7
                    button2View.backgroundColor = Colors.main.color2
                    // qs2ArrowButton.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                    qsView2.layer.borderColor = UIColor.clear.cgColor
                }
            } else {
                if variables.b2HasValue == true {
                    quickSave2Button.setTitleColor(UIColor.white, for: .normal)
                    //  qs2ArrowButton.transform = CGAffineTransform(scaleX: 1, y: 1)
                    button2View.backgroundColor = Colors.main.color2
                    button2View.alpha = 0.7
                    quickSave2Button.isEnabled = true
                    // quickSave2Button.isHidden = false
                    qs2ArrowButton.isEnabled = true
                    quickSave2FillHeight.constant = 36
                    quickSave2FillWidth.constant = 36
                    button2View.layer.cornerRadius = 0
                    quickSave2Button.setTitleColor(UIColor.white, for: .normal)
                    qs2ArrowButton.setImage(UIImage(named: "download-tight"), for: .normal)
                    qsView2.layer.borderColor = Colors.main.color2.cgColor
                }
            }
            
            if variables.time < timeTo3 {
                quickSave3FillHeight.constant = 0
                quickSave3FillWidth.constant = 0
                quickSave3Button.setTitleColor(UIColor.lightGray, for: .disabled)
                qs3ArrowButton.setImage(UIImage(named: "download-empty"), for: .normal)
                qs3ArrowButton.isEnabled = false
                quickSave3Button.isEnabled = false
                qsView3.layer.borderColor = UIColor.clear.cgColor
                button3View.alpha = 0.7
            }
            else if variables.time < variables.button3Value {
                if variables.b3HasValue == true {
                    quickSave3FillHeight.constant = 40 * CGFloat(graphics3Percentile)
                    quickSave3FillWidth.constant = 40 * CGFloat(graphics3Percentile)
                    button3View.layer.cornerRadius = (40 * CGFloat(graphics3Percentile)) / 3
                    quickSave3Button.isEnabled = false
                    // quickSave3Button.isHidden = true
                    //qs3ArrowButton.setImage(UIImage(named: "download-tight"), for: .normal)
                    qs3ArrowButton.isEnabled = false
                    // button3View.alpha = CGFloat(graphicsPercentile)
                    button3View.alpha = 0.7
                    button3View.backgroundColor = Colors.main.color3
                    //    qs3ArrowButton.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                    qsView3.layer.borderColor = UIColor.clear.cgColor
                }
            } else {
                if variables.b3HasValue == true {
                    quickSave3Button.setTitleColor(UIColor.white, for: .normal)
                    //   qs3ArrowButton.transform = CGAffineTransform(scaleX: 1, y: 1)
                    button3View.backgroundColor = Colors.main.color3
                    button3View.alpha = 0.7
                    quickSave3Button.isEnabled = true
                    // quickSave3Button.isHidden = false
                    qs3ArrowButton.isEnabled = true
                    quickSave3FillHeight.constant = 36
                    quickSave3FillWidth.constant = 36
                    button3View.layer.cornerRadius = 0
                    quickSave3Button.setTitleColor(UIColor.white, for: .normal)
                    qs3ArrowButton.setImage(UIImage(named: "download-tight"), for: .normal)
                    qsView3.layer.borderColor = Colors.main.color3.cgColor
                }
            }
            
            if variables.time < timeTo4  {
                quickSave4FillHeight.constant = 0
                quickSave4FillWidth.constant = 0
                quickSave4Button.setTitleColor(UIColor.lightGray, for: .disabled)
                qs4ArrowButton.setImage(UIImage(named: "download-empty"), for: .normal)
                qs4ArrowButton.isEnabled = false
                quickSave4Button.isEnabled = false
                qsView4.layer.borderColor = UIColor.clear.cgColor
                button4View.alpha = 0.7
            }
            else if variables.time < variables.button4Value {
                if variables.b4HasValue == true {
                    quickSave4FillHeight.constant = 40 * CGFloat(graphics4Percentile)
                    quickSave4FillWidth.constant = 40 * CGFloat(graphics4Percentile)
                    button4View.layer.cornerRadius = (40 * CGFloat(graphics4Percentile)) / 3
                    quickSave4Button.isEnabled = false
                    // quickSave4Button.isHidden = true
                    //  qs4ArrowButton.setImage(UIImage(named: "download-tight"), for: .normal)
                    qs4ArrowButton.isEnabled = false
                    // button4View.alpha = CGFloat(graphicsPercentile)
                    button4View.alpha = 0.7
                    button4View.backgroundColor = Colors.main.color4
                    //    qs4ArrowButton.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                    qsView4.layer.borderColor = UIColor.clear.cgColor
                }
            }
            else {
                if variables.b4HasValue == true {
                    quickSave4Button.setTitleColor(UIColor.white, for: .normal)
                    //   qs4ArrowButton.transform = CGAffineTransform(scaleX: 1, y: 1)
                    button4View.backgroundColor = Colors.main.color4
                    button4View.alpha = 0.7
                    quickSave4Button.isEnabled = true
                    quickSave4Button.isHidden = false
                    qs4ArrowButton.isEnabled = true
                    quickSave4FillHeight.constant = 36
                    quickSave4FillWidth.constant = 36
                    button4View.layer.cornerRadius = 0
                    quickSave4Button.setTitleColor(UIColor.white, for: .normal)
                    qs4ArrowButton.setImage(UIImage(named: "download-tight"), for: .normal)
                    qsView4.layer.borderColor = Colors.main.color4.cgColor
                }
            }
            
            
            
            let progressBarPercentile = variables.time / variables.maxButtonValue
            
            if variables.time <= variables.maxButtonValue {
                progressBarWidthConstant.constant = self.view.frame.size.width * CGFloat(progressBarPercentile)
                // Calculate minutes
                let minutes = UInt8(variables.time / 60.0)
                variables.time -= (TimeInterval(minutes) * 60)
                
                // Calculate seconds
                let seconds = UInt8(variables.time)
                variables.time -= TimeInterval(seconds)
                
                // Format time vars with leading zero
                let strMinutes = String(format: "%02d", minutes)
                let strSeconds = String(format: "%02d", seconds)
                
                if variables.isPortrait {
                    portraitForwardTimeLabel.text = strMinutes + "." + strSeconds
                } else {
                    
                    forwardTimeLabel.text = strMinutes + "." + strSeconds
                    
                }
            }
                
                
            else {
                progressBarWidthConstant.constant = self.view.frame.size.width
                
            }
            
        }
        else {
            
            quickSave1FillHeight.constant = 0
            quickSave2FillHeight.constant = 0
            quickSave3FillHeight.constant = 0
            quickSave4FillHeight.constant = 0
            
            
            quickSave1FillWidth.constant = 0
            quickSave2FillWidth.constant = 0
            quickSave3FillWidth.constant = 0
            quickSave4FillWidth.constant = 0
            
            progressBarWidthConstant.constant = 0
            
        }
        
    }
    
    func setupInterface(){
        // GENERAL INTERFACE SETTINGS
        
        goPremiumPriceLabel.text = variables.price
        goPremiumPriceLabel.textColor = Colors.main.color4
        upgradeButton.setTitleColor(Colors.main.color3, for: .normal)
        upgradeHintText.textColor = Colors.main.color3
        
        recordButton.isEnabled = false
        recordButtonRing.isHidden = true
        
        recButtonToRing()
        
        
        
        indicator.hidesWhenStopped = true
        portraitIndicator.hidesWhenStopped = true
        statusLabel.text = ""
        portraitStatusLabel.text = ""
        checkMarkView.isHidden = true
        portraitCheckMarkView.isHidden = true
        statusViewBackground.isHidden = true
        portraitStatusViewBackground.isHidden = true
        variables.sliderIsUp = false
        //darkBackView.alpha = 0.2
        // editButtonsBackgroundView.layer.cornerRadius = 10
        editQuickBackground.isHidden = true
        editQuickView.isHidden = true
        // editQuickButtonsView.alpha = 0
        // self.settingsBlurView?.alpha = 0
        qs1ArrowButton.setImage(UIImage(named: "download-empty"), for: .normal)
        qs2ArrowButton.setImage(UIImage(named: "download-empty"), for: .normal)
        qs3ArrowButton.setImage(UIImage(named: "download-empty"), for: .normal)
        qs4ArrowButton.setImage(UIImage(named: "download-empty"), for: .normal)
        
  
        
        portraitSettingsButton.transform = CGAffineTransform.init(rotationAngle: 270 * .pi/180)
        portraitCurrentTimeLabel.transform = CGAffineTransform.init(rotationAngle: 270 * .pi/180)
        portraitClockBackground.transform = CGAffineTransform.init(rotationAngle: 270 * .pi/180)
        portraitClockBackground.layer.cornerRadius = 4
        clockBackground.layer.cornerRadius = 10
        flipButton.setImage(UIImage(named: "reverse-camera-outline"), for: .normal)
        flipButtonBackground.setImage(UIImage(named: "reverse-camera"), for: .normal)
        
        
        flashButton.setImage(UIImage(named: "bolt-outline"), for: .normal)
        flashButtonBackground.setImage(UIImage(named: "bolt"), for: .normal)
        
        editQuickSaveTimesButton.setImage(UIImage(named: "settings"), for: .normal)
        editQuicksaveButtonsBackgrounds.setImage(UIImage(named: "settings-strong"), for: .normal)
        
        

        
        portraitStatusView.transform = CGAffineTransform.init(rotationAngle: 270 * .pi/180)
        // portraitStatusViewBackground.transform = CGAffineTransform.init(rotationAngle: 270 * .pi/180)
        portraitTimerView.transform = CGAffineTransform.init(rotationAngle: 270 * .pi/180)
        
  
        
        quickSave1Button.isEnabled = false
        quickSave2Button.isEnabled = false
        quickSave3Button.isEnabled = false
        quickSave4Button.isEnabled = false
        
        qs1ArrowButton.isEnabled = false
        qs2ArrowButton.isEnabled = false
        qs3ArrowButton.isEnabled = false
        qs4ArrowButton.isEnabled = false
        
        
        
        
        checkMarkView.image = UIImage(named: "checkmark-empty")
        portraitCheckMarkView.image = UIImage(named: "checkmark-empty")
        saveButton.setImage(UIImage(named: "ios7-checkmark-outline"), for: .normal)
        cancelButton.setImage(UIImage(named: "ios7-close-outline"), for: .normal)
        
        forwardTimeLabel.text = ""
        portraitForwardTimeLabel.text = ""
        
        settingsButtonBackground.layer.cornerRadius = 10
        horizontalViewBackground.layer.cornerRadius = 10
        statusViewBackground.layer.cornerRadius = 10
        portraitStatusViewBackground.layer.cornerRadius = 10
        portraitTimerBackground.layer.cornerRadius = 10
        
        createButtonsAndVariables()
        
        upgradeHintView.layer.cornerRadius = 10
        
        goPremiumButtonBackground.layer.cornerRadius = 10
        goPremiumButtonBackground2.layer.cornerRadius = 10
        
        editQuicksaveButtonsBackgrounds.layer.cornerRadius = 10
        editqsButtonsBackFrame.layer.cornerRadius = 10
        
        flashBackgroundFrame.layer.cornerRadius = 10
        
        flashButtonBackground.layer.cornerRadius = 10
 
        
        qsView1.layer.cornerRadius = 10
        qsView2.layer.cornerRadius = 10
        qsView3.layer.cornerRadius = 10
        qsView4.layer.cornerRadius = 10
        
        qsView1.layer.borderColor = UIColor.clear.cgColor
        qsView2.layer.borderColor = UIColor.clear.cgColor
        qsView3.layer.borderColor = UIColor.clear.cgColor
        qsView4.layer.borderColor = UIColor.clear.cgColor
        
        
        qsView1.layer.borderWidth = 4
        qsView2.layer.borderWidth = 4
        qsView3.layer.borderWidth = 4
        qsView4.layer.borderWidth = 4
        
        
        flashShadeFrame.layer.cornerRadius = 10
        flipsShadeFrame.layer.cornerRadius = 10
        orientationShadeFrame.layer.cornerRadius = 10
        recordShadeFrame.layer.cornerRadius = recordShadeFrame.bounds.height / 2
        editShadeFrame.layer.cornerRadius = 10
        

        
    }
    
    func setupUiForPremium() {
        if !variables.isPremiumUser {
            goPremiumView.isHidden = false
            goPremiumView2.isHidden = false
            updateRequiredView.isHidden = false
            
            print("USER is premium: \(variables.isPremiumUser)")
        }
        else {
            goPremiumView.isHidden = true
            goPremiumView2.isHidden = true
            updateRequiredView.isHidden = true
            
            print("USER is premium: \(variables.isPremiumUser)")
            timePickerView1.reloadAllComponents()
            timePickerView2.reloadAllComponents()
            timePickerView3.reloadAllComponents()
            timePickerView4.reloadAllComponents()
        }
        
    }
    
    func recButtonToRing() {
        redRecButton.layer.borderWidth = 1
        redRecButton.layer.borderColor = UIColor.white.cgColor
        UIView.animate(withDuration: 0.1, animations: {
            self.redRecButton.backgroundColor = UIColor.black.withAlphaComponent(0.3)
            self.redRecButton.transform =  CGAffineTransform(scaleX: 1.2, y: 1.2)
            self.redRecButton.layer.cornerRadius = 20
        }, completion: { _ in
            UIView.animate(withDuration: 0.1, animations: {
                self.redRecButton.transform =  CGAffineTransform(scaleX: 1, y: 1)
            })
        })
        
    }
    
    func recButtonToSquare() {
        redRecButton.layer.borderWidth = 0
        redRecButton.layer.borderColor = UIColor.white.cgColor
        UIView.animate(withDuration: 0.1, animations: {
            self.redRecButton.backgroundColor = UIColor.red
            self.redRecButton.transform =  CGAffineTransform(scaleX: 0.4, y: 0.4)
        }, completion: { _ in
            UIView.animate(withDuration: 0.1, animations: {
                self.redRecButton.layer.cornerRadius = 8
                self.redRecButton.transform =  CGAffineTransform(scaleX: 0.6, y: 0.6)
            })
        })
        
        
        
        
    }
    
    func createButtonsAndVariables(){

        recButtonToRing()
        
        recordButtonRing.layer.borderColor = UIColor.white.cgColor
        recordButtonRing.layer.borderWidth = 4
        recordButtonRing.layer.cornerRadius = recordButtonRing.frame.size.height / 2
        recordButton.layer.cornerRadius = recordButton.frame.size.height / 8
        
        editNormalsaveRingLarge.layer.cornerRadius = editNormalsaveRingLarge.frame.size.height / 2
        editNormalsaveRingLarge.layer.borderWidth = 4
        editNormalsaveRingLarge.layer.borderColor = UIColor.lightGray.cgColor
        editNormalsaveRingSmall.layer.cornerRadius = editNormalsaveRingSmall.frame.size.height / 8
        
        
  
        
        quickSave1Button.layer.cornerRadius = 10
        quickSave2Button.layer.cornerRadius = 10
        quickSave3Button.layer.cornerRadius = 10
        quickSave4Button.layer.cornerRadius = 10

        setTimePickers()
    }
    
    func setTimePickers() {
        // TIMEPICKERS
        timePickerView1.dataSource = self
        timePickerView1.delegate = self
        timePickerView2.dataSource = self
        timePickerView2.delegate = self
        timePickerView3.dataSource = self
        timePickerView3.delegate = self
        timePickerView4.dataSource = self
        timePickerView4.delegate = self
        customSaveTimePicker.dataSource = self
        customSaveTimePicker.delegate = self
        
        timePickerView1.selectRow(variables.b1Seconds, inComponent: 1, animated: false)
        timePickerView1.selectRow(variables.b1Minutes, inComponent: 0, animated: false)
        timePickerView2.selectRow(variables.b2Seconds, inComponent: 1, animated: false)
        timePickerView2.selectRow(variables.b2Minutes, inComponent: 0, animated: false)
        timePickerView3.selectRow(variables.b3Seconds, inComponent: 1, animated: false)
        timePickerView3.selectRow(variables.b3Minutes, inComponent: 0, animated: false)
        timePickerView4.selectRow(variables.b4Seconds, inComponent: 1, animated: false)
        timePickerView4.selectRow(variables.b4Minutes, inComponent: 0, animated: false)
        
    }
    
    func setCustomTimePicker() {
        customSaveTimePicker.selectRow(variables.bCustomSeconds, inComponent: 1, animated: false)
        customSaveTimePicker.selectRow(variables.bCustomMinutes, inComponent: 0, animated: false)
    }
    
    
    func firstTrackOvertime(quickSaveTime:Double, count:Int, stopTime:Double) -> (file: Int, overtime: CMTime) {
        
        //print("count at firstTrackOvertime: \(count)")
        print("quickSaveTime: \(quickSaveTime)")
        print("StopTime: \(stopTime)")
        
        var saveTime = Int64()
        if stopTime == 0 {
            saveTime = Int64(quickSaveTime)
        }
        else if stopTime < quickSaveTime{
            saveTime = Int64(stopTime)
        } else {
            saveTime = Int64(quickSaveTime)
        }
        
        print("saveTime: \(saveTime)")
        
        let videoDuration = CMTimeMake(value: saveTime, timescale: 1)
        print("Videoduration \(videoDuration.seconds)")
        
        var cumulativeDuration:CMTime = variables.endTimeMoved
        print("Cumulative duration \(cumulativeDuration.seconds)")
        var lastFullClip = Int()
        
        // Check video asset lengths in REVERSE order
        
        outer: do {
            inner: for i in stride(from: count-1, through: 1, by: -1) {
                let fileName = String(i) + ".mov"
                let directory = NSTemporaryDirectory()
                let outputURL = NSURL.fileURL(withPathComponents: [directory, fileName])
                //print("URL: " , fileName)
                let currentAsset = AVAsset(url: outputURL!)
                if currentAsset.tracks(withMediaType: AVMediaType.video).count > 0 {
                    let videoAssetTrack = currentAsset.tracks(withMediaType: AVMediaType.video)[0]
                    cumulativeDuration = CMTimeAdd(cumulativeDuration, videoAssetTrack.timeRange.duration)
                    lastFullClip = i
                }
                //print("LAST FILE " , fileName)
                if cumulativeDuration >= videoDuration {
                    break outer
                }
            }
            
        }
        print("Cumulative duration after loops \(cumulativeDuration.seconds)")
        let clipOvertime = CMTimeSubtract(cumulativeDuration, videoDuration)
        print("Clip Overtime \(clipOvertime.seconds)")
        return (lastFullClip, clipOvertime)
        
    }
    
    func merge(quickSaveTime: Double, count: Int, stopTime: Double)
    {
        
        let thisComposition = AVMutableComposition()
        let videoTrack = thisComposition.addMutableTrack(withMediaType: AVMediaType.video, preferredTrackID: kCMPersistentTrackID_Invalid)
        let audioTrack = thisComposition.addMutableTrack(withMediaType: AVMediaType.audio, preferredTrackID: kCMPersistentTrackID_Invalid)
        var allVideoInstructions = [AVMutableVideoCompositionLayerInstruction]()
        
        
        // trim from multiple videos
        let firstClipInfo = firstTrackOvertime(quickSaveTime: quickSaveTime, count:count, stopTime:stopTime)
        var startTime:CMTime = CMTime.zero
        
        for i in firstClipInfo.file ..< count
        {
            //print(startTime.seconds)
            let fileName = String(i) + ".mov"
            let directory = NSTemporaryDirectory()
            let outputURL = NSURL.fileURL(withPathComponents: [directory, fileName])
            //print("URL: " , fileName!)
            
            let asset = AVAsset(url: outputURL!)
            
            var videoAssetTrack: AVAssetTrack!
            videoAssetTrack = nil
            if (asset.tracks(withMediaType: AVMediaType.video).count > 0)
            {
                videoAssetTrack = asset.tracks(withMediaType: AVMediaType.video)[0]
                
            }
            var audioAssetTrack: AVAssetTrack!
            audioAssetTrack = nil;
            if (asset.tracks(withMediaType: AVMediaType.audio).count > 0)
            {
                audioAssetTrack = asset.tracks(withMediaType: AVMediaType.audio)[0]
                
            }
            
            do{
                if i == firstClipInfo.file {
                    print("FIRST CLIP")
                    
                    if (videoAssetTrack != nil)
                        
                    {
                        try videoTrack!.insertTimeRange(CMTimeRangeMake(start: firstClipInfo.overtime, duration: CMTimeSubtract(videoAssetTrack.timeRange.duration, firstClipInfo.overtime)), of: videoAssetTrack, at: startTime)
                    }
                    
                    if (audioAssetTrack != nil)
                    {
                        try audioTrack!.insertTimeRange(CMTimeRangeMake(start: firstClipInfo.overtime, duration: CMTimeSubtract(videoAssetTrack.timeRange.duration, firstClipInfo.overtime)), of: audioAssetTrack, at: startTime)
                        
                    }
                    print("firstClipInfo.overtime \(firstClipInfo.overtime.seconds)")
                    // print("videoAssetTrack. timeRange duration \(videoAssetTrack.timeRange.duration.seconds)")
                    print("startTime \(startTime.seconds)")
                    let duration = CMTimeSubtract(videoAssetTrack.timeRange.duration, firstClipInfo.overtime)
                    print("duration \(duration.seconds)")
                    startTime = CMTimeAdd(startTime, duration)
                }
                else {
                    print("NORMAL CLIP")
                    if (videoAssetTrack != nil)
                        // poista kaikista ensimmäinen frame CMTime 1, 30
                    {
                        try videoTrack!.insertTimeRange(CMTimeRangeMake(start: CMTimeMake(value: 1, timescale: 30), duration: CMTimeSubtract(videoAssetTrack.timeRange.duration, CMTimeMake(value: 1, timescale: 30))), of: videoAssetTrack, at: startTime)
                    }
                    
                    if (audioAssetTrack != nil)
                    {
                        try audioTrack!.insertTimeRange(CMTimeRangeMake(start: CMTimeMake(value: 1, timescale: 30), duration: CMTimeSubtract(videoAssetTrack.timeRange.duration, CMTimeMake(value: 1, timescale: 30))), of: audioAssetTrack, at: startTime)
                    }
                    
                    // print("videoAssetTrack. timeRange duration \(videoAssetTrack.timeRange.duration.seconds)")
                    print("startTime \(startTime.seconds)")
                    
                    //print(videoAssetTrack.timeRange.duration.seconds)
                    let duration = CMTimeSubtract(videoAssetTrack.timeRange.duration, CMTimeMake(value: 1, timescale: 30))
                    print("duration \(duration.seconds)")
                    startTime = CMTimeAdd(startTime, duration)
                }
            }
            catch {
                print("Error: videon haluttu kesto pidempi kuin tallennusaika")
            }
            
        }
        
        if (variables.endTimeMoved != CMTime.zero) {
            print("new compostion")
            let newComposition = AVMutableComposition()
            let newVideoTrack = newComposition.addMutableTrack(withMediaType: AVMediaType.video, preferredTrackID: kCMPersistentTrackID_Invalid)
            let newAudioTrack = newComposition.addMutableTrack(withMediaType: AVMediaType.audio, preferredTrackID: kCMPersistentTrackID_Invalid)
            
            let videoTrack = thisComposition.tracks(withMediaType: AVMediaType.video)[0]
            let audioTrack = thisComposition.tracks(withMediaType: AVMediaType.audio)[0]
            let trackEndTime = CMTime(seconds: quickSaveTime, preferredTimescale: 44100)
            
            do {
                try newVideoTrack!.insertTimeRange(CMTimeRangeMake(start: CMTime.zero, duration: trackEndTime), of: videoTrack, at: CMTime.zero)
                try newAudioTrack!.insertTimeRange(CMTimeRangeMake(start: CMTime.zero, duration: trackEndTime), of: audioTrack, at: CMTime.zero)
                
            } catch {
                print("problem with new composition")
            }
            variables.composition = newComposition
            variables.endTimeMoved = CMTime.zero
        }
        else {
            variables.composition = thisComposition
        }
        

        Helper.helper.clearAllFilesFromTempDirectory()
        DispatchQueue.main.async {
            self.exportVideo()
            
            
        }
    }
    
    func getProcessTime()->Int64 {
        return Int64(Date().timeIntervalSince1970 * 10)
    }
    
    func exportVideo() {
        variables.exporting = true
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .long
        let date = dateFormatter.string(from: NSDate() as Date)
        
        let documentsPath = NSURL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0])
        
        let path = documentsPath.appendingPathComponent("AfterSave\(date).mov")
        
        // EXPORT
        let exporter = AVAssetExportSession(asset: variables.composition, presetName: AVAssetExportPresetHighestQuality)
        exporter?.outputURL = path
        exporter?.shouldOptimizeForNetworkUse = true
        exporter?.outputFileType = AVFileType.mov
        
        
        exporter?.exportAsynchronously(completionHandler: {
            DispatchQueue.main.async {
                UISaveVideoAtPathToSavedPhotosAlbum((exporter?.outputURL?.path)!, self, nil, nil);
                print("EXPORT finished at:", self.getProcessTime())
                variables.exporting = false
                
                DispatchQueue.main.async {
                    
                    if variables.isPortrait {
                        self.portraitIndicator.stopAnimating()
                        self.finishStatusLabel()
                        
                    } else {
                        self.indicator.stopAnimating()
                        self.finishStatusLabel()
                    }
                    
                    self.continueRecording()
                    
                }
                
            }
            
        })
        
    }
    
    func finishStatusLabel() {
        
        if variables.isPortrait {
            self.portraitCheckMarkView.isHidden = false
            self.portraitStatusLabel.text = "Done"
            let when = DispatchTime.now() + 1 // wait
            DispatchQueue.main.asyncAfter(deadline: when) {
                self.portraitStatusLabel.text = ""
                self.portraitCheckMarkView.isHidden = true
                self.portraitStatusView.isHidden = true
                self.portraitStatusViewBackground.isHidden = true
                self.portraitTimerView.isHidden = false
                
                
                self.statusLabel.text = ""
                self.checkMarkView.isHidden = true
                self.statusViewBackground.isHidden = true
            }
            
        } else {
            
            self.checkMarkView.isHidden = false
            self.statusLabel.text = "Done"
            let when = DispatchTime.now() + 1 // wait
            DispatchQueue.main.asyncAfter(deadline: when) {
                
                self.portraitStatusLabel.text = ""
                self.portraitCheckMarkView.isHidden = true
                self.portraitStatusView.isHidden = true
                self.portraitStatusViewBackground.isHidden = true
                
                self.statusLabel.text = ""
                self.checkMarkView.isHidden = true
                self.statusViewBackground.isHidden = true
                self.settingsButton.isHidden = false
                self.settingsButtonBackground.isHidden = false
                
                if !variables.isPremiumUser {
                    self.goPremiumView.isHidden = false
                }
            }
        }
    }
}

extension UIView {
    func shakes() {
        
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.1
        shake.repeatCount = 2
        shake.autoreverses = true
        
        let fromPoint = CGPoint(x: center.x - 5, y: center.y)
        let fromValue = NSValue(cgPoint: fromPoint)
        
        let toPoint = CGPoint(x: center.x + 5, y: center.y)
        let toValue = NSValue(cgPoint: toPoint)
        
        shake.fromValue = fromValue
        shake.toValue = toValue
        
        layer.add(shake, forKey: "position")
    }
    
    func pulsates() {
        
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 1
        pulse.fromValue = 0.75
        pulse.toValue = 1.5
        pulse.autoreverses = true
        pulse.repeatCount = 1
        pulse.initialVelocity = 0.5
        pulse.damping = 1.0
        
        layer.add(pulse, forKey: "pulse")
    }
}

extension UIButton {
    
    func pulsate() {
        
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.6
        pulse.fromValue = 0.95
        pulse.toValue = 1.0
        pulse.autoreverses = true
        pulse.repeatCount = 1
        pulse.initialVelocity = 0.5
        pulse.damping = 1.0
        
        layer.add(pulse, forKey: "pulse")
    }
    
    func flash() {
        
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.duration = 0.5
        flash.fromValue = 1
        flash.toValue = 0.1
        flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        flash.autoreverses = true
        flash.repeatCount = 3
        
        layer.add(flash, forKey: nil)
    }
    
    
    func shake() {
        
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.1
        shake.repeatCount = 2
        shake.autoreverses = true
        
        let fromPoint = CGPoint(x: center.x - 5, y: center.y)
        let fromValue = NSValue(cgPoint: fromPoint)
        
        let toPoint = CGPoint(x: center.x + 5, y: center.y)
        let toValue = NSValue(cgPoint: toPoint)
        
        shake.fromValue = fromValue
        shake.toValue = toValue
        
        layer.add(shake, forKey: "position")
    }
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromAVMediaType(_ input: AVMediaType) -> String {
    return input.rawValue
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromAVLayerVideoGravity(_ input: AVLayerVideoGravity) -> String {
    return input.rawValue
}
