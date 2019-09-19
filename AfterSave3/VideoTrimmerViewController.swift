// VideoTrimmerViewController.swift
//
//  AfterSave
//
//  Created by Juhani Vainio on 22/01/2018.
//  Copyright © 2018 JuhaniVainio. All rights reserved.
//


import UIKit
import AVFoundation
import MobileCoreServices
import PryntTrimmerView
import RangeSeekSlider

class VideoTrimmerViewController: UIViewController {
    
    var cancelTapGesture = UITapGestureRecognizer()
    var upgradeTapGesture = UITapGestureRecognizer()
    var saveTapGesture = UITapGestureRecognizer()
    
    var clockEndTime = Date()
    var clockStartTime = Date()
    
    @IBOutlet weak var atTimeLabel: UILabel!
    @IBOutlet weak var atTimeLabelBackground: UIView!
    @IBOutlet weak var atStartTimeLabel: UILabel!
    @IBOutlet weak var atStartTimeLabelBackground: UIView!
    
    @IBOutlet weak var upgradeButton: UIButton!
    @IBOutlet weak var upgradeButtonBackground: UIView!
    
    @IBOutlet weak var goPremiumButtonView: UIView!
    @IBOutlet weak var quickSave2ButtonView: UIView!
     @IBOutlet weak var cancelView: UIView!
    
    @IBOutlet weak var cancelButtonBG: UIView!
    @IBOutlet weak var saveButtonBG: UIView!
    @IBOutlet weak var cancelButton: UIButton!
 
    @IBOutlet weak var saveButton: UIButton!

    
    var singleAssetUI = Bool()
    
    var quickSaveTime = Double()
    var count = Int()
    var stopTime = Double()
    
    @IBOutlet weak var leftMaskWidth: NSLayoutConstraint!
    @IBOutlet weak var rightMaskWidth: NSLayoutConstraint!
    
    var doubleAsset = Bool()
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var timeLabelBackground: UIView!
    
    @IBOutlet weak var rangeSlider: RangeSeekSlider!

    @IBOutlet weak var playerView: UIView!
    @IBOutlet weak var playerView2: UIView!
    @IBOutlet weak var trimmerView: TrimmerView!
    @IBOutlet weak var trimmer1Width: NSLayoutConstraint!
    @IBOutlet weak var trimmerView2: TrimmerView!
    @IBOutlet weak var trimmer2Width: NSLayoutConstraint!
    
    var handleWidth = CGFloat(33)
    var topRatio = CGFloat()
    var sliderToHandleRatio = CGFloat()
    
    var currentPlayer = Int()
    var rangeSliderCurrentMinValue = CGFloat() {
        didSet {
            let width = rangeSliderCurrentMinValue * topRatio
            let handleLocation = width / rangeSlider.frame.size.width
            //let handleWidthRatio = handleWidth - (handleLocation * handleWidth)
           // leftMaskWidth.constant = width + handleWidthRatio - (handleWidth / 2) - 11
            leftMaskWidth.constant = handleLocation * rangeSlider.frame.size.width + 8
            print("Frame Width: \(rangeSlider.frame.size.width)...Range Width: \(width)... Ratio: \(handleLocation)... Mask Location:\(leftMaskWidth.constant)...")
        }
    }
    var rangeSliderCurrentMaxValue = CGFloat() {
        didSet {
            let width = rangeSliderCurrentMaxValue * topRatio
            let handleLocation = width / rangeSlider.frame.size.width
           // let handleWidthRatio = handleWidth - (handleLocation * handleWidth)
            rightMaskWidth.constant = rangeSlider.frame.size.width - width + 8
            //rightMaskWidth.constant = handleLocation * rangeSlider.frame.size.width - 8
            print("Frame Width: \(rangeSlider.frame.size.width)...Range Width: \(width)... Ratio: \(handleLocation)... Mask Location:\(rightMaskWidth.constant)...")
        }
    }
    
    var topLayerDuration = Double()
    var trimDuration = Double()
    var endTime = Double()
    
    var player: AVPlayer?
    var player2: AVPlayer?
    
    var playbackTimeCheckerTimer: Timer?
    var trimmerPositionChangedTimer: Timer?
    
