//
//  NewsFeedTableViewCell.swift
//
//  Created by 耿梦宁 on 8/5/20.
//  Copyright © 2020 J.A.M. All rights reserved.
//

import UIKit
import Foundation
class NewsFeedTableViewCell: UITableViewCell{
    
    @IBOutlet weak var Username: UILabel!
    @IBOutlet weak var UserPhoto: UIImageView!
    @IBOutlet weak var PostImage: UIImageView!
    @IBOutlet weak var sentence: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func set(post:Post) {
        self.Username.text = post.userName
        self.sentence.text = post.text
        setImageForUserPhoto(from: post.userPhotoLink)
        setImageForPostImage(from: post.postLink)
    }
    
    func setImageForUserPhoto(from url: String) {
        guard let imageURL = URL(string: url) else { return }

            // just not to cause a deadlock in UI!
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }

            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                self.UserPhoto.image = image
            }
        }
    }
    
    func setImageForPostImage(from url: String) {
        guard let imageURL = URL(string: url) else { return }

            // just not to cause a deadlock in UI!
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }

            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                var newPostImage = UIImageView()
                self.PostImage.image = image
            }
        }
    }
}
