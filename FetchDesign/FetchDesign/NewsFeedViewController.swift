//
//  NewsFeedViewController.swift
//  FetchDesign
//
//  Created by Jing Fang on 6/27/20.
//  Copyright © 2020 J.A.M. All rights reserved.
//

import UIKit
import FirebaseDatabase

class NewsFeedViewController: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    var ref:DatabaseReference?
    var databaseHandle:DatabaseHandle?
    var post = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view.
        // Set the firebase reference
        ref = Database.database().reference()
        post.append(Post(text: "Hi, I am Mengning", userName: "Mengning", postLink: "https://picsum.photos/id/237/200/300", userPhotoLink: "https://picsum.photos/id/237/200/300"))
        self.tableView.reloadData()
//
//        databaseHandle = ref?.child("userid").child("id1").child("following").observe(.value, with:{ (snapshot ) in
//            let id = snapshot.value as? String
//            if let actualId = id{
//                let userName = self.ref?.child("users").child(actualId).child("name").key
//                let userPhotoLink = self.ref?.child("users").child(actualId).child("profilepic").key
//                self.ref?.child("users").child(actualId).child("Posts").observe(.childAdded, with:{(secondSnapshot) in
//                    for child in secondSnapshot.children{
//                        if let childSnapshot = child as? DataSnapshot,
//                            let dict = childSnapshot as? [String:Any],
//                            let text = dict["text"] as? String,
//                            let userName = self.ref?.child("users").child(actualId).child("name").key,
//                            let userPhotoLink = self.ref?.child("users").child(actualId).child("profilepic").key,
//                            let postLink = dict["media"] as? String{
//                            self.post.append(Post(text: text, userName: userName, postLink: postLink, userPhotoLink: userPhotoLink))
//                        }
//                    }
//                }
//                )
//                self.tableView.reloadData()
//            }
//        })
    }
    
}

extension NewsFeedViewController: UITableViewDelegate {
    
}
    extension NewsFeedViewController: UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        print("count")
        //        print(post.count)
                return 1
            }
            
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                let cell =  tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsFeedTableViewCell
               cell.set(post: post[indexPath.row])
               return cell
            }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }


