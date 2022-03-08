//
//  DBAuthorizationHelper.swift
//  FeedBack-Team-D-1
//
//  Created by John Figueroa on 3/7/22.
//

import Foundation
import UIKit
import CoreData

class DBAuthorizationHelper{
    
    //context reference variable
    let context = (UIApplication.shared.delegate as! AppDelegate?)?.persistentContainer.viewContext //requires UIApplication.share.delegate object; must import UIKit framework; belongs to AppDelegate, which why need delegate
    
    //instance of DBHelper class
    static var inst = DBAuthorizationHelper()
    
    func addDAta(n : String, m: String){
        let userData = NSEntityDescription.insertNewObject(forEntityName: "Authorization", into: context!) as! Authorization
        
        userData.username = n
        userData.password = m
        
        do{
            try context?.save()
        } catch{
            print("data not saved")
        }
        
    }
    
    func getData()->[Authorization]{
        var userData = [Authorization]()
        var fReq = NSFetchRequest<NSFetchRequestResult>(entityName: "Authorization") //need fetch reuqest to get data
        do{
            //authorization is one type of the array keep all information coming in form of fetch request
            userData = try context?.fetch(fReq) as! [Authorization]
        } catch {
            print("cannot fetch any data")
        }
        return userData
    }
    
    func deleteData(n: String){
            var fReq = NSFetchRequest<NSManagedObject>.init(entityName: "Authorization")
            fReq.predicate = NSPredicate(format: "username == %@", n)

            do{
                let st = try context?.fetch(fReq)
                context?.delete(st?.first as! Authorization)
                try context?.save()
                print("data deleted")
            }
            catch{

            }

        }
    
}
