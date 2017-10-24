//
//  PostDetailProtocols.swift
//  Viper-Sample
//
//  Created by TriNgo on 10/24/17.
//  Copyright © 2017 TriNgo. All rights reserved.
//

import UIKit

// TODO - Presenter -> View
protocol PostDetailViewProrocol: class {
    var presenter: PostDetailPresenterProtocol? { get set }
    // Conform by view. Presenter call, view listens
    func showPostDetail(forPost post: PostModel)
}

// TODO - Presenter -> Wireframe
protocol PostDetailWireframeProtocol: class {
    
    // Conform by wireframe. Presenter calls. Wireframe listens
    static func createPostDetailModule(forPost post: PostModel) -> UIViewController
}

// TODO - View -> Presenter
protocol PostDetailPresenterProtocol: class {
    var view: PostDetailViewProrocol? { get set }
    var wireframe: PostDetailWireframeProtocol? { get set }
    var post: PostModel? { get set }
    
    // Conform by presenter. View calls, presenter listens
    func viewDidLoad()
}


