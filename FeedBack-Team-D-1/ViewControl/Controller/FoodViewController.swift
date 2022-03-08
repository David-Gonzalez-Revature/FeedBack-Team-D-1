//
//  FoodViewController.swift
//  FeedBack-Team-D-1
//
//  Created by Stephanie Marin Velasquez on 3/8/22.
//

import UIKit

class FoodViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    var foodQ = ["how was food", "food tasty","question 3", "question 4", "question 5"]
    
    var imageData = ["Excellent", "Medium", "Poor"]
    var answer = [ "Excellent", "Medium", "Poor"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answer.count
    }
    
    //MARK: - Survey TableView
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cellQ1 = tableView.dequeueReusableCell(withIdentifier: "cellQ1") as! SurveyTableViewCell
        var cellQ2 = tableView.dequeueReusableCell(withIdentifier: "cellQ2") as! SurveyTableViewCell
        var cellQ3 = tableView.dequeueReusableCell(withIdentifier: "cellQ3") as! SurveyTableViewCell
        
        
        //setion to display the 3 cells with happy medium and sad images to pick
        
        switch indexPath.section{
        case 0:
            switch indexPath.item {

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
        case 1:
            switch indexPath.item {

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
        case 2:
            switch indexPath.item {

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
        case 3:
            switch indexPath.item {

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
        case 4:
            switch indexPath.item {

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
            default:
                return cellQ1
            }
    }
    // ------- end of Answers rows -----
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
       return 5
    }
    
    // MARK - cell heather titles for room questions
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section{
        case 0:
            return foodQ[section]
        case 1:
            return foodQ[section]
        case 2:
            return foodQ[section]
        case 3:
            return foodQ[section]
        case 4:
            return foodQ[section]
        default:
            return ""
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section{
        case 0:
            switch indexPath.item {
            case 0 :
                print("Room Q1. Excellent")
            case 1:
                print("Room Q1. Medium")
            case 2:
                print("Room Q1. Sad")
            default:
                print("wrong choice")
            }
            
        case 1:
            switch indexPath.item {
            case 0 :
                print("Room Q2. Excellent")
            case 1:
                print("Room Q2. Medium")
            case 2:
                print("Room Q2. Sad")
            default:
                print("wrong choice")
            }
        case 2:
            switch indexPath.item {
            case 0 :
                print("Room Q3. Excellent")
            case 1:
                print("Room Q3. Medium")
            case 2:
                print("Room Q3. Sad")
            default:
                print("wrong choice")
            }
        case 3:
            switch indexPath.item {
            case 0 :
                print("Room Q4. Excellent")
            case 1:
                print("Room Q4. Medium")
            case 2:
                print("Room Q4. Sad")
            default:
                print("wrong choice")
            }
        case 4:
            switch indexPath.item {
            case 0 :
                print("Room Q5. Excellent")
            case 1:
                print("Room Q5. Medium")
            case 2:
                print("Room Q5. Sad")
            default:
                print("wrong choice")
            }
        default :
            print("")
        }
        
    }

        // end of view controller
    
}
