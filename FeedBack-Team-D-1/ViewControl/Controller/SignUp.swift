//
//  ViewController.swift
//  FeedBack-Team-D-1
//
//  Created by Team-D 2/25/22.
//
import UIKit

extension String {
    private static let __firstpart = "[A-Z0-9a-z]([A-Z0-9a-z._%+-]{0,30}[A-Z0-9a-z])?"
    private static let __serverpart = "([A-Z0-9a-z]([A-Z0-9a-z-]{0,30}[A-Z0-9a-z])?\\.){1,5}"
    private static let __emailRegex = __firstpart + "@" + __serverpart + "[A-Za-z]{2,6}"
    
    public var isEmail: Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", type(of:self).__emailRegex)
        return predicate.evaluate(with: self)
    }
}

// MARK: HideShowPasswordTextFieldDelegate
var iconClick = false
let imageIcon = UIImageView()

class SignUp: UIViewController {
    
    
    // MARK: - Outlets
    @IBOutlet weak var userEmailText: UITextField!
    @IBOutlet weak var error: UILabel!
    @IBOutlet weak var userPasswordText: UITextField!
    @IBOutlet weak var hidePas: UIButton!
    @IBOutlet weak var showP: UIButton!
    @IBOutlet weak var rememberMeBox: UIButton!
    @IBOutlet weak var showRememberMeBox: UIButton!
    
    
    // MARK: - IBActions
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    //    ShowPassword()
        userPasswordText.isSecureTextEntry = true
    }
    
    private func performLogin() {
        if userEmailText.text!.isEmail {
            print("\(String(describing: userEmailText.text!)) is a valid e-mail address")
        //    userEmailText.backgroundColor = .white
            SaveData()
            ViewData()
            error.backgroundColor = .gray
            error.text = "welcomePage"
        } else {
            print("\(userEmailText.text!) is not a valid e-mail address")
           // userEmailText.backgroundColor = .red
            error.backgroundColor = .red
            error.text = "is not a valid e-mail address"
            
            userEmailText.tintColor = .white
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String?, sender: Any?) -> Bool {
        
        if (userEmailText.text!.isEmail && checkReusedUsername() == false) {
            return true
        }
        return false
    }
    
    
    func  isValidEmail( userEmailText : String) -> Bool {
        NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: self)
    }
    
    let data = DBAuthorizationHelper.inst.getData()
    func checkReusedUsername()->Bool{
        for d in data{
            if(userEmailText.text! == d.username!){
                print(userEmailText.text!)
                return true
            }
        }
        return false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(rememberMeBox.isHidden == true){
            let svc = segue.destination as!  StartViewController
            svc.email = userEmailText.text!
            svc.password = userPasswordText.text!
        }
    }
    
    @IBAction func submit(_ sender: Any) {
        //check conditional statements for proper navigation
        if(checkReusedUsername()==false && userEmailText.text?.isEmpty != nil && userEmailText.text?.isEmail == true){
            if(rememberMeBox.isHidden == true){
                SaveData()
                //ViewData()
            }
            DBAuthorizationHelper.inst.addDAta(n: userEmailText.text!, m: userPasswordText.text!)
            print("password saved")
            let newData = DBAuthorizationHelper.inst.getData()
            for d in newData{
                if(userEmailText.text! == d.username!){
                    print(userEmailText.text!)
                }
            }
        }else{
            if(checkReusedUsername() == true){
                error.text = "Username already exists."
            } else if(userEmailText.text?.isEmpty != nil){
                error.text = "Please enter a username."
            } else if(userEmailText.text?.isEmail == false){
                error.text = "Please enter a valid username." //need to check why this condition doesn't evaluate
            } else if(userPasswordText.text?.isEmpty != nil){
                error.text = "Please enter a password."
            } else if(userPasswordText.text?.isEmpty != nil && userEmailText.text?.isEmpty != nil){
                error.text = "Please enter a username and password."
            }
        }
        
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
    @IBAction func showRMB(_ sender: Any) {
        print("false")
        showRememberMeBox.isHidden = true
        rememberMeBox.isHidden = false
    }
    
    @IBAction func hideRMB(_ sender: Any) {
        print("true")
        showRememberMeBox.isHidden = false
        rememberMeBox.isHidden = true
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
    private func setupUI() {
        submitButton.layer.cornerRadius = 20
        showRememberMeBox.isHidden = true
        rememberMeBox.isHidden = false
    }
    
    // MARK: - KeyChain
    // KeyChain
    func SaveData() {
        // **********   set Attributres
        let att : [String : Any] =
        [ kSecClass as String : kSecClassGenericPassword,
          kSecAttrAccount as String : userEmailText.text,
          kSecValueData as String : userPasswordText.text!.data(using: .utf8)!]
        
        // **********   add Data
        if SecItemAdd(att as CFDictionary,nil ) == noErr{
            print("Data Saved successfully KeyChain")
        }else{
            print("Data not saved KeyChain")
        }
        // ViewData()
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
    
    // MARK: - Prepare Send Data
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let svc = segue.destination as!  StartViewController
        print("******:Id is :", userEmailText.text!, " Passs is:" )
        
        svc.userEmail_Home = userEmailText.text!
    }
    */
    // MARK: - STUP SUBMIT BUTTON
    /*
    @IBAction func submitButton2(_ sender: Any) {
        performLogin()
        addDataUser()
        getOneDataUser()
        
    }
    */
    
//    func sendEmail() {
//        if MFMailComposeViewController.canSendMail() {
//            let mail = MFMailComposeViewController()
//            mail.mailComposeDelegate = self
//            mail.setToRecipients(["davisgon@gmail.com"])
//            mail.setMessageBody("<p>You're so awesome!</p>", isHTML: true)
//
//            present(mail, animated: true)
//        } else {
//            // show failure alert
//        }
//    }
//
//    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
//        controller.dismiss(animated: true)
//    }
    
}

