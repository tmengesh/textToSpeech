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
    @IBOutlet weak var btnUS: DLRadioButton! //American English (en-US)
    @IBOutlet weak var btnGB: DLRadioButton! //British English (en-GB)
    @IBOutlet weak var btnAU: DLRadioButton! //Australian English (en-AU)
    @IBOutlet weak var btnIE: DLRadioButton! //Irish English (en-IE)
    @IBOutlet weak var btnZA: DLRadioButton! //South African English (en-ZA)
    
    var selectedAccent = "en-US"
    
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
        utterance.voice = AVSpeechSynthesisVoice(language: selectedAccent)
        //utterance.rate = 0.1
        
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
        
        txtInput.becomeFirstResponder()
    }
    
    @objc @IBAction private func selectedLanguage(radioButton : DLRadioButton) {
        print(String(format: "%@ is selected.\n", radioButton.selected()!.titleLabel!.text!));
        let selected = radioButton.selected()!.titleLabel!.text!
        if(selected == "American English (en-US)"){
            selectedAccent = "en-US"
        }
        else if(selected == "British English (en-GB)"){
            selectedAccent = "en-GB"
        }
        else if(selected == "Australian English (en-AU)"){
            selectedAccent = "en-AU"
        }
        else if(selected == "Irish English (en-IE)"){
            selectedAccent = "en-IE"
        }
        else{
            selectedAccent = "en-ZA"
        }
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
}

