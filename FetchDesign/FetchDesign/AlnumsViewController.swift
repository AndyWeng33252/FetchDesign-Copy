//
//  AlnumsViewController.swift
//  FetchDesign
//
//  Created by Jing Fang on 6/27/20.
//  Copyright © 2020 J.A.M. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseStorage
import FirebaseAuth

class AlnumsViewController: UIViewController {
    
    let UserID = Auth.auth().currentUser!.uid
    let dataRef = Database.database().reference()
    let storage = Storage.storage()
    @IBOutlet weak var collectionView: UICollectionView!
    var photoArray = [String]()
    var selectedPhotoURL: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getPhotoUpdate()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func getPhotoUpdate() {
        dataRef.child("users").child(UserID).child("images").observe(.value, with: {(snapshot) in
            for child in snapshot.children {
                self.photoArray.append((child as! DataSnapshot).value as! String)
            }
            self.collectionView.reloadData()
        })
    }

}

extension AlnumsViewController:UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedPhotoURL = photoArray[indexPath.item]
        performSegue(withIdentifier: "seePhoto", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ViewImageViewController{
            vc.imageURL = selectedPhotoURL
        }
    }
    
}

extension AlnumsViewController:UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "albumCell", for: indexPath) as! albumCell
        cell.configCell(imageURL: photoArray[indexPath.item])
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photoArray.count
    }
}
