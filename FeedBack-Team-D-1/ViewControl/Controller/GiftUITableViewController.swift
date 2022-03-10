//
//  GiftUITableViewController.swift
//  FeedBack-Team-D-1
//
//  Created by David Gonzalez on 3/5/22.
//

import UIKit

class GiftUITableViewController: UITableViewCell {

    
    @IBOutlet weak var gitImg: UIImageView!
    @IBOutlet weak var descGift: UILabel!
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
       // print("GiftUITableViewController      aca:   awakeFromNib")
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
//        if selected{
//            print("1 GiftUITableViewController  setSelected",selected.self.description)
//        }else{
//            print("Not Selected",selected)
//        }
        
       
        // Configure the view for the selected state
    }
    
  
    
    
}

