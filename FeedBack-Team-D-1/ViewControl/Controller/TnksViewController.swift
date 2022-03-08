//
//  TnksViewController.swift
//  FeedBack-Team-D-1
//
//  Created by Team -D on 2/28/22.
//

import UIKit
import AVFoundation
import Speech

class TnksViewController: UIViewController {
    // MARK: - VARS
    var audioPlayer: AVAudioPlayer!
 //   var audioPlayer : AVAudioPlayer!
    var soundNameSad = "sad"
    var soundNameHappy = "happy"
    var emailG = "davisgon@gmail.com"
    
    let audioEng = AVAudioEngine()
    let req = SFSpeechAudioBufferRecognitionRequest()
    let speechR = SFSpeechRecognizer()
    var rTask : SFSpeechRecognitionTask!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startSpeechRec()

        // Do any additional setup after loading the view.
    }
    // MARK: - IBOUTLET
    @IBOutlet weak var sadImage: UIImageView!
    @IBOutlet weak var happyImage: UIImageView!
    @IBOutlet weak var giftsButton: UIButton!
    @IBOutlet weak var label: UILabel!
    
    // Buttons
    @IBOutlet weak var S1NoSelectedButton: UIButton! // BAD
    @IBOutlet weak var S1SelectedButton: UIButton!
    @IBOutlet weak var S5NoSelected: UIButton! // GOOD
    @IBOutlet weak var S5Selected: UIButton!
    
      
    // MARK: - IBACTION
    @IBAction func S5_Happy(_ sender: Any) {
        sadImage.isHidden = true
        happyImage.isHidden = false
        S5NoSelected.isHidden = true
        S5Selected.isHidden = false
        S1NoSelectedButton.isHidden = false
        S1SelectedButton.isHidden = true
        giftsButton.isEnabled = true
        PlayAudio( sound: soundNameHappy)
        addDataUserScore(p : 100)
        getDataUserScore()
        getOneDataUserScore( p : emailG)
        cancellSpeechRec()
    }
    
    @IBAction func S5Selected(_ sender: Any) {
        sadImage.isHidden = false
        happyImage.isHidden = false
        S5NoSelected.isHidden = false
        S5Selected.isHidden = true
        giftsButton.isEnabled = false
        
    }

    @IBAction func S1_Button(_ sender: Any) {
        print("No Selected button 1")
        sadImage.isHidden = false
        happyImage.isHidden = true
        S1NoSelectedButton.isHidden = true
        S1SelectedButton.isHidden = false
        PlayAudio( sound: soundNameSad)
        S5NoSelected.isHidden = false
        S5Selected.isHidden = true
        addDataUserScore(p : 60)
        getDataUserScore()
        giftsButton.isEnabled = true
        getOneDataUserScore( p : emailG)
       
        
    }
    @IBAction func S1Selected(_ sender: Any) {
        print("Selected button 1")
        sadImage.isHidden = false
        happyImage.isHidden = false
        S1NoSelectedButton.isHidden = false
        S1SelectedButton.isHidden = true
        giftsButton.isEnabled = false
    }
    
    
    @IBAction func recuperaData(_ sender: Any) {
       // getOneDataUser()
       // addDataUserScore()
        //getOneDataUserScore()
        getDataUserScore()
    }
    
    
    
    // ******************************     FUNC
    // MARK: FUNCTIOS
    // MARK: SPEECH
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
//            switch str{
//            case "blue":
//                self.view.backgroundColor = .blue
//            case "yellow":
//                self.view.backgroundColor = .yellow
//            default :
//                self.view.backgroundColor = .none
//            }
            
            
        
        })
        
        
        print("start")
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
    
    // MARK: PLAY AUDIO
    func PlayAudio( sound: String){
        let soundURL = Bundle.main.url(forResource: sound, withExtension: "mp3")
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
            audioPlayer.play()
        }
        catch {
            print("Error locating sound file: \(error)")
        }
        
    }
    
    // MARK: - CORE DATA USER-SCORE
  //  var userEmail_Home = ""
    func getOneDataUser() {
        let pMail = "userEmailText.text!"
        let d =  CoreDataManage.inst.getOneDataUser(n: "davisgon@gmail.com")
      
        print("GetOneDataUser from USER ", d.email," Pass ", d.password, "Date Created ", d.dateCreated)
        
    }
    
 
    func addDataUserScore(p : Int32){
        let date = Date()
        CoreDataManage.inst.addDataUserUserScore(emailP: "davisgon@gmail.com", scoreP: Int(p), dateCreated: date  )
        print("Data Saved into USER-SCORE Entity")
    }
    
    func getOneDataUserScore(p : String) {
        let ds =  CoreDataManage.inst.getOneDataUserScore(n: p)
      
        print("GetOneDataUser from USER-STORE ",
              ds.email,
              " SCORE ",
              ds.score, "Date Created ", ds.dateCreated)
        
    }
    
    func getDataUserScore() {
        var data = CoreDataManage.inst.getDataUserScore() //.getData()
        var good = 0
        var bad  = 0
        var  numRatingTotal  = CoreDataManage.inst.getDataUserScore().count
        for d in data{
            if d.score == 100{
                var numRating = CoreDataManage.inst.getDataUserScore().count
                good += 1
            }else{
                var numRating = CoreDataManage.inst.getDataUserScore().count
                bad += 1
            }
            print("Email is ",d.email,"Score ", d.score, "DateCreated USER SCORE ",d.dateCreated)
        }
        print(numRatingTotal, "Total Bad:",bad," Total Good: ",good)
        
        
    }

}
