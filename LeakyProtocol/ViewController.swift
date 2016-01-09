//
//  ViewController.swift
//  LeakyProtocol
//
//  Created by Michael Finney on 1/9/16.
//  Copyright © 2016 Mike Finney. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    @IBOutlet weak var tapMeButton: UIButton!
    
    let disposeBag = DisposeBag()

    let x: XClass = XClass()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tapMeButton.rx_tap.subscribeNext {
            
            self.x.runSomething().subscribeNext { someString -> Void in
                
                print("someString = \(someString)")
                
            }.addDisposableTo(self.disposeBag)
            
        }.addDisposableTo(disposeBag)
    }
    
    @IBAction func doneWasTapped(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
}

