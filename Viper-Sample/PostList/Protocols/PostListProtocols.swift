//
//  PostListProtocols.swift
//  Viper-Sample
//
//  Created by TriNgo on 10/20/17.
//  Copyright © 2017 TriNgo. All rights reserved.
//

import UIKit

// TODO - Presenter -> View
protocol PostListViewProtocol: class {
    var presenter: PostListPresenterProtocol? { get set }
    
    // Conformed by View. Presenter calls, view listens.
    func showPosts(with posts: [PostModel])
    
    func showError()
    
    func showLoading()
    
    func hideLoading()
}

// TODO - Presenter -> Wireframe
protocol PostListWireFrameProtocol: class {
    static func createPostListModule() -> UIViewController
    // Conformed by Wireframe. Presenter calls, wireframe listens
    func presentPostDetailScreen(from view: PostListViewProtocol, forPost post: PostModel)
}

// TODO - View -> Presenter
protocol PostListPresenterProtocol: class {
    
    // Conform by Presenter. View calls, presenter listens
    var view: PostListViewProtocol? { get set }
    var interactor: PostListInteractorInputProtocol? { get set }
    var wireframe: PostListWireFrameProtocol? { get set }
    
    func viewDidLoad()
    func showPostDetail(forPost post: PostModel)
}

// TODO - Interactor -> Presenter
protocol PostListInteractorOutputProtocol: class {
    
    // Conform by Presenter. Interactor calls, presenter listens
    func didRetrievePosts(_ posts: [PostModel])
    func onError()
}

// TODO - Presenter -> Interactor
protocol PostListInteractorInputProtocol: class {
    var presenter: PostListInteractorOutputProtocol? { get set }
    var localDataManager: PostListLocalDataManagerInputProtocol? { get set }
    var remoteDataManager: PostListRemoteDataManagerInputProtocol? { get set }
    
    // Conform by Interactor. Presenter calls, Interactor listens
    func retrievePostList()
}

// TODO - Interactor -> DataManager
protocol PostListDataManagerInputProtocol: class {
    
    // Conform by DataManager. Interactor calls, DataManager listens
}

// TODO - Interactor -> LocalDataManager
protocol PostListLocalDataManagerInputProtocol: class {
    
    // Conform by LocalDataManager. Interactor calls, LocalDataManager listens
    func retrievePostList() throws -> [Post]
    func savePost(id: Int, title: String, imageUrl: String, thumbImageUrl: String) throws
}

// TODO - Interactor -> RemoteDataManager
protocol PostListRemoteDataManagerInputProtocol: class {
    var remoteRequestsHandler: PostListRemoteDataManagerOutputProtocol? { get set }
    // Conform by RemoteDataManager. Interactor calls, RemoteDataManager listens
    func retrievePostList()
}

// TODO - RemoteDataManager -> Interactor
protocol PostListRemoteDataManagerOutputProtocol: class {
    
    // Conform by Interactor. RemoteDataManager calls, Interactor listens
    func onPostsRetrieved(_ posts: [PostModel])
    func onError()
}
