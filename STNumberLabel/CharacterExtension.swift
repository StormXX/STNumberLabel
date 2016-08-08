//
//  CharacterExtension.swift
//  STNumberLabel
//
//  Created by DangGu on 15/11/9.
//  Copyright © 2015年 Donggu. All rights reserved.
//

import UIKit

extension Character {
    
    func intValue() -> Int? {
        return Int(String(self))
    }

    func utf8Value() -> UInt8 {
        for s in String(self).utf8 {
            return s
        }
        return 0
    }

    func utf16Value() -> UInt16 {
        for s in String(self).utf16 {
            return s
        }
        return 0
    }

    func unicodeValue() -> UInt32 {
        for s in String(self).unicodeScalars {
            return s.value
        }
        return 0
    }
}

