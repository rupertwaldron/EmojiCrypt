//
//  Extensions.swift
//  EmojiCrypt
//
//  Created by Rupert Waldron on 27/12/2018.
//  Copyright © 2018 Rupert Waldron. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension Dictionary where Value: Equatable {
    func someKey(forValue val: Value) -> Key? {
        return first(where: { $1 == val })?.key
    }
}

extension Array {
    func shift(withDistance distance: Int = 1) -> Array<Element> {
        if self.count <= 0 {
            return self
        }
        let distanceRR = distance % self.count
        let offsetIndex = distance >= 0 ?
            self.index(startIndex, offsetBy: distanceRR, limitedBy: endIndex) :
            self.index(endIndex, offsetBy: distanceRR, limitedBy: startIndex)
        
        guard let index = offsetIndex else { return self }
        return Array(self[index ..< endIndex] + self[startIndex ..< index])
    }
    
    mutating func shiftInPlace(withDistance distance: Int = 1) {
        self = shift(withDistance: distance)
    }
}

extension Character
{
    func intValue() -> UInt32
    {
        let characterString = String(self)
        let scalars = characterString.unicodeScalars
        
        return scalars[scalars.startIndex].value
    }
}
