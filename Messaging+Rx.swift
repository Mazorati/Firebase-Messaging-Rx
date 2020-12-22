//
//  Messaging+Rx.swift
//
//  Created by Alex Mavrichev on 22.12.2020.
//  Copyright © 2020 Aleksandr Mavrichev. All rights reserved.
//

import Foundation
import RxSwift
import Firebase

extension Reactive where Base: Messaging {
    
    public func subscribe(toTopic topic: String) -> Completable {
        return Completable.create { event -> Disposable in
            self.base.subscribe(toTopic: topic) { (error: Error?) in
                if let error = error {
                    event(.error(error))
                } else {
                    event(.completed)
                }
            }
            return Disposables.create()
        }
    }
    
    public func unsubscribe(fromTopic topic: String) -> Completable {
        return Completable.create { event -> Disposable in
            self.base.unsubscribe(fromTopic: topic) { (error: Error?) in
                if let error = error {
                    event(.error(error))
                } else {
                    event(.completed)
                }
            }
            return Disposables.create()
        }
    }
}

