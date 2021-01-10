//
//  ViewController.swift
//  SpeechAPP2
//
//  Created by 井関竜太郎 on 2021/01/10.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let speechService = SpeechService()
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func start(_ sender: Any) {
        speechService.say(textField.text!)
    }
    
    
    @IBAction func stop(_ sender: Any) {
        speechService.stop()
    }
    
}

