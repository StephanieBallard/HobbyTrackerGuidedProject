//
//  FriendsTableViewController.swift
//  HobbyTracker_iOS16
//
//  Created by Stephanie Ballard on 3/19/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

class FriendsTableViewController: UIViewController {

    // When we create a custom table view we need to make an outlet to use it since it is a regular view controller. this gives us access to the tableView.
    @IBOutlet weak var tableView: UITableView!
    
    var friends: [Friend] = [Friend(name: "Bob", hometown: "Salt Lake City", hobbies: ["Reading"])]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Set the view controller as the delegate (data source) of the tableview
        tableView.dataSource = self
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ModalNewFriend" {
            guard let newFriendVC = segue.destination as? NewFriendViewController else { return }
            // sets up this view controller to recieve the information passed from the newFriendVC using the delegate pattern
            newFriendVC.delegate = self
        }
    }
    

}

extension FriendsTableViewController: UITableViewDataSource {
    // 2 forms of communication with the delegate pattern
    // requesting information. we know this bc the function has a return.
    // letting you know that something happened, these functions dont have a return type.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as? FriendTableViewCell
            else {
            fatalError("Cell is not a FriendTableViewCell")
    }
    
        let friend = friends[indexPath.row]
        
        cell.nameLabel.text = friend.name
        cell.hometownLabel.text = friend.hometown
        cell.hobbiesLabel.text = "\(friend.hobbies.count) hobbies"
    
        return cell
}

}

extension FriendsTableViewController: NewFriendDelegate {
    // When the  NewFriendVC tells us there is a new friend, what do we want to do with it?
    func friendWasCreated(friend: Friend) {
        friends.append(friend)
        tableView.reloadData()
    }
}

