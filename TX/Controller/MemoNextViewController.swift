//
//  MemoNextViewController.swift
//  TX
//
//  Created by 高杉恒寛 on 2020/10/10.
//

import UIKit

class MemoNextViewController: UIViewController {
    
    var memoString = String()

    @IBOutlet weak var memoLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        memoLabel.text = memoString
        
        

     
    }
    

    @IBAction func share(_ sender: Any) {
        let text = memoLabel.text
        let item = [text as Any]
        let activityVC = UIActivityViewController(activityItems: item, applicationActivities: nil)
        self.present(activityVC, animated: true, completion: nil)
        
    }
    

}
