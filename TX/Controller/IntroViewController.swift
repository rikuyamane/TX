//
//  IntroViewController.swift
//  TX
//
//  Created by 高杉恒寛 on 2020/09/30.
//

import UIKit
import Lottie

class IntroViewController: UIViewController,UIScrollViewDelegate {
    
    
    var onboardArrray = ["0","1","2","3","4"]
    
    var onboardSrtingArray = ["コロナ自粛お疲れ様です","コロナに負けず","今日も一日頑張りましょう","いつかきっと","世界は良くなっていくでしょう"]

    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.isPagingEnabled = true
        setUpScroll()

        for i in 0...4{
            let animationView = AnimationView()
            let animation = Animation.named(onboardArrray[i])
            animationView.frame = CGRect(x: CGFloat(i)*view.frame.size.width, y: 0, width: view.frame.size.width, height: view.frame.size.height)
            animationView.animation = animation
            animationView.contentMode = .scaleAspectFit
            animationView.loopMode = .loop
            animationView.play()
            scrollView.addSubview(animationView)
        }
       
    }
    
    
    
    func setUpScroll(){
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: view.frame.size.width*5, height: scrollView.frame.size.height)
        for i in 0...4{
            
            let onboardLabel = UILabel(frame: CGRect(x: CGFloat(i)*view.frame.size.width, y: view.frame.size.height/3, width: scrollView.frame.size.width, height: scrollView.frame.size.height))
            
            onboardLabel.font = UIFont.boldSystemFont(ofSize: 25.0)
            onboardLabel.textAlignment = .center
            onboardLabel.textColor = .red
            onboardLabel.text = onboardSrtingArray[i]
            scrollView.addSubview(onboardLabel)
        }
    }
    
    
 
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
        
        
        
    }
    
    @IBOutlet weak var scrollView: UIScrollView!
    


}
