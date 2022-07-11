//
//  Srott.swift
//  Com07
//
//  Created by cmStudent on 2022/07/03.
//

import UIKit
import AVFoundation

class Srott: NSObject {
    
    //Long音開始
    let longData = NSDataAsset(name: "srotlong")!.data
    
    var longPlayer: AVAudioPlayer!
    
    func longPlay() {
        do {
        
        longPlayer = try AVAudioPlayer(data: longData)
        
        longPlayer.play()
        } catch {
            print("スロットBGMで、エラーが発生しました！")
        }
    }
    
    func longStop() {
        do {
        
        longPlayer = try AVAudioPlayer(data: longData)
        
        longPlayer.stop()
        } catch {
            print("スロットBGMで、エラーが発生しました！")
        }
    }
    //Long音終了
    
    //Short音開始
    let shortData = NSDataAsset(name: "srotshort")!.data
    
    var shortPlayer: AVAudioPlayer!
    
    func shortPlay() {
        do {
        
        shortPlayer = try AVAudioPlayer(data: shortData)
        
        shortPlayer.play()
        } catch {
            print("スロットボタンで、エラーが発生しました！")
        }
    }
    
    func shortStop() {
        do {
        
        shortPlayer = try AVAudioPlayer(data: shortData)
        
        shortPlayer.stop()
        } catch {
            print("スロットボタンで、エラーが発生しました！")
        }
    }
    //Short音終了
}
