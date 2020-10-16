//
//  Page1ViewController.swift
//  News
//
//  Created by 高杉恒寛 on 2020/09/07.
//  Copyright © 2020 tsunehiro takasugi. All rights reserved.
//

import UIKit
import SegementSlide

class BaseViewController: SegementSlideDefaultViewController{
    
    
 
    override func viewDidLoad() {
          super.viewDidLoad()
          // Do any additional setup after loading the view.
          defaultSelectedIndex = 0
                reloadData()
      
      }
    
    
    
    
    override func segementSlideHeaderView() -> UIView? {
           let headerView = UIImageView()
        headerView.isUserInteractionEnabled = true
        headerView.contentMode = .scaleAspectFill
        headerView.image = UIImage(named:"simple")
           headerView.heightAnchor.constraint(equalToConstant: view.bounds.height/6).isActive = true
           return headerView
       }

       override var titlesInSwitcher: [String] {
           return ["主要", "経済", "IT", "エンタメ", "ライフ", "スポーツ"]
       }

       override func segementSlideContentViewController(at index: Int) -> SegementSlideContentScrollViewDelegate? {
        
        switch index {
        case 0: return Page1ViewController()
            
            
            case 1:
                 return Page2ViewController()
            case 2:
                 return Page3ViewController()
            case 3:
                return Page4ViewController()
            case 4:
                return Page5ViewController()
            case 5:
                return Page6ViewController()
                
       
            
            
        default:
             return Page1ViewController()
        }
        
        
          
       }

  


}

