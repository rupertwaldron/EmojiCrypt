//
//  ViewController.swift
//  EmojiCrypt
//
//  Created by Rupert Waldron on 24/12/2018.
//  Copyright © 2018 Rupert Waldron. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var plainText: UITextView!

    @IBOutlet weak var cypherEmoji: UITextView!
    
    @IBOutlet weak var passPhrase: UITextField!
    
    let encryptImage: UIImage = UIImage(named: "wavelength_icon")!
    let decryptImage: UIImage = UIImage(named: "trending_fire")!

    var encryptText: Bool = true
    var cypherKey: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        plainText.delegate = self
        passPhrase.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        self.hideKeyboardWhenTappedAround() 
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        guard let cypherKey = getCypherKey() else {
            return
        }
        if encryptText {
            print(plainText.text)
            cypherEmoji.text = Vigenere(plainText: plainText.text, passKey: cypherKey).encrypt()
        } else {
            print(cypherEmoji.text)
            plainText.text = DeVigenere(emojiCypher: cypherEmoji.text, passKey: cypherKey).decrypt()
        }
    }

    func textViewDidChange(_ textView: UITextView) {
        guard let cypherKey = getCypherKey() else {
            return
        }
        if encryptText {
            print(plainText.text)
            cypherEmoji.text = Vigenere(plainText: plainText.text, passKey: cypherKey).encrypt()
        } else {
            print(cypherEmoji.text)
            plainText.text = DeVigenere(emojiCypher: cypherEmoji.text, passKey: cypherKey).decrypt()
        }
    }

    @IBAction func encryptDecryptBtnPressed(_ sender: UIButton) {
        guard let cypherKey = getCypherKey() else {
            return
        }
        print(encryptText)
        if encryptText {
            encryptText = !encryptText
            sender.setTitle("Decrypt", for: .normal)
            sender.setTitleColor(.yellow , for: .normal)
            sender.backgroundColor = .red
            cypherEmoji.delegate = self
            plainText.text = DeVigenere(emojiCypher: cypherEmoji.text, passKey: cypherKey).decrypt()
            print(cypherEmoji.text)
        } else {
            encryptText = !encryptText
            sender.setTitleColor(.yellow , for: .normal)
            sender.backgroundColor = .green
            sender.setTitle("Encrypt", for: .normal)
            plainText.delegate = self
            cypherEmoji.text = Vigenere(plainText: plainText.text, passKey: cypherKey).encrypt()
            print(cypherEmoji.text)
        }
    }
    
    func getCypherKey() -> String? {
        guard let cypherKey = passPhrase.text else {
            return nil
        }
        if cypherKey == "" {
            let alert = UIAlertController(title: "Alert", message: "You must enter a passkey", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                switch action.style{
                case .default:
                    print("default")
                    
                case .cancel:
                    print("cancel")
                    
                case .destructive:
                    print("destructive")
                }}))
            self.present(alert, animated: true, completion: nil)
            return nil
        }
        return cypherKey
    }
}

