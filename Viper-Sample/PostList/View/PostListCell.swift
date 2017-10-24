//
//  PostListCell.swift
//  Viper-Sample
//
//  Created by TriNgo on 10/24/17.
//  Copyright © 2017 TriNgo. All rights reserved.
//

import UIKit
import AlamofireImage

class PostListCell: UITableViewCell {

    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    func set(forPost post: PostModel) {
        self.selectionStyle = .none
        titleLabel.text = post.title
        if let url = URL(string: post.thumbImageUrl) {
            postImageView.af_setImage(withURL: url)
        }
    }
}
