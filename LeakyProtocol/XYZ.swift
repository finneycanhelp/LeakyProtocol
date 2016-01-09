//
//  Stuff.swift
//  LeakyProtocol
//
//  Created by Michael Finney on 1/9/16.
//  Copyright © 2016 Mike Finney. All rights reserved.
//

import Foundation

// like a View Model
class XClass: YProtocol {
    
    var myZ: ZClass = ZClass.shared
    
}

// runSomething
protocol YProtocol {
    
    var myZ: ZClass { get set }
}

// forces the need for self to be used. Some kind of manageable thing.
class ZClass {

    static let shared = ZClass()
    func addSomething() {
        
    }
    
}

