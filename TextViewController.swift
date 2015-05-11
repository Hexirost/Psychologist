//
//  TextViewController.swift
//  Psychologist
//
//  Created by Jeffrey Lin on 5/11/15.
//  Copyright (c) 2015 Jeffrey Lin. All rights reserved.
//

import UIKit

class TextViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView! {
        didSet{
            textView.text = text
        }
    }
    
    var text: String = ""{
        didSet{
            textView.text = text
        }
    }
}
 