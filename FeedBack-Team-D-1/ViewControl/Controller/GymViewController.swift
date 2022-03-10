//
//  GymViewController.swift
//  FeedBack-Team-D-1
//
//  Created by Stephanie Marin Velasquez on 3/8/22.
//

import UIKit

class GymViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var valueAnswers = [100,50,30]
    var room = 0
    var gymTotal = 0
    var addQ = 0
    var id = 2
    var servType = "Gym"
    var myVector = [0,0,0,0,0]
    
    var imageData = ["Excellent", "Medium", "Poor"]
    var answer = [ "Excellent", "Medium", "Poor"]
    
    var gymQ = ["1. How was gym", "2. Gym clean", "3. question ", "4 question ", "5. question "]
    
    
    //displaying section of question with full tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    
    
    // MARK - cell heather titles for room questions
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section{
        case 0:
            return gymQ[section]
        case 1:
            return gymQ[section]
        case 2:
            return gymQ[section]
        case 3:
            return gymQ[section]
        case 4:
            return gymQ[section]
        default:
            return ""
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section{
        case 0:
                if indexPath.item == 0{
                    if myVector[0] != 0{
                        myVector[0] = 0
                    }
                    else{
                        myVector[0] = valueAnswers[0]
                        print("Gym Q1. Excellent")
                        print(myVector[0])
                    }
                }
                else if indexPath.item == 1{
                    if myVector[0] != 0{
                        
                        myVector[0] = 0
                    }
                    else{
                        myVector[0] = valueAnswers[1]
                    print("Gym Q1. Medium")
                    print(myVector[0])
                    }
                }
                else {
                    if myVector[0] != 0{
                        
                        myVector[0] = 0
                    }
                    else{
                        myVector[0] = 0
                        myVector[0] = valueAnswers[2]
                    print("Gym Q1. Poor")
                    print(myVector[0])
                    }
                }
            gymTotal += myVector[0]
        print(gymTotal)
            
        case 1:
            if indexPath.item == 0{
                if myVector[1] != 0{
                    myVector[1] = 0
                }
                else{
                print("Gym Q2. Excellent")
                    myVector[1] += valueAnswers[0]
                    print(myVector[1])
                }
            }
            else if indexPath.item == 1{
                if myVector[1] != 0{
                    myVector[1] = 0
                }
                else{
                print("Gym Q2. Medium")
                    myVector[1] += valueAnswers[1]
                    print(myVector[1])
                }
            }
            else {
                if myVector[1] != 0{
                    myVector[1] = 0
                }
                else{
                print("Gym Q2. Poor")
                    myVector[1] = valueAnswers[2]
                    print(myVector[1])
                }
            }
            
            gymTotal += myVector[1]
            print(gymTotal)
                
        case 2:
        if indexPath.item == 0{
            if myVector[2] != 0{
                myVector[2] = 0
            }
            else{
            print("Gym Q3. Excellent")
                myVector[2] += valueAnswers[0]
                print(myVector[2])
            }
        }
        else if indexPath.item == 1{
            if myVector[2] != 0{
                myVector[2] = 0
            }
            else{
            print("Gym Q3. Medium")
                myVector[2] += valueAnswers[1]
                print(myVector[2])
            }
        }
        else {
            if myVector[2] != 0{
                myVector[2] = 0
            }
            else{
            print("Gym Q3. Poor")
                myVector[2] += valueAnswers[2]
                print(myVector[2])
            }
        }
            
            gymTotal += myVector[2]
            print(gymTotal)
                
        case 3:
        if indexPath.item == 0{
            if myVector[3] != 0{
                myVector[3] = 0
            }
            else{
            print("Gym Q4. Excellent")
                myVector[3] += valueAnswers[0]
                print(myVector[3])
            }
        }
        else if indexPath.item == 1{
            if myVector[3] != 0{
                myVector[3] = 0
            }
            else{
            print("Gym Q4. Medium")
                myVector[3] += valueAnswers[1]
                print(myVector[3])
            }
        }
        else {
            if myVector[3] != 0{
                myVector[3] = 0
            }
            else{
            print("Gym Q4. Poor")
                myVector[3] += valueAnswers[2]
                print(myVector[3])
            }
        }
            
            gymTotal += myVector[3]
            print(gymTotal)
              
        case 4:
            if indexPath.item == 0{
                if  myVector[4] != 0{
                    myVector[4] = 0
                }
                else{
                print("Gym Q5. Excellent")
                    myVector[4] += valueAnswers[0]
                    print(myVector[4])
                }
            }
            else if indexPath.item == 1{
                if myVector[4] != 0{
                    myVector[4] = 0
                }
                else{
                print("Gym Q5. Medium")
                    myVector[4] += valueAnswers[1]
                    print(myVector[4])
                }
            }
            
            else {
                if myVector[4] != 0{
                    myVector[4] = 0
                }
                else{
                print("Gym Q5. Poor")
                    myVector[4] += valueAnswers[2]
                    print(myVector[4])
                }
            }
            
            gymTotal += myVector[4]
            print(gymTotal)
              
        default :
            print("")
        }
        
    }

    @IBAction func saveGymButton(_ sender: Any) {
        CoreDataManage.inst.addDataGymSurvey(id: Int32(id),  tG: Int32(gymTotal), typeSer: servType)
        //addDataRoomSurvey(id: id, totalRoom: addQ, totalScore: roomTotal)
        print("data saved")
        
    }
    
    @IBAction func viewGymButton(_ sender: Any) {
        let data = CoreDataManage.inst.getData()
        for d in data{
            print("id is ", d.id , "Score for ", d.typeService, " Total Room Score is: ", d.totalGym )
        }
    }
    
}