    var loaded = false
    
    override func viewDidLayoutSubviews() {
        if loaded == false {
        loadAssets()
            loaded = true
            print("INITIAL CUSTOM SAVE VALUES")
            print("\(variables.customButtonValue) \(variables.customStopTime)")
        }
    }
    
    override var preferredScreenEdgesDeferringSystemGestures: UIRectEdge {
        return .all
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         NotificationCenter.default.addObserver(self, selector: #selector(flipLandscapeOrientation), name: UIDevice.orientationDidChangeNotification, object: nil)
        
        if variables.isPortrait {
            self.view.transform = CGAffineTransform.init(rotationAngle: 270 * .pi/180)
        } else {
            flipLandscapeOrientation()
        }
        
    
        if !variables.isPremiumUser {
            goPremiumButtonView.isHidden = false
            quickSave2ButtonView.isHidden = true
        }
        else {
            goPremiumButtonView.isHidden = true
            quickSave2ButtonView.isHidden = false
        }
        timeLabelBackground.layer.cornerRadius = 10
        atTimeLabelBackground.layer.cornerRadius = 10
        atStartTimeLabelBackground.layer.cornerRadius = 10
        upgradeButtonBackground.layer.cornerRadius = 10
        cancelButtonBG.layer.cornerRadius = 10
        saveButtonBG.layer.cornerRadius = 10
        
        
        self.cancelTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleCancelTap))
        self.cancelView.addGestureRecognizer(cancelTapGesture)
        self.cancelView.isUserInteractionEnabled = true
        
