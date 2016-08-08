//
//  STScrollNumberView.swift
//  STNumberLabel
//
//  Created by DangGu on 15/11/7.
//  Copyright © 2015年 Donggu. All rights reserved.
//

import UIKit

class STScrollNumberView: UIView {

    private let scrollView: UIScrollView
    private var currentNumber = 0
    private let font: UIFont
    private let numberIndex: [Int] = [9, 8, 7, 6, 5, 4, 3, 2, 1, 0]
    
    init(frame: CGRect, font: UIFont, number: Int) {

        self.font = font
        self.currentNumber = number
        self.scrollView = UIScrollView(frame: CGRect(origin: CGPointZero, size: frame.size))

        super.init(frame: frame)

        scrollView.contentSize = CGSize(width: frame.width, height: frame.height * 10)

        for i in 0..<10 {
            let numberFrame = CGRectMake(0, frame.height * CGFloat(i), frame.width, frame.height)
            let label = UILabel(frame: numberFrame)
            label.text = "\(numberIndex[i])"
            label.textAlignment = NSTextAlignment.Center
            label.font = font
            scrollView.addSubview(label)
        }

        scrollView.contentOffset = CGPoint(x: 0, y: frame.height * CGFloat(numberIndex[currentNumber]))

        addSubview(scrollView)
    }

    convenience init(frame: CGRect, font: UIFont) {
        self.init(frame: frame, font: font, number: 0)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func scrollToNumber(number: NSInteger) {
        if number < 0 || number > 10 {
            scrollToNumber(0)
            return
        }

        if number == currentNumber {
            return
        }

        currentNumber = number

        UIView.animateWithDuration(1.0, delay: 0.0, options: .CurveEaseOut, animations: { [unowned self] in
                self.scrollView.setContentOffset(CGPoint(x: 0, y: self.frame.height * CGFloat(self.numberIndex[number])), animated: false)
        }, completion: nil)
    }

}

extension STScrollNumberView {
    func deepCopy() -> STScrollNumberView {
        return STScrollNumberView(frame: frame, font: font, number: currentNumber)
    }
}
