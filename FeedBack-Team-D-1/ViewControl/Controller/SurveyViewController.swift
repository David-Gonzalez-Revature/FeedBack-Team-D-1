//
//  SurveyViewController.swift
//  FeedBack-Team-D-1
//
//  Created by David Gonzalez on 2/28/22.
//

import UIKit

class SurveyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var valueAnswer: UILabel!
    
    var valueAnswers = [100,50,30]
    var room = 0
    var roomTotal = 0
    var addQ = 0
    var id = 1
    var servType = "Room"
    var myVector = [0,0,0,0,0]
    
    //MARK Questions data
    var imageData = ["Excellent", "Medium", "Poor"]
    var answer = [ "Excellent", "Medium", "Poor"]
    var roomQ = ["1. How was room cleaned","2. question", "3. Question", "4. Question", "5. question"]
    
   
    

    
    //displaying section of question with full tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
        return answer.count
   
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        <#code#>
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
            return roomQ[section]
        case 1:
            return roomQ[section]
        case 2:
            return roomQ[section]
        case 3:
            return roomQ[section]
        case 4:
            return roomQ[section]
        default:
            return ""
            
        }
    }

    
//    class RoomSurvey{
//        let roomTotal : Int! = nil
//        public func getScore(roomTotal : Int, addQ : Int) -> Int{
//
//            return roomTotal
//        }
//    }
    class score{
        var selectedScore: Int! = 0
    }
    
    var  m = score()
   
    func updateRoomTotal(roomTotal : Int, indexpath: IndexPath){
        for i in 0...valueAnswers[roomQ.count]{
            m.selectedScore += valueAnswers[i]
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
                        print("Food Q1. Excellent")
                        print(myVector[0])
                        
                    }
                }
                else if indexPath.item == 1{
                    if myVector[0] != 0{
                        
                        myVector[0] = 0
                    }
                    else{
                        myVector[0] = valueAnswers[1]
                    print("Food Q1. Medium")
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
                    print("Food Q1. Poor")
                    print(myVector[0])
                    }
                }
            roomTotal += myVector[0]
        print(roomTotal)
            
        case 1:
            if indexPath.item == 0{
                if myVector[1] != 0{
                    myVector[1] = 0
                }
                else{
                print("Food Q2. Excellent")
                    myVector[1] += valueAnswers[0]
                    print(myVector[1])
                }
            }
            else if indexPath.item == 1{
                if myVector[1] != 0{
                    myVector[1] = 0
                }
                else{
                print("Food Q2. Medium")
                    myVector[1] += valueAnswers[1]
                    print(myVector[1])
                }
            }
            else {
                if myVector[1] != 0{
                    myVector[1] = 0
                }
                else{
                print("Food Q2. Poor")
                    myVector[1] = valueAnswers[2]
                    print(myVector[1])
                }
            }
            
            roomTotal += myVector[1]
            print(roomTotal)
                
        case 2:
        if indexPath.item == 0{
            if myVector[2] != 0{
                myVector[2] = 0
            }
            else{
            print("Food Q3. Excellent")
                myVector[2] += valueAnswers[0]
                print(myVector[2])
            }
        }
        else if indexPath.item == 1{
            if myVector[2] != 0{
                myVector[2] = 0
            }
            else{
            print("Food Q3. Medium")
                myVector[2] += valueAnswers[1]
                print(myVector[2])
            }
        }
        else {
            if myVector[2] != 0{
                myVector[2] = 0
            }
            else{
            print("Food Q3. Poor")
                myVector[2] += valueAnswers[2]
                print(myVector[2])
            }
        }
            
            roomTotal += myVector[2]
            print(roomTotal)
                
        case 3:
        if indexPath.item == 0{
            if myVector[3] != 0{
                myVector[3] = 0
            }
            else{
            print("Food Q4. Excellent")
                myVector[3] += valueAnswers[0]
                print(myVector[3])
            }
        }
        else if indexPath.item == 1{
            if myVector[3] != 0{
                myVector[3] = 0
            }
            else{
            print("Food Q4. Medium")
                myVector[3] += valueAnswers[1]
                print(myVector[3])
            }
        }
        else {
            if myVector[3] != 0{
                myVector[3] = 0
            }
            else{
            print("Food Q4. Poor")
                myVector[3] += valueAnswers[2]
                print(myVector[3])
            }
        }
            
            roomTotal += myVector[3]
            print(roomTotal)
              
        case 4:
            if indexPath.item == 0{
                if  myVector[4] != 0{
                    myVector[4] = 0
                }
                else{
                print("Food Q5. Excellent")
                    myVector[4] += valueAnswers[0]
                    print(myVector[4])
                }
            }
            else if indexPath.item == 1{
                if myVector[4] != 0{
                    myVector[4] = 0
                }
                else{
                print("Food Q5. Medium")
                    myVector[4] += valueAnswers[1]
                    print(myVector[4])
                }
            }
            
            else {
                if myVector[4] != 0{
                    myVector[4] = 0
                }
                else{
                print("Food Q5. Poor")
                    myVector[4] += valueAnswers[2]
                    print(myVector[4])
                }
            }
            
            roomTotal += myVector[1]
            print( roomTotal)
              
        default :
            print("")
        }
        
        
        //MARK: SAVE BUTTON
        
        
        
    }

    @IBAction func saveRoomButton(_ sender: Any) {
        CoreDataManage.inst.addDataRoomSurvey(id: Int32(id),  tR: Int32(roomTotal), typeSer: servType)
        //addDataRoomSurvey(id: id, totalRoom: addQ, totalScore: roomTotal)
        print("data saved")
        
    }
    
    
    @IBAction func viewRoomButton(_ sender: Any) {
        
        let data = CoreDataManage.inst.getData()
        for d in data{
            print("id is ", d.id , "Score for ", d.typeService, " Total Room Score is: ", d.totalRoom )
        }
    }
    
//    @IBAction func updateRoomButton(_ sender: Any) {
//        var d = CoreDataManage.inst.updateData(id: Int32(id), tR: Int32(roomTotal), tF: Int32(m.selectedScore), tS: Int32(roomTotal), typeSer: servType)
//
//    }
    
    
    
    
    
//    saImage.isHidden = false
//    HappyImage.isHidden = true
    
    //this section attempt to make switch as for loop ----------------
    
//        for i in 0...roomQ.count {
//            print("somos lo maximo")
//            for j in 0...answer.count{
//                switch indexPath.section{
//                    case 0:
//                    cellQ1.excellentlb.text = answer[indexPath.row]
//                    cellQ1.exImg.image = UIImage(named: imageData[indexPath.row])
//                    return cellQ1
//                case 1:
//                    cellQ2.mediumlb.text = answer[indexPath.row]
//                    cellQ2.medImg.image = UIImage(named: imageData[indexPath.row])
//                    return cellQ2
//                case 2:
//                    cellQ3.sadlb.text = answer[indexPath.row]
//                    cellQ3.sadImg.image = UIImage(named: imageData[indexPath.row])
//                    return cellQ3
//                default:
//                    return cellQ1
//                }
//            }
//        }

//        }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
