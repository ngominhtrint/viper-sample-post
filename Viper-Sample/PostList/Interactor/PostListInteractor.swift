//
//  PostListInteractor.swift
//  Viper-Sample
//
//  Created by TriNgo on 10/24/17.
//  Copyright © 2017 TriNgo. All rights reserved.
//

import Foundation

class PostListInteractor: PostListInteractorInputProtocol {
    weak var presenter: PostListInteractorOutputProtocol?
    var localDataManager: PostListLocalDataManagerInputProtocol?
    var remoteDataManager: PostListRemoteDataManagerInputProtocol?
    
    func retrievePostList() {
        do {
            if let postList = try localDataManager?.retrievePostList() {
                let postModelList = postList.map {
                    return PostModel(id: Int($0.id), title: $0.title!, imageUrl: $0.imageUrl!, thumbImageUrl: $0.thumbImageUrl!)
                }
                if postModelList.isEmpty {
                    remoteDataManager?.retrievePostList()
                } else {
                    presenter?.didRetrievePosts(postModelList)
                }
            } else {
                remoteDataManager?.retrievePostList()
            }
        } catch {
            presenter?.didRetrievePosts([])
        }
    }
}

extension PostListInteractor: PostListRemoteDataManagerOutputProtocol {
    
    func onPostsRetrieved(_ posts: [PostModel]) {
        presenter?.didRetrievePosts(posts)
        
        for postModel in posts {
            do {
                try localDataManager?.savePost(id: postModel.id, title: postModel.title, imageUrl: postModel.imageUrl, thumbImageUrl: postModel.thumbImageUrl)
            } catch {
                
            }
        }
    }
    
    func onError() {
        presenter?.onError()
    }
}

