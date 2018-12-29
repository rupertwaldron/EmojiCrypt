//
//  Ceasar.swift
//  EmojiCrypt
//
//  Created by Rupert Waldron on 27/12/2018.
//  Copyright © 2018 Rupert Waldron. All rights reserved.
//

import Foundation


class Ceasar: AbstractEncryptor {
    override func encryptDecrypt(_ data: Character) -> Character {
        let dataInt = data.intValue()
        if dataInt < 33 || dataInt > 126 {
            return data
        }
        return emojiDictionary[data]!
    }
}

class DeCeasar: AbstractEncryptor {
    override func encryptDecrypt(_ data: Character) -> Character {
        if let key = emojiDictionary.someKey(forValue: data) {
            return key
        }
        return data
    }
}
