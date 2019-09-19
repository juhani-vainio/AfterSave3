//
//  Helper.swift
//  AfterSave
//
//  Created by Juhani Vainio on 22/01/2018.
//  Copyright © 2018 JuhaniVainio. All rights reserved.
//

import Foundation
import UIKit
import CoreData
import AVFoundation

class Helper {
    
    static let helper = Helper()
    
    func getUnfinishedExportAssets() -> Bool {
        
        var isEmpty = true
        // fetching from core data
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Exports")
        
        do {
            let fetchResults = try context.fetch(fetchRequest) as? [NSManagedObject]
            if fetchResults?.count != 0 {
                
                let managedObject = fetchResults?[0]
                
                if let composition = managedObject?.value(forKey: "composition") {
                    variables.composition = composition as! AVMutableComposition
                    
                }
                if let mainComposition = managedObject?.value(forKey: "mainComposition") {
                    variables.mainComposition = mainComposition as! AVMutableVideoComposition
                    
                }
                isEmpty = false
            }
           
        }
        catch {
            
        }
        return isEmpty
    }
    
    func deleteFinishedExportAssets() {
        // start background thread excecution
        DispatchQueue.main.async {
            // core data
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            // delete old values from core data
            let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Exports")
            let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
            
            do {
                try context.execute(deleteRequest)
                try context.save()
                print("OLD Export files deleted")
            } catch {
                print ("ERROR3 deleting export assets")
            }
        }
    }
    
    func saveUnfinishedExportAssets() {
        // start background thread excecution
        DispatchQueue.main.async {
            let compositionData:NSData = NSKeyedArchiver.archivedData(withRootObject: variables.composition) as NSData
            let mainCompositionData:NSData = NSKeyedArchiver.archivedData(withRootObject: variables.mainComposition) as NSData
            
            // core data
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            // save new
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Exports")
            
            do {
                let fetchResults = try context.fetch(fetchRequest) as? [NSManagedObject]
                if fetchResults?.count != 0{
                    let managedObject = fetchResults?[0]
                    managedObject?.setValue(compositionData, forKey: "composition")
                    managedObject?.setValue(mainCompositionData, forKey: "mainComposition")
                    do {
                        try context.save()
                        print("Unfinished Export files UPDATED")
                    }
                    catch {
                        print("ERROR updating unfinished export files")
                    }
                    
                }
                else {
                    let newValues = NSEntityDescription.insertNewObject(forEntityName: "Exports", into: context)
                    newValues.setValue(compositionData, forKey: "composition")
                    newValues.setValue(mainCompositionData, forKey: "mainComposition")
                    do {
                        try context.save()
                        print("Unfinished Export files SAVED")
                    }
                    catch {
                        print("ERROR saving unfinished export files")
                    }
                    
                    
                }
            }
            catch {
                
            }
            
        }
    }
    
    func saveOrientation(portrait: Bool) {
        
    }
    
    func checkUserDefaults() {
        
        print("checkUserDefaults")
        let hasOrientation = UserDefaults.standard.object(forKey: "OrientationIsPortrait")
        if hasOrientation != nil {
            let orientation = UserDefaults.standard.bool(forKey: "OrientationIsPortrait")
            variables.isPortrait = orientation
            print("orientation is Portrait: \(orientation)")
        }
        else {
            variables.isPortrait = false
            print("NO User Defaults for orientation set")
        }
       
        let hasSetFront = UserDefaults.standard.object(forKey: "UseFrontCamera")
        if hasSetFront != nil {
            let isFront = UserDefaults.standard.bool(forKey: "UseFrontCamera")
            variables.useFrontCamera = isFront
            print("Use front camera: \(isFront)")
        }
        else {
            variables.useFrontCamera = false
            print("No Defaults for camera direction set")
        }
        
     
    }
    
    func saveButtonValues(first:Double, second:Double, third:Double, fourth:Double) {
        // start background thread excecution
        DispatchQueue.main.async {
            // core data
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            // delete old values from core data
            let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Buttons")
            let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
            
            do {
                try context.execute(deleteRequest)
                try context.save()
                print("OLD VALUES DELETED")
            } catch {
                print ("ERROR3")
            }
            
            // save new
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Buttons")
            
            do {
                let fetchResults = try context.fetch(fetchRequest) as? [NSManagedObject]
                if fetchResults?.count != 0{
                    let managedObject = fetchResults?[0]
                    managedObject?.setValue(first, forKey: "first")
                    managedObject?.setValue(second, forKey: "second")
                    managedObject?.setValue(third, forKey: "third")
                    managedObject?.setValue(fourth, forKey: "fourth")
                    do {
                        try context.save()
                        print("VALUES SAVED")
                    }
                    catch {
                        print("ERROR1")
                    }
                    
                }
                else {
                    let newValues = NSEntityDescription.insertNewObject(forEntityName: "Buttons", into: context)
                    newValues.setValue(first, forKey: "first")
                    newValues.setValue(second, forKey: "second")
                    newValues.setValue(third, forKey: "third")
                    newValues.setValue(fourth, forKey: "fourth")
                    do {
                        try context.save()
                        print("NEW VALUES SAVED ...\(first)...\(second)...\(third)...\(fourth)")
                    }
                    catch {
                        print("ERROR2")
                    }
                    
                    
                }
            }
            catch {
                
            }
            
            
        }
    }

