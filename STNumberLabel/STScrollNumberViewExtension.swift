//
//  STScrollNumberViewExtension.swift
//  STNumberLabel
//
//  Created by DangGu on 15/11/20.
//  Copyright © 2015年 Donggu. All rights reserved.
//

import Foundation

extension STScrollNumberView {
    func deepCopy() -> STScrollNumberView {
        return STScrollNumberView(frame: frame, font: font, number: currentNumber)
    }
}