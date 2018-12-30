//
//  InputText.swift
//  EmojiCrypt
//
//  Created by Rupert Waldron on 27/12/2018.
//  Copyright © 2018 Rupert Waldron. All rights reserved.
//

import Foundation

class InputText: Encryptor {
    let inputChar: Character
    init(inputChar: Character) {
        self.inputChar = inputChar
    }
    
    func read() -> Character {
        return inputChar
    }
    
    func encryptDecrypt(_ data: Character) -> Character {
        return data
    }
}
