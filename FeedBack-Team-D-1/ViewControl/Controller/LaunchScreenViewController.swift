//
//  LaunchScreenViewController.swift
//  FeedBack-Team-D-1
//
//  Created by John Figueroa on 3/3/22.
//

import UIKit

class LaunchScreenViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    
    func animateRotation(){
        UIView.animate(withDuration: 2.75, animations: {
            self.image.transform = CGAffineTransform(rotationAngle:  .pi)
        })
        UIView.animate(withDuration: 3.0, animations: {
            self.image.transform = CGAffineTransform(rotationAngle:  2 * .pi)
        })
    }
    func startAnimate(){
        print("function was called")
        
        var timer = Timer.scheduledTimer(timeInterval: 2.75, target: self, selector: #selector(updateImage), userInfo: nil, repeats: true) // target where it shoudl find selector self means current one
    }
    
    @objc func updateImage(){//argument of #selector refers to instance method updateImage() that is not exposed to o-c; add @objc to expose instance method to o-c
        
        var count = 5
        repeat{
            
            animateRotation()
            count -= 1
        } while(count > 0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startAnimate()
        // Do any additional setup after loading the view.
    }

}
