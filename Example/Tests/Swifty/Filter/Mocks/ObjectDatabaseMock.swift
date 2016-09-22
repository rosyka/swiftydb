//
//  MockDatabase.swift
//  SwiftyDB
//
//  Created by Øyvind Grimnes on 29/08/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Foundation

@testable import SwiftyDB

struct ObjectDatabaseMock: ObjectDatabase {
    
    func add<T : Storable>(object: T, resultHandler: (Result<Void> -> Void)?) {
        add([object], resultHandler: resultHandler)
    }
    
    func add<T : Storable>(objects: [T], resultHandler: (Result<Void> -> Void)?) {
        resultHandler?(.success())
    }
    

    func get<T : Storable>(query: Query<T>, resultHandler: (Result<[T]> -> Void)?) {
        resultHandler?(.success([]))
    }

    func get<T : Storable>(type: T.Type) -> GetQuery<T> {
        return GetQuery(database: self)
    }
    
    func get<T : Storable>(type: T.Type, resultHandler: (Result<[T]> -> Void)?) {
        let query = Query<T>()
        
        get(query, resultHandler: resultHandler)
    }
    
    func delete<T : Storable>(type: T.Type, resultHandler: (Result<Void> -> Void)?) {
        let query = Query<T>()
        
        delete(query, resultHandler: resultHandler)
    }
    
    func delete<T : Storable>(query: Query<T>, resultHandler: (Result<Void> -> Void)?) {
        resultHandler?(.success())
    }
    
}
