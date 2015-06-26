//
//  ViewController.swift
//  ShowTableBug
//
//  Created by Michael L Mehr on 6/25/15.
//  Copyright (c) 2015 Michael L. Mehr. All rights reserved.
//

import UIKit

/*
Bug in Swift 1.2 compiler - discovered by Mike Mehr
---
This was the simplest running code project for iOS to reproduce the bug. All boilerplate except the lines marked below.
- I suspect it will slow down the compilation of any Swift file though.
The bug: add an array to another array many times in one statement.
Many for N=1-4 is reasonable
For N=5, compilation takes about 1 minute on my 2012 Mac Mini with SSD drive (2.3GHz Core i7 with 16GB RAM)
For N=6, I waited over a half hour before giving up.
I don't EVEN want to try N=7 and above!

Solution: break it up into two statements (or more) with N<=4 in each.
(In my original code, there were six different tables to merge. I did the naive thing and added them all on one line, and then went crazy trying to figure out why my compile times got so bad!)
*/

func showBug() {
    let addable = [""] // just create an array to add to another array, over and over
    // N=4: using this line only - compiles in under 1 sec
    //let table = addable + addable + addable + addable
    
    // N=5: using this line only - compiles in about a minute
    //let table = addable + addable + addable + addable + addable
    
    // N=6: using this line only - I gave up waiting after a half hour
    let table = addable + addable + addable + addable + addable + addable
    
    // N=7: COMPILE AT YOUR OWN RISK! :)
    //let table = addable + addable + addable + addable + addable + addable + addable
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

