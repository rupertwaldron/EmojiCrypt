//
//  Encryptor_Protocol.swift
//  EmojiCrypt
//
//  Created by Rupert Waldron on 27/12/2018.
//  Copyright © 2018 Rupert Waldron. All rights reserved.
//

import Foundation

protocol Encryptor {
    func read() -> Character
    func encryptDecrypt(_ data: Character) -> Character
}