    func configureButtonVariables() -> (exist:Bool, first:Double, second:Double, third:Double, fourth:Double) {
        var a = Double()
        var b = Double()
        var c = Double()
        var d = Double()
        var hasValues = Bool()
        // fetching from core data
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Buttons")
        fetchRequest.returnsObjectsAsFaults = false
        do {
            let fetchResults = try context.fetch(fetchRequest) as? [NSManagedObject]
            if fetchResults?.count != 0 {
                
                let managedObject = fetchResults?[0]
                
                if let first = managedObject?.value(forKey: "first") as? Double {
                    a = first
                }
                if let second = managedObject?.value(forKey: "second") as? Double {
                    b = second
                }
                if let third = managedObject?.value(forKey: "third") as? Double {
                    c = third
                }
                if let fourth = managedObject?.value(forKey: "fourth") as? Double {
                    d = fourth
                }
                hasValues = true
            }
            else {
                print("no values")
                hasValues = false
                a = 0
                b = 0
                c = 0
                d = 0
            }
        }
        catch {
            print("joku toinen errori")
            
        }
        return (hasValues, a, b, c, d)
    }
    
    func buttonTime(min:Int,sec:Int) -> String {
        var a = ""
        var b = ""
        var isMinute = true
        if min == 0 {
            isMinute = false
            b = String(sec)
            b = b + "s"
        } else if sec == 0 {
            a = String(min)
            a = a + "m"
        } else {
            let c = String(min)
            a = c + "."
            b = String(sec)
            if sec < 10 {
                b = "0" + b
            }
        }
        return a + b
    }
    
    func setMaxSaveTimeLabel(min: Int, sec: Int) -> String {
        
        var a = ""
        var b = ""
        var isMinute = true
        if min == 0 {
            isMinute = false
            b = String(sec)
            b = b + " sec"
            
        } else if sec == 0 {
            a = String(min)
            a = a + " min"
        } else {
            let c = String(min)
            a = c + "."
            //a = c + " min "
            b = String(sec)
            if sec < 10 {
                b = "0" + String(sec)
            }
            //b = b + " sec"
        }
        if isMinute == false {
            // label is sec
            print("1 is sec")
        }
        
        return a + b
    }
    
    func deleteOldFiles(fileNumber: Int) {
        let directory = NSTemporaryDirectory()
        let fileToDelete = String(fileNumber) + ".mov"
        let deleteURL = NSURL.fileURL(withPathComponents: [directory, fileToDelete])
        if FileManager.default.fileExists(atPath: deleteURL!.path) {
            do {
                print("fileToDelete: \(fileToDelete)")
                try FileManager.default.removeItem(at: deleteURL!)
            } catch _ {
            }
        }
    }
    
    func clearAllFilesFromTempDirectory() {
        print("clearing files")
        let fileManager = FileManager.default
        let tempFolderPath = NSTemporaryDirectory()
        do {
            let filePaths = try fileManager.contentsOfDirectory(atPath: tempFolderPath)
            for filePath in filePaths {
                print("DELETE FROM TEMP: \(filePath)")
                try fileManager.removeItem(atPath: tempFolderPath + filePath)
            }
        } catch {
            print("Could not clear temp folder: \(error)")
        }
    }
    
    func calculateMaxSpace() -> Double {
        var discSpace = Int64()
        // get available disc space
        discSpace = getFreeSize()!
        var sizeMB = Double(discSpace / 1024)
        sizeMB = Double(sizeMB / 1024)
        print(String(format: "%.2f", sizeMB) + " MB")
  
        // reserve some disc space
        let maxSpace = (sizeMB / 10) * 9
        
        // calculate time cycle for clipsize
        let clipSize = maxSpace / 3
        
        var clipTime = clipSize / 2.2 // safe estimate... 1 second = 2MB
       
        
        // check that there is enough space for recording anything
        if clipTime < 60 {
            // TODO:
            print("Prompt user to free more disc space")
          
        }
      
        variables.maxButtonValue = clipTime
        print(String(format: "%.2f", clipSize) + " clipSize in MB")
        print("seconds: \(clipTime)")
        return clipTime
    }
    
    func getFreeSize() -> Int64? {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        if let dictionary = try? FileManager.default.attributesOfFileSystem(forPath: paths.last!) {
            if let freeSize = dictionary[FileAttributeKey.systemFreeSize] as? NSNumber {
                return freeSize.int64Value
            }
            
            
        }else{
            print("Error Obtaining System Memory Info:")
        }
        return nil
    }
    
    func getTotalSize() -> Int64?{
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        if let dictionary = try? FileManager.default.attributesOfFileSystem(forPath: paths.last!) {
            if let freeSize = dictionary[FileAttributeKey.systemSize] as? NSNumber {
                return freeSize.int64Value
            }
        }else{
            print("Error Obtaining System Memory Info:")
        }
        return nil
    }
    
    func setSound() {
        let audioSession  = AVAudioSession.sharedInstance()
        if audioSession.isOtherAudioPlaying {
            _ = try? audioSession.setCategory(AVAudioSession.Category(rawValue: convertFromAVAudioSessionCategory(AVAudioSession.Category.playAndRecord)), mode: AVAudioSession.Mode.default)
        }
    }
    
    func checkLanguage() -> String {
        
        var language = Locale.preferredLanguages[0].prefix(2)
        
        if language == "zh" {
            if Locale.preferredLanguages[0].hasPrefix("zh-Hans")  {
                language = "zh"
            }
            else  {
                language = "zt"
            }
        }
        
        return String(language)
    }
    
}


// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromAVAudioSessionCategory(_ input: AVAudioSession.Category) -> String {
	return input.rawValue
}
