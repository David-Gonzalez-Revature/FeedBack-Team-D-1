//
//  SurveyViewController.swift
//  FeedBack-Team-D-1
//
//  Created by David Gonzalez on 2/28/22.
//

import UIKit

class SurveyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    //MARK Questions data
    var imageData = ["Excellent", "Medium", "Poor"]
    var answer = [ "Happy", "Medium", "Poor"]
    
    var roomQ = ["1. How was room cleaned","2. question 2", "3. Question 3", "4. Question", "5. question 5"]
    var gymQ = [" How was gym", " Gym clean", "question 3", "question 4", "question 5"]
    
    var foodQ = ["how was food", "food tasty","question 3", "question 4", "question 5"]
    

    
    //displaying section of question with full tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
        return imageData.count
   
    }
    //MARK: - Survey TableView
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cellQ1 = tableView.dequeueReusableCell(withIdentifier: "cellQ1") as! SurveyTableViewCell
        var cellQ2 = tableView.dequeueReusableCell(withIdentifier: "cellQ2") as! SurveyTableViewCell
        var cellQ3 = tableView.dequeueReusableCell(withIdentifier: "cellQ3") as! SurveyTableViewCell
        
        
        //setion to display the 3 cells with happy medium and sad images to pick
        switch indexPath.section{
        case 0:
            cellQ1.excellentlb.text = answer[indexPath.row]
            cellQ1.exImg.image = UIImage(named: imageData[indexPath.row])
            return cellQ1
        case 1:
            cellQ2.mediumlb.text = answer[indexPath.row]
            cellQ2.medImg.image = UIImage(named: imageData[indexPath.row])
            return cellQ2
        case 2:
            cellQ3.sadlb.text = answer[indexPath.row]
            cellQ3.sadImg.image = UIImage(named: imageData[indexPath.row])
            return cellQ3
        default:
            return cellQ1
            
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
       return 5
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    
    
    // MARK - cell heather titles
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section{
        case 0:
            return roomQ[section]
        case 1:
            return roomQ[section]
        case 3:
            return roomQ[section]
        case 4:
            return roomQ[section]
        case 5:
            return roomQ[section]
        default:
            return ""
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section{
        case 0:
            switch indexPath.item {
            case 0 :
                print("Room Q1. Happy")
            case 1:
                print("item2 selected")
            case 2:
                print("item3 selected")
            default:
                print("wrong choice")
            }
            
        case 1:
            switch indexPath.item {
            case 0 :
                print("A selected")
            case 1:
                print("B selected")
           
            default:
                print("wrong choice")
            }
        default :
            print("")
        }
        
    }

    
//    saImage.isHidden = false
//    HappyImage.isHidden = true
    
    
    
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 1
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        var colCell1 = collectionView.dequeueReusableCell(withReuseIdentifier: "colCell1", for: indexPath) as! SurveyCollectionViewCell
//
//        return colCell1
//    }
//
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
