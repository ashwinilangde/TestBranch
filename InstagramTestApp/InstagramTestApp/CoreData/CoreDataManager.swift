//
//  CoreDataManager.swift
//  InstagramTestApp
//
//  Created by Ashwini on 16/03/20.
//  Copyright © 2020 Ashwini. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManager {
    let context = Constants().appDelegate.persistentContainer.viewContext
    
    func saveContext () {
        //let context = Constants.appDelegate.persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Show the error here
            }
        }
    }
    
    // MARK: - Save User  data
    func saveUserInfo(userList: [UserListModel]) {
        let userInfo = getUserList()
        for user in userList {
            let filtered = userInfo.filter { (Int ($0.id) == (user.id))}
                   if filtered.count == 0 {
                    let entity = NSEntityDescription.entity(forEntityName: "UserList", in: context)
                    let userData = NSManagedObject(entity: entity!, insertInto: context)
                    userData.setValue(user.id, forKey: "id")
                    userData.setValue(user.userId, forKey: "userId")
                    userData.setValue(user.title, forKey: "title")
                    userData.setValue(user.completed, forKey: "completed")
            }
        }
        saveContext()
   
    }
    
    // MARK: - get User  data
    func getUserList() ->[UserList]  {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserList")
        do {
            let results = try context.fetch(fetchRequest)
            let  dataCreated = results as! [UserList]
            return dataCreated
            
        }catch let err as NSError {
            print(err.debugDescription)
            return []
        }
    }
}
