//
//  Vigenere.swift
//  EmojiCrypt
//
//  Created by Rupert Waldron on 28/12/2018.
//  Copyright © 2018 Rupert Waldron. All rights reserved.
//

import Foundation


class Vigenere {
    let plainText: String
    let passKey: String
    init(plainText: String, passKey: String) {
        self.plainText = plainText
        self.passKey = passKey
    }

    func encrypt() -> String {
        var outputString = ""
        let passChar = [UnicodeScalar](passKey.unicodeScalars)
        var count = 0
        
        for inputChar in plainText {
            let 🤗 = passChar.shift(withDistance: count)
            let cypherKey = Int(🤗[0].value)
            count += 1
            let outputChar = Ceasar(encryptor: InputText(inputChar: inputChar), key: cypherKey).read()
            outputString += "\(outputChar)"
        }
        return outputString
    }
}

class DeVigenere {
    let emojiCypher: String
    let passKey: String
    init(emojiCypher: String, passKey: String) {
        self.emojiCypher = emojiCypher
        self.passKey = passKey
    }
    
    func decrypt() -> String {
        var outputString = ""
        let passChar = [UnicodeScalar](passKey.unicodeScalars)
        var count = 0
        
        for inputChar in emojiCypher{
            let 🤗 = passChar.shift(withDistance: count)
            let cypherKey = Int(🤗[0].value)
            count += 1
            let outputChar = DeCeasar(encryptor: InputText(inputChar: inputChar), key: cypherKey).read()
            outputString += "\(outputChar)"
        }
        return outputString
    }
}
