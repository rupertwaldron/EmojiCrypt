//
//  Encryption.swift
//  EmojiCrypt
//
//  Created by Rupert Waldron on 27/12/2018.
//  Copyright © 2018 Rupert Waldron. All rights reserved.
//

import Foundation

let inputString = "This is my secrete phrase to hide ***NOW***!!)"

var outputString = ""
let password = "spiral8!"
let passChar = [UnicodeScalar](password.unicodeScalars)
var count = 0

//for n in 1...20 {
//    let arr = passChar.shift(withDistance: count)
//    count += 1
//    print(arr)
//}
//for inputChar in inputString {
//    let 🤗 = passChar.shift(withDistance: count)
//    let cypherKey = Int(🤗[0].value)
//    //    print(count, terminator: ":")
//    //    print(cypherKey, terminator: " ")
//    count += 1
//    let outputChar = Ceasar(encryptor: InputText(inputChar: inputChar), key: cypherKey).read()
//    outputString += "\(outputChar)"
//
//    //print("\(outputChar)", terminator: "")
//}
//
//count = 0
//print(outputString)
//for deChar in outputString {
//    let 🤗 = passChar.shift(withDistance: count)
//    let cypherKey = Int(🤗[0].value)
//    count += 1
//    let decryptChar = DeCeasar(encryptor: InputText(inputChar: deChar), key: cypherKey).read()
//    print("\(decryptChar)", terminator: "")
//}
