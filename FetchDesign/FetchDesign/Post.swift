//
//  Post.swift
//  FetchDesign
//
//  Created by 耿梦宁 on 8/5/20.
//  Copyright © 2020 J.A.M. All rights reserved.
//

import Foundation
class Post{
    let text: String
    let userName: String
    let postLink: String
    let userPhotoLink: String
    init(text: String, userName:String, postLink: String, userPhotoLink: String) {
        self.text = text
        self.userName = userName
        self.postLink = postLink
        self.userPhotoLink = userPhotoLink
    }
}
