//
//  AbstractEncryptor.swift
//  EmojiCrypt
//
//  Created by Rupert Waldron on 27/12/2018.
//  Copyright © 2018 Rupert Waldron. All rights reserved.
//

import Foundation

class AbstractEncryptor: Encryptor {
    var emojiDictionary = [Character : Character]()
    var encryptor: Encryptor
    var key: Int
    init(encryptor: Encryptor, key: Int) {
        self.encryptor = encryptor
        self.key = key
        createDictionary()
    }
    func read() -> Character {
        let data = encryptor.read()
        return encryptDecrypt(data)
    }
    func encryptDecrypt(_ data: Character) -> Character {
        return data
    }
    func createDictionary() {
        var emojis = [Character]()
        let emoji1 = "👽🤖🏃🏻‍♀️🏃‍♂️👠👑👛👙🧶😇💀🌈🌪⚡️☄️☃️🔥🌴🎄🐝🦄🦀🍄🌙🧞‍♂️🧟‍♂️🧜🏻‍♀️🎭"
        let emoji2 = "🍟🍺🌰🍰🍔🍒🌶🍓🥃🍾🍼🍦🍊🍆🥥🥤🍩🎂🦴🧀🥐🍕🥧🍭🍯🍤🍬☕️🥪🍳🥑🍇"
        let emoji3 = "😎🎃😮🧐🥶🧟‍♂️💩🤡☠️🤢😷👿😘😝😍😤🤬🤯😱😶😴😙👻🤠🕺💃🏻🤓🙃🥵🤔😜🤪"
        
        let emojiList = emoji1 + emoji2 + emoji3
        for em in emojiList {
            emojis.append(em)
        }
        let 😼 = emojis.shift(withDistance: key)
        var alphabet = [Character]()
        for i in 33...126{
            alphabet.append(Character(UnicodeScalar(i)!))
        }
        emojiDictionary = Dictionary(uniqueKeysWithValues: zip(alphabet, 😼))
    }
}
