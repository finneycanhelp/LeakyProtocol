//
//  Stuff.swift
//  LeakyProtocol
//
//  Created by Michael Finney on 1/9/16.
//  Copyright © 2016 Mike Finney. All rights reserved.
//

import Foundation
import RxSwift

// like a View Model
class XClass: YProtocol {
    
    var myZ: ZClass = ZClass.shared
    
}

// runSomething
protocol YProtocol {
    
    var myZ: ZClass { get set }

    func runSomething() -> Observable<String>
}

extension YProtocol {

    func runSomething() -> Observable<String> {
        
        // some string is obtained somehow.
        let stringToAdd = NSUUID().UUIDString
        
        return Observable.create({ (observer) -> Disposable in

            // this "self" is the suspicious part. Is this creating a retain cycle reference?
            let somethingReturned = self.myZ.addSomething(stringToAdd)
            
            observer.onNext(somethingReturned)
            observer.onCompleted()
            
            return NopDisposable.instance
        })
    }
}

class ZClass {

    static let shared = ZClass()
        
    func addSomething(something: String) -> String {
        
        print("The \(something) was added somewhere.")
        
        return something
    }
}

