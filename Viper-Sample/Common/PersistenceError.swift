//
//  PersistenceError.swift
//  Viper-Sample
//
//  Created by TriNgo on 10/20/17.
//  Copyright © 2017 TriNgo. All rights reserved.
//

import Foundation

enum PersistenceError: Error {
    case managedObjectContextNotFound
    case couldNotSaveObject
    case objectNotFound
}
