//
//  ViewController.swift
//  textToSpeech
//
//  Created by Tewodros Mengesha on 05/08/2019.
//  Copyright © 2019 swift by Teddy. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var txtInput: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        txtInput.becomeFirstResponder()
        
        //Look for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }

    @IBAction func btnConvert(_ sender: Any) {
        if(txtInput.text == ""){
            let alert = UIAlertController(title: "Empty Text Field", message: "Please enter a text in the field", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            textToSpeech(txt: "Please enter some text and press Listen")
            txtInput.becomeFirstResponder()
            
        }
        else{
            textToSpeech(txt: txtInput.text!)
            txtInput.text = ""
            txtInput.becomeFirstResponder()
            
        }
    }
    
    func textToSpeech(txt: String){
        let utterance = AVSpeechUtterance(string: txt)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        //utterance.rate = 0.1
        
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
        
        txtInput.becomeFirstResponder()
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
}

