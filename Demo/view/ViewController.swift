//
//  ViewController.swift
//  Demo
//
//  Created by 田　甜 on 2017/12/08.
//  Copyright © 2017年 田　甜. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func startAnimation(_ sender: Any) {
//        let width = resultLabel.frame.width
//        let height = resultLabel.frame.height
//        let center = resultLabel.center
        
//        resultLabel.font = UIFont.boldSystemFont(ofSize: 15)
        resultLabel.transform = resultLabel.transform.scaledBy(x: 1.0, y: 1.0)
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 2.0, initialSpringVelocity: 0.5, options: UIViewAnimationOptions.curveEaseIn, animations: {
//            self.resultLabel.font = UIFont.systemFont(ofSize: 23.0)
//            self.resultLabel.frame = CGRect(x: center.x - width * 0.9/2,
//                                            y: center.y - height * 0.9/2,
//                                            width: width * 0.9,
//                                            height: height * 0.9)
            self.resultLabel.transform = self.resultLabel.transform.scaledBy(x: 1.25, y: 1.25)//CGAffineTransformScale(resultLabel.transform, 5, 5);
        }, completion: { result in
            UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 5.0, options: UIViewAnimationOptions.curveEaseIn, animations: {
//                self.resultLabel.font = UIFont.boldSystemFont(ofSize: 15)
//                self.resultLabel.frame = CGRect(x: center.x - width/2,
//                                                y: center.y - height/2,
//                                                width: width,
//                                                height: height)
                self.resultLabel.transform = self.resultLabel.transform.scaledBy(x: 0.8, y: 0.8)
            }, completion: nil)
        })
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

