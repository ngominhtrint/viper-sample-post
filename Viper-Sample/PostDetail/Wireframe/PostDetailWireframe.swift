//
//  PostDetailWireframe.swift
//  Viper-Sample
//
//  Created by TriNgo on 10/24/17.
//  Copyright © 2017 TriNgo. All rights reserved.
//

import UIKit

class PostDetailWireframe: PostDetailWireframeProtocol {
    
    static func createPostDetailModule(forPost post: PostModel) -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "PostDetailController")
        if let view = viewController as? PostDetailView {
            let presenter: PostDetailPresenterProtocol = PostDetailPresenter()
            let wireframe: PostDetailWireframeProtocol = PostDetailWireframe()
            
            view.presenter = presenter
            presenter.view = view
            presenter.post = post
            presenter.wireframe = wireframe
            
            return viewController
        }
        
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
}
