//
//  UserListViewModel.swift
//  InstagramTestApp
//
//  Created by Ashwini on 15/03/20.
//  Copyright © 2020 Ashwini. All rights reserved.
//

import Foundation

class UserListViewModel {
    
    func GetUserList(completion: @escaping ([UserList]) -> Void) {
        ServerResponse().getApiResponse { (UserListModel) in
            CoreDataManager().saveUserInfo(userList: UserListModel)
            completion(CoreDataManager().getUserList())
        }
    }
    
}
