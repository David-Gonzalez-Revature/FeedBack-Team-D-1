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
    
    //MARK Questions data
    var imageData = ["Excellent", "Medium", "Poor"]
    var answer = [ "Excellent", "Medium", "Poor"]
    var roomQ = ["1. How was room cleaned","2. question", "3. Question", "4. Question", "5. question"]
    
   
    

    
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
    var roomTotal = 0
    var addQ = 0
    var id = 1
    
//    class RoomSurvey{
//        let roomTotal : Int! = nil
//        public func getScore(roomTotal : Int, addQ : Int) -> Int{
//
//            return roomTotal
//        }
//    }
    
    func updateRoomTotal(roomTotal : Int, indexpath: IndexPath){
        for i in 0...valueAnswers[roomQ.count]{
            self.roomTotal += valueAnswers[i]
        }
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section{
        case 0:
            if indexPath.item == 0{
                roomTotal = 0
                print("Room Q1. Excellent")
                roomTotal += valueAnswers[0]
                print(roomTotal)
            }
            else if indexPath.item == 1{
                roomTotal = 0
                print("Room Q1. Medium")
                roomTotal += valueAnswers[1]
                print(roomTotal)
            }
            else {
                roomTotal = 0
                print("Room Q1. Sad")
                roomTotal += valueAnswers[2]
                print(roomTotal)
            }
            
        case 1:
            if indexPath.item == 0{
                roomTotal = 0
                print("Room Q2. Excellent")
                roomTotal += valueAnswers[0]
                print(roomTotal)
            }
            else if indexPath.item == 1{
                roomTotal = 0
                print("Room Q2. Medium")
                roomTotal += valueAnswers[1]
                print(roomTotal)
            }
            else {
                roomTotal = 0
                print("Room Q2. Sad")
                roomTotal += valueAnswers[2]
                print(roomTotal)
            }
            
        case 2:
        if indexPath.item == 0{
            roomTotal = 0
            print("Room Q3. Excellent")
            roomTotal += valueAnswers[0]
            print(roomTotal)
        }
        else if indexPath.item == 1{
            roomTotal = 0
            print("Room Q3. Medium")
            roomTotal += valueAnswers[1]
            print(roomTotal)
        }
        else {
            roomTotal = 0
            print("Room Q3. Sad")
            roomTotal += valueAnswers[2]
            print(roomTotal)
        }
        case 3:
        if indexPath.item == 0{
            roomTotal = 0
            print("Room Q1. Excellent")
            roomTotal += valueAnswers[0]
            print(roomTotal)
        }
        else if indexPath.item == 1{
            roomTotal = 0
            print("Room Q1. Medium")
            roomTotal += valueAnswers[1]
            print(roomTotal)
        }
        else {
            roomTotal = 0
            print("Room Q1. Sad")
            roomTotal += valueAnswers[2]
            print(roomTotal)
        }
        case 4:
            if indexPath.item == 0{
                roomTotal = 0
                print("Room Q1. Excellent")
                roomTotal += valueAnswers[0]
                print(roomTotal)
            }
            else if indexPath.item == 1{
                roomTotal = 0
                print("Room Q1. Medium")
                roomTotal += valueAnswers[1]
                print(roomTotal)
            }
            else {
                roomTotal = 0
                print("Room Q1. Sad")
                roomTotal += valueAnswers[2]
                print(roomTotal)
            }
        default :
            print("")
        }
        
        
        //MARK: SAVE BUTTON
        
        
        
    }

    @IBAction func saveRoomButton(_ sender: Any) {
//        CoreDataManage.inst.addDataRoomSurvey(id: id, totalRoom: addQ, totalScore: roomTotal)
        print("data saved")
        
    }
    
    @IBAction func viewRoomButton(_ sender: Any) {
        
//        let data = CoreDataManage.inst.getData()
//        for d in data{
//            print("id is ", d.id ,
//                  "Question Score is " , d.totalRoom, " Total Room Score is: ", d.totalScore)
//        }
    }
    
    
    
    
    
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
