//
//  GiftsViewController.swift
//  FeedBack-Team-D-1
//
//  Created by David Gonzalez on 3/5/22.
//

import UIKit

class GiftsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var goodR: UILabel!
    
    @IBOutlet weak var badR: UILabel!
    var gifts    = ["hotel", "food", "amazone"]
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let giftsCell = tableView.dequeueReusableCell(withIdentifier: "giftsCell") as! GiftUITableViewController
        
        // MARK: - rows values
        // ******************************** Rows  Values             ********************************
        
        print("acaaaaaaa")
        getDataUserScore()
        print(indexPath.section )
        switch indexPath.section {

        case 0: // General section 1
            
            giftsCell.descGift.text = gifts[indexPath.row]
            giftsCell.gitImg
            giftsCell.gitImg.image =  UIImage(named: gifts[indexPath.row])
//            cell1.item1.text = gifts[indexPath.row]
//            cell1.item2.image = UIImage(named: imgData[indexPath.row])
            return giftsCell

        default:
            return giftsCell
        }
      
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
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
            print("Email is ","davisgon@gmail.com","Score ", d.score, "DateCreated USER SCORE ",d.dateCreated)
        }
        print(numRatingTotal, "Total Bad:",bad," Total Good: ",good)
        goodR.text = String(good)
        badR.text = String(bad)
        
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Navigation
    

}
