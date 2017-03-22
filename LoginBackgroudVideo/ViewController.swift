//
//  ViewController.swift
//  LoginBackgroudVideo
//
//  Created by Nguyen Van Nhuong on 17/03/2017.
//  Copyright © 2017 admin. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class ViewController: UIViewController {
    var player:AVPlayer!
    var playerLayer:AVPlayerLayer!
    var user = ["nhuong" : "123","nguyennhuong" : "12345"]
    
    
    @IBOutlet weak var lblUser: UITextField!
   
    @IBOutlet weak var lblPass: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playVideo()
        player.play()
    }
   
        
    func playVideo() {
        let ulr = Bundle.main.url(forResource: "LẠC TRÔI - OFFICIAL MUSIC VIDEO - SƠN TÙNG M-TP", withExtension: "mp4")
        player = AVPlayer(url: ulr!)
        playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view.layer.frame
        playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        player.actionAtItemEnd = .none
        self.view.backgroundColor = UIColor.clear
       // player.volume = 0
        self.view.layer.insertSublayer(playerLayer, at: 0)
        NotificationCenter.default.addObserver(self, selector: #selector(loopvideo(noifiticaton:)), name: Notification.Name.AVPlayerItemDidPlayToEndTime , object: player.currentItem )
        
    }
    func loopvideo( noifiticaton : Notification) {
        player.seek(to: kCMTimeZero)
    }
    
    
    @IBAction func btnLogin(_ sender: UIButton) {
       
       
        if let pass = user[lblUser.text!]{
            if pass == lblPass.text {
               alert(mess: "dang nhap thanh cong")
            }else{
                alert(mess: "Pass khong dung")
            }
            
        }else{
            alert(mess: "KHONG TON TAI TAI KHOAN")
        }
        
    }
    
    @IBAction func btnRegister(_ sender: UIButton) {
        if user[lblUser.text!] != nil{
            alert(mess: "Tai khoan da ton tai")

        }else{
            
            user[lblUser.text!] = lblPass.text
            alert(mess: "dang ki thanh cong")
            for u in user {
                print("tai khoan : \(u.0)")
                print(u.1)
            }
        }
    }
    
    
    @IBAction func btnChange(_ sender: UIButton) {
        if user[lblUser.text!] != nil{
            user.updateValue(lblPass.text!, forKey: user[lblUser.text!]!)
            alert(mess: "change pass thanh cong")
        }else{
            alert(mess: "changer erro ")
        }
    }
    
    
    @IBAction func btnDelete(_ sender: UIButton) {
        if let pass = user[lblUser.text!]{
            if pass == lblPass.text {
                user.removeValue(forKey: lblUser.text!)
                alert(mess: "delete  thanh cong")
                for u in user {
                    print("tai khoan : \(u.0)")
                    print(u.1)
                }
            }else{
                alert(mess: "Pass khong dung! delete k thanh cong")
            }
            
        }else{
            alert(mess: "KHONG TON TAI TAI KHOAN")
        }

    }
    
    func alert(mess:String) {
        let alert:UIAlertController = UIAlertController(title: "Thong Bao", message: mess, preferredStyle: .alert)
        let ok:UIAlertAction = UIAlertAction(title: "OK", style: .default
            , handler: nil)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
        
    }
    
}