        self.upgradeTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleUpgradeTap))
        self.goPremiumButtonView.addGestureRecognizer(upgradeTapGesture)
        self.goPremiumButtonView.isUserInteractionEnabled = true
        
        self.saveTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleSaveTap))
        self.quickSave2ButtonView.addGestureRecognizer(saveTapGesture)
        self.quickSave2ButtonView.isUserInteractionEnabled = true
       
    }
    
    @objc func handleCancelTap() {
        variables.dismissingTrimmer = true
        variables.customSave = false
        dismiss(animated: true, completion: nil)
    }
    
    @objc func handleUpgradeTap() {
        self.upgradeButton.sendActions(for: .touchUpInside)
    }
    
    @objc func handleSaveTap() {
        variables.endTimeMoved = CMTime(seconds: endTime - variables.customStopTime, preferredTimescale: 44100)
        variables.customStopTime = endTime
        variables.customButtonValue = trimDuration
        
        variables.dismissingTrimmer = true
        variables.customSave = true
        
        dismiss(animated: true, completion: nil)
    }
    
    @objc func flipLandscapeOrientation() {
        
        if !variables.isPortrait {
            if UIDevice.current.orientation == UIDeviceOrientation.landscapeLeft || UIDevice.current.orientation == UIDeviceOrientation.landscapeRight {
                    if UIDevice.current.orientation == UIDeviceOrientation.landscapeLeft {
                        self.view.transform = CGAffineTransform.init(rotationAngle: 0)
                        variables.isLandscapeLeft = false
                        self.view.setNeedsDisplay()
                    } else if UIDevice.current.orientation == UIDeviceOrientation.landscapeRight {
                        self.view.transform = CGAffineTransform.init(rotationAngle: 180 * .pi / 180)
                        variables.isLandscapeLeft = true
                        self.view.setNeedsDisplay()
                    }
                }
            
        }
        
    }
    
    func rotateInterface() {
        print("rotating")
        self.view.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        //self.view.layoutIfNeeded()
        self.view.setNeedsDisplay()
    }
    
    func loadAssets() {
        
        var fileArray = [String]()
        
        outer: do {
            inner: for i in stride(from: variables.customCount - 1, through: 1, by: -1) {
                let fileName = String(i) + ".mov"
                let directory = NSTemporaryDirectory()
                let outputURL = NSURL.fileURL(withPathComponents: [directory, fileName])
                
                if FileManager.default.fileExists(atPath: (outputURL?.path)!) {
                    print("FILE \(fileName) EXISTS")
                    fileArray.insert(fileName, at: 0)
                    
                } else {
                    print("End loop")
                    break outer
                }
            }
        }
        
        if fileArray.count > 1 {
            print("Load double Assets")
            
            singleAssetUI = false
            let directory = NSTemporaryDirectory()
            var position = fileArray.count - 2
            let fileName1 = fileArray[position]
            print(fileName1)
            let outputURL1 = NSURL.fileURL(withPathComponents: [directory, fileName1])
            let asset1 = AVAsset(url: outputURL1!)
            
            position = position + 1
            let fileName2 = fileArray[position]
            print(fileName2)
            let outputURL2 = NSURL.fileURL(withPathComponents: [directory, fileName2])
            let asset2 = AVAsset(url: outputURL2!)
            print("TIMESCALES")
            print(asset1.duration)
            print(asset2.duration)
            let asset1Duration = asset1.duration.seconds
            let asset2Duration = asset2.duration.seconds
            topLayerDuration = asset1Duration + asset2Duration
            trimDuration = topLayerDuration
            variables.customStopTime = variables.doubleStopTime
            endTime = variables.customStopTime
            setTimeLabel()
            
            // set start and end times for clocks
            clockEndTime = variables.clockStoppedTime
            let timeForClockStartTime = TimeInterval(-Int(trimDuration).seconds)
            clockStartTime = clockEndTime.addingTimeInterval(timeForClockStartTime)
            atStartTimeLabel.text = DateFormatter.localizedString(from: clockStartTime, dateStyle: .none, timeStyle: .medium)
            atTimeLabel.text = DateFormatter.localizedString(from: clockEndTime, dateStyle: .none, timeStyle: .medium)
            
            // 1st and 2nd asset ratio
            let topLayerWidth = Double(rangeSlider.frame.size.width)
            // print(topLayerWidth)
            let ratio = asset1Duration / topLayerDuration
            // print(ratio)
            let asset1Width = CGFloat(topLayerWidth * ratio)
            // print(asset1Width)
            let asset2Width = CGFloat(topLayerWidth) - asset1Width
            // print(asset2Width)
            
            // Video duration ratio to width of full coorniate
            topRatio = CGFloat(topLayerWidth / topLayerDuration)
            // print(topRatio)
            
            setupRangeSlider(duration: CGFloat(topLayerDuration))
            
            trimmer1Width.constant = asset1Width
            trimmer2Width.constant = asset2Width
            
            loadTwoAssets(first: asset1, second: asset2)
      
        }
        else {
            print("Load single interface")
            singleAssetUI = true
            let directory = NSTemporaryDirectory()
            let fileName = fileArray[0]
            print(fileName)
            let outputURL = NSURL.fileURL(withPathComponents: [directory, fileName])
            let asset = AVAsset(url: outputURL!)
            
            print("TIMESCALE")
            print(asset.duration)
            
            let assetDuration = asset.duration.seconds
            topLayerDuration = assetDuration
            trimDuration = topLayerDuration
            endTime = variables.customStopTime
            setTimeLabel()
            
            // set start and end times for clocks
            clockEndTime = variables.clockStoppedTime
            let timeForClockStartTime = TimeInterval(-Int(trimDuration).seconds)
            clockStartTime = clockEndTime.addingTimeInterval(timeForClockStartTime)
            atStartTimeLabel.text = DateFormatter.localizedString(from: clockStartTime, dateStyle: .none, timeStyle: .medium)
            atTimeLabel.text = DateFormatter.localizedString(from: clockEndTime, dateStyle: .none, timeStyle: .medium)
            
            // asset ratio
            let topLayerWidth = Double(rangeSlider.frame.size.width)
            // print(topLayerWidth)
            let ratio = assetDuration / topLayerDuration
            // print(ratio)
            let assetWidth = CGFloat(topLayerWidth * ratio)
            // print(asset1Width)
            
            // Video duration ratio to width of full coorniate
            topRatio = CGFloat(topLayerWidth / topLayerDuration)
            // print(topRatio)
            
            setupRangeSlider(duration: CGFloat(topLayerDuration))
            
            trimmer1Width.constant = 0
            trimmer2Width.constant = assetWidth
            
            // loadAsset(asset1)
            // loadAsset2(asset2)
            
            DispatchQueue.main.async {
                self.loadAsset2(asset)
            }
            
        }
        
    }
    
    func setTimeLabel() {
        var time = trimDuration
        // Calculate minutes
        let minutes = UInt8(time / 60.0)
        time -= (TimeInterval(minutes) * 60)
        
        // Calculate seconds
        let seconds = UInt8(time)
        time -= TimeInterval(seconds)
        
        // Calculate hundreds
        let fraction = UInt8(time * 100)
        
        // Format time vars with leading zero
        let strMinutes = String(format: "%02d", minutes)
        let strSeconds = String(format: "%02d", seconds)
       // let strFraction = String(format: "%02d", fraction)
        
        timeLabel.text = strMinutes + "." + strSeconds
        
    }
    
    func loadTwoAssets(first: AVAsset, second: AVAsset) {
        DispatchQueue.main.async {
            self.loadAsset(first)
        }
        DispatchQueue.main.async {
            self.loadAsset2(second)
        }
        
    }
    

    
    @IBAction func play(_ sender: Any) {
      
      
    }
    
    @IBAction func tapCancel(_ sender: Any) {
        variables.dismissingTrimmer = true
        variables.customSave = false
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tapSaveButton(_ sender: Any) {
        variables.endTimeMoved = CMTime(seconds: endTime - variables.customStopTime, preferredTimescale: 44100)
        variables.customStopTime = endTime
        variables.customButtonValue = trimDuration
        
        variables.dismissingTrimmer = true
        variables.customSave = true
       
        dismiss(animated: true, completion: nil)
    }
    
    
    func setupRangeSlider(duration: CGFloat) {
        
        rangeSlider.delegate = self
        rangeSlider.minValue = 0.0
        rangeSliderCurrentMinValue = 0.0
        rangeSlider.maxValue = duration
        rangeSliderCurrentMaxValue = duration
        rangeSlider.selectedMinValue = 0.0
        
        rangeSlider.selectedMaxValue = duration
        rangeSlider.handleDiameter = 22
        
        rangeSlider.handleImage = UIImage(named:"handle-48")
        rangeSlider.selectedHandleDiameterMultiplier = 1.5
        handleWidth = rangeSlider.handleDiameter * rangeSlider.selectedHandleDiameterMultiplier
 
    }
    
     func loadAsset2(_ asset: AVAsset) {
        
        trimmerView2.asset = asset
        trimmerView2.delegate = self
        trimmerView2.handleColor = UIColor.clear
        trimmerView2.mainColor = UIColor.clear
        trimmerView2.positionBarColor = UIColor.clear
        addVideoPlayer2(with: asset, playerView: playerView2)
        currentPlayer = 2
        let postitionTime = CMTime(seconds: trimDuration / 2, preferredTimescale: 44100)
        trimmerView2.delegate?.didChangePositionBar(postitionTime)
    }
    
     func loadAsset(_ asset: AVAsset) {
        
        trimmerView.asset = asset
        trimmerView.delegate = self
        trimmerView.handleColor = UIColor.clear
        trimmerView.mainColor = UIColor.clear
        trimmerView.positionBarColor = UIColor.clear
        addVideoPlayer(with: asset, playerView: playerView)
        
    }
    
    func addVideoPlayer(with asset: AVAsset, playerView: UIView) {
        let playerItem = AVPlayerItem(asset: asset)
        player = AVPlayer(playerItem: playerItem)
        
        NotificationCenter.default.addObserver(self, selector: #selector(VideoTrimmerViewController.itemDidFinishPlaying(_:)),
                                               name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: playerItem)
        
        let layer: AVPlayerLayer = AVPlayerLayer(player: player)
        layer.backgroundColor = UIColor.white.cgColor
        layer.frame = CGRect(x: 0, y: 0, width: playerView.frame.width, height: playerView.frame.height)
        layer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        playerView.layer.sublayers?.forEach({$0.removeFromSuperlayer()})
        playerView.layer.addSublayer(layer)
    }
    func addVideoPlayer2(with asset: AVAsset, playerView: UIView) {
        let playerItem = AVPlayerItem(asset: asset)
        player2 = AVPlayer(playerItem: playerItem)
        
        NotificationCenter.default.addObserver(self, selector: #selector(VideoTrimmerViewController.itemDidFinishPlaying(_:)),
                                               name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: playerItem)
        
        let layer: AVPlayerLayer = AVPlayerLayer(player: player2)
        layer.backgroundColor = UIColor.white.cgColor
        layer.frame = CGRect(x: 0, y: 0, width: playerView.frame.width, height: playerView.frame.height)
        layer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        playerView.layer.sublayers?.forEach({$0.removeFromSuperlayer()})
        playerView.layer.addSublayer(layer)
    }
    
    @objc func itemDidFinishPlaying(_ notification: Notification) {
        if let startTime = trimmerView.startTime {
            player?.seek(to: startTime)
        }
    }
    
    func startPlaybackTimeChecker() {
        
        stopPlaybackTimeChecker()
        playbackTimeCheckerTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self,
                                                        selector:
            #selector(VideoTrimmerViewController.onPlaybackTimeChecker), userInfo: nil, repeats: true)
    }
    
    func stopPlaybackTimeChecker() {
        
        playbackTimeCheckerTimer?.invalidate()
        playbackTimeCheckerTimer = nil
    }
    
    @objc func onPlaybackTimeChecker() {
        
        guard let startTime = trimmerView.startTime, let endTime = trimmerView.endTime, let player = player else {
            return
        }
        
        let playBackTime = player.currentTime()
        trimmerView.seek(to: playBackTime)
        
        if playBackTime >= endTime {
            player.seek(to: startTime, toleranceBefore: CMTime.zero, toleranceAfter: CMTime.zero)
            trimmerView.seek(to: startTime)
        }
    }
}

