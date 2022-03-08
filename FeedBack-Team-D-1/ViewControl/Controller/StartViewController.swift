//
//  StartViewController.swift
//  FeedBack-Team-D-1
//
//  Created by David Gonzalez on 2/28/22.
//

import UIKit

class StartViewController: UIViewController {
    @IBOutlet weak var hidePas: UIButton!
    @IBOutlet weak var showP: UIButton!
    @IBOutlet weak var userEmailText: UITextField!
    @IBOutlet weak var userPasswordText: UITextField!
    var email = ""
    var password = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        //setupUI()
        // Do any additional setup after loading the view.
        //userEmailText.text = email
        //userPasswordText.text = password
    }
    override func shouldPerformSegue(withIdentifier identifier: String?, sender: Any?) -> Bool {
        
        if (checkValidAccount() == true) {
            return true
        }
        return false
    }
    
    let data = DBAuthorizationHelper.inst.getData()
    func checkValidAccount()->Bool{
        
        for d in data{
            print(d.username, ",", d.password)
            if(email == d.username! && password == d.password){
                print("true")
                return true
            }
        }
        print("false")
        return false
    }
    @IBAction func showPass(_ sender: Any) {
       
        print("Change passs")
        userPasswordText.isSecureTextEntry = false
        hidePas.isHidden = false
        showP.isHidden = true
    }
    
    @IBAction func hidePass(_ sender: Any) {
        print("Hide Change passs")
        userPasswordText.isSecureTextEntry = true
        hidePas.isHidden = true
        showP.isHidden = false
    
    }
    
    func ShowPassword() {
        // ***************************** Passs *******************************
        imageIcon.image = UIImage(named: "closeeye")
        let contentView = UIView()
        contentView.addSubview(imageIcon)
        
        contentView.frame = CGRect(x: 0, y: 0, width: UIImage(named: "closeeye")!.size.width, height: UIImage(named: "closeeye")!.size.height)
        
        imageIcon.frame = CGRect(x: -10, y: 0, width: UIImage(named: "closeeye")!.size.width, height: UIImage(named: "closeeye")!.size.height)
        
        userPasswordText.rightView = contentView
        userPasswordText.rightViewMode = .always
        //
        //        let tapGestureReconizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(TapGestureRecognizer)))
        //
        imageIcon.isUserInteractionEnabled = true
        //        imageIcon.addGestureRecognizer(tapGestureReconizer)
        //
        //        func imageTapped(TapGestureRecognizer:UITapGestureRecognizer){
        //            let tappedImage = tapGestureReconizer.view as! UIImageView
        //
        //            if iconClick{
        //                iconClick=false
        //                tappedImage.image = UIImage(named: "openeye")
        //                userPasswordText.isSecureTextEntry = false
        //            }else {
        //                iconClick=true
        //                tappedImage.image = UIImage(named: "closeeye")
        //                userPasswordText.isSecureTextEntry = true
        //            }
        //        }
    }
    
    @IBAction func login(_ sender: Any) {
        checkValidAccount()
    }
    func ViewData() {
        // Set query
        let q : [String : Any] = [ kSecClass  as String : kSecClassGenericPassword,
                                   kSecAttrAccount as String : userEmailText.text,
                                   kSecReturnAttributes as String: true,
                                   kSecReturnData as String : true]
        
        var res : CFTypeRef?
        
        if SecItemCopyMatching(q as CFDictionary, &res) == noErr{
            
            if let item = res as? [String: Any],
               let uid = item[kSecAttrAccount as String] as? String,
               let password = item [ kSecValueData  as String] as? Data,
               let pass = String(data: password, encoding: .utf8){
                print("******:Id is :", uid, " Passs is:" , pass)
            }
            else{
                print("no data Found")
            }
        }
        print("View Data")
    }

}
