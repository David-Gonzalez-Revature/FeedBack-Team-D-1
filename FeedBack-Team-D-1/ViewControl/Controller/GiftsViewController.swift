//
//  GiftsViewController.swift
//  FeedBack-Team-D-1
//
//  Created by David Gonzalez on 3/5/22.
//

import UIKit

class GiftsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - IB
    @IBOutlet weak var goodR: UILabel!
    @IBOutlet weak var badR: UILabel!
    @IBOutlet weak var qrImage: UIImageView!
    @IBOutlet weak var giftSelect: UILabel!
    @IBOutlet weak var endMesagge: UILabel!
    @IBOutlet weak var selectButton: UIButton!
    
    
    var gifts    = ["Hotel", "Food", "Amazone","Gas"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    // MARK: - rows values
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let giftsCell = tableView.dequeueReusableCell(withIdentifier: "giftsCell") as! GiftUITableViewController
        getDataUserScore()
        print("1.- --------------------- Rows  Values  ",indexPath.section)
        switch indexPath.section {
        case 0: // General section 1
            giftsCell.descGift.text = gifts[indexPath.row]
            giftsCell.gitImg.image =  UIImage(named: gifts[indexPath.row])
            return giftsCell
        default:
            return giftsCell
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gifts.count
    }
    
    func getDataUserScore() {
        let data = CoreDataManage.inst.getDataUserScore() //.getData()
        var good = 0
        var bad  = 0
        let  numRatingTotal  = CoreDataManage.inst.getDataUserScore().count
        for d in data{
            if d.score == 100{
               // var numRating = CoreDataManage.inst.getDataUserScore().count
                good += 1
            }else{
             //   var numRating = CoreDataManage.inst.getDataUserScore().count
                bad += 1
            }
           // print("Email is ","davisgon@gmail.com","Score ", d.score, "DateCreated USER SCORE ",d.dateCreated)
        }
        print(numRatingTotal, "Total Bad:",bad," Total Good: ",good)
        goodR.text = String(good)
        badR.text = String(bad)
        
    }
    
    
    // MARK: - SELECTED CELL & RANDOM
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        giftSelect.isHidden = false
        qrImage.isHidden = false
        selectButton.isEnabled = true
        let random = randomString(length: 8)
        giftSelect.text = "Your coupon:   " + gifts[indexPath.row]+"-"+random
        //  print("Gift Selected*  11111" ,indexPath.row ,gifts[indexPath.row] )
    }
    
    // Generating Random String
    func randomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }
    
    
    @IBAction func itemSelected(_ sender: Any) {
        endMesagge.isHidden = false
    }
    
}
