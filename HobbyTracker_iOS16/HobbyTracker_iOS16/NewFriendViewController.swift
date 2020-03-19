//
//  NewFriendViewController.swift
//  HobbyTracker_iOS16
//
//  Created by Stephanie Ballard on 3/19/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

protocol NewFriendDelegate {
    func friendWasCreated(friend: Friend)
}

class NewFriendViewController: UIViewController {
    
    @IBOutlet weak var newFriendLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var homeTownTextField: UITextField!
    @IBOutlet weak var hobbyLabel: UILabel!
    @IBOutlet weak var hobby1TextField: UITextField!
    @IBOutlet weak var hobby2TextField: UITextField!
    @IBOutlet weak var hobby3TextField: UITextField!
    
    // Anything the conforms to the NewFriendDelegate protocol can be my delegate
    var delegate: NewFriendDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        // Grab the name and hometown
        guard let newName = nameTextField.text,
            let newHometown = homeTownTextField.text else { return }
        // Grab the hobbies
        var newHobbies: [String] = []
        
        if let hobby1 = hobby1TextField.text, // where
            !hobby1.isEmpty { // same as hobby1 != ""
            newHobbies.append(hobby1)
        }
        // we are preventing having an array of empty strings
        if let hobby2 = hobby2TextField.text {
            if hobby2 != "" {
                newHobbies.append(hobby2)
            }
        }
        if let hobby3 = hobby3TextField.text,
            !hobby3.isEmpty {
            newHobbies.append(hobby3)
        }
        
        // Create the friend
        let friend = Friend(name: newName , hometown: newHometown, hobbies: newHobbies)
        delegate?.friendWasCreated(friend: friend)
        dismiss(animated: true, completion: nil)
        
        // Pass the friend back to the FriendsTableViewController
    }
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


