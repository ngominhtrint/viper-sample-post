//
//  PostDetailView.swift
//  Viper-Sample
//
//  Created by TriNgo on 10/24/17.
//  Copyright © 2017 TriNgo. All rights reserved.
//

import UIKit
import AlamofireImage

class PostDetailView: UIViewController {
    
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var presenter: PostDetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension PostDetailView: PostDetailViewProrocol {
    func showPostDetail(forPost post: PostModel) {
        titleLabel.text = post.title
        if let url = URL(string: post.imageUrl) {
            postImageView.af_setImage(withURL: url)
        }
    }
}
