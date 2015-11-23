//
//  STScrollNumberView.swift
//  STNumberLabel
//
//  Created by DangGu on 15/11/7.
//  Copyright © 2015年 Donggu. All rights reserved.
//

import UIKit

class STScrollNumberView: UIView {
    var scrollView: UIScrollView!
    var currentNumber = 0
    var font: UIFont!
    let numberIndex: [Int] = [9,8,7,6,5,4,3,2,1,0]
    
    init(frame: CGRect, font: UIFont, number: Int) {
        self.font = font
        self.currentNumber = number
        super.init(frame: frame)
        
        scrollView = UIScrollView(frame: bounds)
        scrollView.contentSize = CGSize(width: self.width, height: self.height*10)
        for i in 0..<10 {
            let numberFrame = CGRectMake(0, height*CGFloat(i), width, height)
            let label = UILabel(frame: numberFrame)
            label.text = "\(numberIndex[i])"
            label.textAlignment = NSTextAlignment.Center
            label.font = font
            scrollView.addSubview(label)
        }
        scrollView.contentOffset = CGPoint(x: 0, y: height*CGFloat(numberIndex[currentNumber]))
        
        addSubview(scrollView)
    }
    
    convenience init(frame: CGRect, font: UIFont) {
        self.init(frame: frame, font: font, number: 0)
    }
    
    func scrollToNumber(number: NSInteger) {
        if number<0 || number > 10 {
            scrollToNumber(0)
            return
        }
        if number == currentNumber {
            return
        }
        currentNumber = number
        UIView.animateWithDuration(1.0, delay: 0.0, options: .CurveEaseOut,
            animations: { [weak self]() -> Void in
                guard let weakSelf = self else {return}
                weakSelf.scrollView.setContentOffset(CGPoint(x: 0, y: weakSelf.height*CGFloat(weakSelf.numberIndex[number])), animated: false)
            }, completion: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
