//
//  LoginMovieViewController.swift
//  TX
//
//  Created by 高杉恒寛 on 2020/10/01.
//

import UIKit
import AVFoundation
import NVActivityIndicatorView

class LoginMovieViewController: UIViewController,UINavigationControllerDelegate {
    
    private var activityIndicatorView: NVActivityIndicatorView!

    
    var player = AVPlayer()
    @IBOutlet weak var loginlabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicatorView = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 200, height: 200), type: NVActivityIndicatorType.lineScalePulseOutRapid, color: UIColor.red, padding: 0)
               activityIndicatorView.center = self.view.center // 位置を中心に設定
               view.addSubview(activityIndicatorView)
        
        
        
        loginlabel.layer.cornerRadius = 20.0
        
        let path = Bundle.main.path(forResource: "covid-19", ofType: "mov")
        player = AVPlayer(url: URL(fileURLWithPath: path!))
        
        //avplayer用のレイヤーを生成
        
        let playerlayer = AVPlayerLayer(player: player)
        playerlayer.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        playerlayer.videoGravity = .resizeAspectFill
        playerlayer.repeatCount = 0
        playerlayer.zPosition = -1
        view.layer.insertSublayer(playerlayer, at: 0)
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player.currentItem, queue: .main) { (_) in
            self.player.seek(to: .zero)
            self.player.play()
        }

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
        self.player.play()
    }
    
    
    @IBAction func login(_ sender: Any) {
        player.pause()
        start()
    }
    
    
    private func start() {
          activityIndicatorView.startAnimating()
      }
    
    


}
