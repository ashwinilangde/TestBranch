//
//  UserProfileViewController.swift
//  InstagramTestApp
//
//  Created by Ashwini on 14/03/20.
//  Copyright © 2020 Ashwini. All rights reserved.
//

import UIKit
import Foundation

//https://jsonplaceholder.typicode.com/todos

class UserProfileViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    let userItems = ["ashwini","anvayee","sagar"]


    @IBOutlet weak var userProfileCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let reuseIdentifier = "UserProfileCollectionViewCell"
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! UserProfileCollectionViewCell

        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell.userNameLabel.text = userItems[indexPath.item]
        cell.backgroundColor = UIColor.cyan // make cell more visible in our example project

        return cell
    }

   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
   

}