extension VideoTrimmerViewController: TrimmerViewDelegate {
    func positionBarStoppedMoving(_ playerTime: CMTime) {
        player?.seek(to: playerTime, toleranceBefore: CMTime.zero, toleranceAfter: CMTime.zero)
        player?.play()
        startPlaybackTimeChecker()
    }
    
    func didChangePositionBar(_ playerTime: CMTime) {
        stopPlaybackTimeChecker()
        if currentPlayer == 1 {
        player?.pause()
        player?.seek(to: playerTime, toleranceBefore: CMTime.zero, toleranceAfter: CMTime.zero)
        } else {
            player2?.pause()
            player2?.seek(to: playerTime, toleranceBefore: CMTime.zero, toleranceAfter: CMTime.zero)
        }
        // let duration = (trimmerView.endTime! - trimmerView.startTime!).seconds
        // print(duration)
    }
}

extension VideoTrimmerViewController: RangeSeekSliderDelegate {
    
    func rangeSeekSlider(_ slider: RangeSeekSlider, didChange minValue: CGFloat, maxValue: CGFloat) {
        if slider === rangeSlider {
            // print("Range slider updated. Min Value: \(minValue) Max Value: \(maxValue)")
            trimDuration = Double(maxValue - minValue)
            endTime = variables.customStopTime - (variables.customStopTime - Double(maxValue))
           // print("MIN VALUE: \(minValue)")
           // print("MAX VALUE: \(maxValue)")
            setTimeLabel()
        
            if singleAssetUI == true {
                // which slider?
                if rangeSliderCurrentMinValue != minValue {
                  //  print("left handle")
                    rangeSliderCurrentMinValue = minValue
                    let positionTime = CMTime(seconds: Double(minValue), preferredTimescale: 44100)
                    trimmerView2.delegate?.didChangePositionBar(positionTime)
                    
                    let timeForClockStartTime = TimeInterval(Int(minValue).seconds)
                    let newClockStartTime = clockStartTime.addingTimeInterval(timeForClockStartTime)
                    atStartTimeLabel.text = DateFormatter.localizedString(from: newClockStartTime, dateStyle: .none, timeStyle: .medium)
                }
                if rangeSliderCurrentMaxValue != maxValue {
                 //   print("right handle")
                    rangeSliderCurrentMaxValue = maxValue
                    let positionTime = CMTime(seconds: Double(maxValue), preferredTimescale: 44100)
                    trimmerView2.delegate?.didChangePositionBar(positionTime)
                    
                    let timeForClockEndTime = TimeInterval(-Int(CGFloat(topLayerDuration) - maxValue).seconds)
                    let newClockEndTime = clockEndTime.addingTimeInterval(timeForClockEndTime)
                    atTimeLabel.text = DateFormatter.localizedString(from: newClockEndTime, dateStyle: .none, timeStyle: .medium)
                    
                }
            }
            else {
            // which slider?
            if rangeSliderCurrentMinValue != minValue {
              // print("left handle")
                rangeSliderCurrentMinValue = minValue
                
                if Double(minValue) < (trimmerView.asset?.duration.seconds)! {
                 //   print("inside 1")
                    if currentPlayer != 1 {
                        playerView2.isHidden = true
                        //addVideoPlayer(with: trimmerView.asset!, playerView: playerView)
                        currentPlayer = 1
                    }
                    let positionTime = CMTime(seconds: Double(minValue), preferredTimescale: 44100)
                    trimmerView.delegate?.didChangePositionBar(positionTime)
                } else {
                  //  print("inside 2")
                    if currentPlayer != 2 {
                        playerView2.isHidden = false
                        //addVideoPlayer(with: trimmerView2.asset!, playerView: playerView)
                        currentPlayer = 2
                    }
                    let seekToTime = Double(minValue) - (trimmerView.asset?.duration.seconds)!
                    let positionTime = CMTime(seconds: seekToTime, preferredTimescale: 44100)
                    trimmerView2.delegate?.didChangePositionBar(positionTime)
                }
                
                let timeForClockStartTime = TimeInterval(Int(minValue).seconds)
                let newClockStartTime = clockStartTime.addingTimeInterval(timeForClockStartTime)
                atStartTimeLabel.text = DateFormatter.localizedString(from: newClockStartTime, dateStyle: .none, timeStyle: .medium)
                
            }
            if rangeSliderCurrentMaxValue != maxValue {
                // print("right handle")
                rangeSliderCurrentMaxValue = maxValue
                
                if Double(maxValue) >= (trimmerView.asset?.duration.seconds)! {
                    // print("inside 2")
                    if currentPlayer != 2 {
                        playerView2.isHidden = false
                        //addVideoPlayer(with: trimmerView2.asset!, playerView: playerView)
                        currentPlayer = 2
                        
                    }
                    let seekToTime = Double(maxValue) - (trimmerView.asset?.duration.seconds)!
                    let positionTime = CMTime(seconds: seekToTime, preferredTimescale: 44100)
                    trimmerView2.delegate?.didChangePositionBar(positionTime)
                    
                } else {
                     // print("inside 1")
                    if currentPlayer != 1 {
                        playerView2.isHidden = true
                        //addVideoPlayer(with: trimmerView.asset!, playerView: playerView)
                        currentPlayer = 1
                    }
                    let positionTime = CMTime(seconds: Double(maxValue), preferredTimescale: 44100)
                    trimmerView.delegate?.didChangePositionBar(positionTime)
                }
                
                let timeForClockEndTime = TimeInterval(-Int(CGFloat(topLayerDuration) - maxValue).seconds)
                let newClockEndTime = clockEndTime.addingTimeInterval(timeForClockEndTime)
                atTimeLabel.text = DateFormatter.localizedString(from: newClockEndTime, dateStyle: .none, timeStyle: .medium)
                
            }
            
        }
        }
    }
    
    func didStartTouches(in slider: RangeSeekSlider) {
        //  print("did start touches")
    }
    
    func didEndTouches(in slider: RangeSeekSlider) {
        // print("did end touches")
    }
}

extension Int {
    
    var seconds: Int {
        return self
    }
    
    var minutes: Int {
        return self.seconds * 60
    }
    
    var hours: Int {
        return self.minutes * 60
    }
    
    var days: Int {
        return self.hours * 24
    }
    
    var weeks: Int {
        return self.days * 7
    }
    
    var months: Int {
        return self.weeks * 4
    }
    
    var years: Int {
        return self.months * 12
    }
}

