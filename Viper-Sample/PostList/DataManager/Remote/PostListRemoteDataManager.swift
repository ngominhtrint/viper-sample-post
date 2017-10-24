//
//  PostListRemoteDataManager.swift
//  Viper-Sample
//
//  Created by TriNgo on 10/24/17.
//  Copyright © 2017 TriNgo. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class PostListRemoteDataManager: PostListRemoteDataManagerInputProtocol {
    
    var remoteRequestsHandler: PostListRemoteDataManagerOutputProtocol?
    
    func retrievePostList() {
        Alamofire
            .request(Endpoints.Posts.fetch.url, method: .get)
            .validate()
            .responseArray { (response: DataResponse<[PostModel]>) in
                switch response.result {
                case .success(let posts):
                    self.remoteRequestsHandler?.onPostsRetrieved(posts)
                case .failure(_):
                    self.remoteRequestsHandler?.onError()
            }
        }
    }
}
