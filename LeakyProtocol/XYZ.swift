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
        
        return myZ.addSomething(stringToAdd)
        
    }

}

// forces the need for self to be used. Some kind of manageable thing.
class ZClass {

    static let shared = ZClass()
        
    func addSomething(something: String) -> Observable<String> {
        
        print("The \(something) was added somewhere.")
        
        return Observable.just(something)
    }
    
}

