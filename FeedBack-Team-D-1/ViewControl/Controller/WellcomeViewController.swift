//
//  HomeViewController.swift
//  FeedBack-Team-D-1
//
//  Created by David Gonzalez on 2/25/22.
//

import UIKit

class WellcomeViewController: UIViewController {
    @IBOutlet weak var userEmail: UILabel!
    var surveyChecked = true
    var thanksChecked = false
    
    
   // @IBOutlet weak var goToServiceButton22: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        if text != nil {
            userEmail.text = text
        }
        
        
        print("Welcome my Friend::",userEmail_Home)
        userEmail.text = userEmail_Home;
    //    setupUI()
        ViewData()
        // Do any additional setup after loading the view.
    }
    
    var userEmail_Home = ""
    var text : String?
    
    @IBOutlet weak var goToServiceButton: UIButton!
    // MARK: - FUNCTIONS
    private func setupUI() {
        goToServiceButton.layer.cornerRadius = 20
    }
   
    func ViewData() {
         // Set query
         let q : [String : Any] = [ kSecClass  as String : kSecClassGenericPassword,
                                    kSecAttrAccount as String : userEmail_Home ,
                                    kSecReturnAttributes as String: true,
                                    kSecReturnData as String : true]
         
         var res : CFTypeRef?
         
         if SecItemCopyMatching(q as CFDictionary, &res) == noErr{
             
             if let item = res as? [String: Any],
                let uid = item[kSecAttrAccount as String] as? String,
                let password = item [ kSecValueData  as String] as? Data,
                let pass = String(data: password, encoding: .utf8){
                 
                 print("1.-id is :", uid, " Passs is:", pass)
             }
             else{
                 print("no data Found")
             }
         }
         
         print("View Data")
     }
    
    //added navigation to new view controller function
    @IBAction func services(_ sender: Any) {
        surveyChecked = true
        thanksChecked = false
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let destinationViewController = mainStoryBoard.instantiateViewController(withIdentifier: "surveyTab") as? SurveyTabViewController else {
            print("Couldn't find view controller")
            return
        }
        
        present(destinationViewController, animated: true, completion: nil)
        print(surveyChecked)
        print(thanksChecked)
    }
    
    @IBAction func thanks(_ sender: Any) {
        surveyChecked = false
        thanksChecked = true
        print(surveyChecked)
        print(thanksChecked)
    }
    // MARK: - Prepare Send Data
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let svc = segue.destination as!  GiftsViewController
     
        
     //   svc.userEmail_Home = userEmail.text!
   // }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        print(thanksChecked)
//        print(surveyChecked)
//        if(thanksChecked == true && surveyChecked == false){
//
       // }
        let svc = segue.destination as!  TnksViewController
         svc.userEmail_Home = userEmail_Home
        
    }
   

}
