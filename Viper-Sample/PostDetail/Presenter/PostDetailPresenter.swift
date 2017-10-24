//
//  PostDetailPresenter.swift
//  Viper-Sample
//
//  Created by TriNgo on 10/24/17.
//  Copyright © 2017 TriNgo. All rights reserved.
//

import Foundation

class PostDetailPresenter: PostDetailPresenterProtocol {
    
    weak var view: PostDetailViewProrocol?
    var wireframe: PostDetailWireframeProtocol?
    var post: PostModel?
    
    func viewDidLoad() {
        view?.showPostDetail(forPost: post!)
    }
}
