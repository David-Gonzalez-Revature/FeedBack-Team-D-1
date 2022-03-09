//
//  SplashscreenAnimationViewController.swift
//  FeedBack-Team-D-1
//
//  Created by John Figueroa on 3/6/22.
//

import UIKit
import Speech

class SplashscreenAnimationViewController: UIViewController {
    
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
    
    
    // ******************************           VAR
    @IBOutlet weak var label: UILabel!
    var isStart = false
    let audioEng = AVAudioEngine()
    let speechR = SFSpeechRecognizer()
    let req = SFSpeechAudioBufferRecognitionRequest()
    var rTask : SFSpeechRecognitionTask!
    
  
    
    // ******************************     FUNC
    // MARK: FUNCTIOS
    
    func startSpeechRec(){
        let nd = audioEng.inputNode
        let recordF = nd.outputFormat(forBus: 0)
        nd.installTap(onBus: 0, bufferSize: 1024, format: recordF)
                      {
            (buffer , _ ) in self.req.append(buffer)
        }
        audioEng.prepare()
        do {
            try audioEng.start()
        }catch let err {
            printContent(err)
        }

        rTask  = speechR?.recognitionTask(with: req, resultHandler: {
            (resp, error) in

            guard let rsp = resp else{
                print(error.debugDescription)

                return
            }
            let msg = resp?.bestTranscription.formattedString
            self.label.text = msg!


            var str : String = ""
            for seg in  resp!.bestTranscription.segments{
                let indexTo = msg!.index(msg!.startIndex, offsetBy: seg.substringRange.location)
                str = String(msg![indexTo...])
            }
            // *** reconigzer
            switch str{
            case "blue":
                self.view.backgroundColor = .blue
            case "yellow":
                self.view.backgroundColor = .yellow
            case "next":
                self.navigateToController()
            case "Next":
                self.navigateToController()
            default :
                self.view.backgroundColor = .none
            }



        })


        print("start")
    }
    
    
    func navigateToController(){
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "startView") as! StartViewController
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    
    func cancellSpeechRec(){
        rTask.finish()
        rTask.cancel()
        rTask = nil
        req.endAudio()
        audioEng.stop()
        
        if audioEng.inputNode.numberOfInputs > 0 {
            audioEng.inputNode.removeTap(onBus: 0)
        }
        print("cancel")
    }

    // ********************************
    @IBAction func speechB(_ sender: UIButton) {
        
        isStart = !isStart
        if isStart {
//            startSpeechRec()
            sender.setTitle("stop", for: .normal)
        }else{
//            cancellSpeechRec()
            sender.setTitle("start", for: .normal)
        }
               
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startAnimate()
//        startSpeechRec()
        // Do any additional setup after loading the view.
    }
}
