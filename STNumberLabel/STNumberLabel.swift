//
//  STNumberLabel.swift
//  STNumberLabel
//
//  Created by DangGu on 15/11/8.
//  Copyright © 2015年 Donggu. All rights reserved.
//

import UIKit

class STNumberLabel: UIView {
    
    private var digit: Int!
    var scrollNumberViews: [STScrollNumberView]!
    
    internal var font: UIFont!
    internal var singleNumberSize: CGSize!
    internal var containerView: UIView!
    
    init(frame: CGRect, digit: Int, font: UIFont, singleNumberSize: CGSize) {
        self.digit = digit
        self.font = font
        self.singleNumberSize = singleNumberSize
        super.init(frame: frame)
        setupScrollNumberView()

    }
    
    func scrollToNumber(number: Int) {
        let numberString = String(number)
        let newDigit = numberString.characters.count
        
        var numberArray: [Int] = []
        numberString.characters.forEach { (character) -> () in
            guard let intNumber = character.intValue() else { return }
            numberArray.append(intNumber)
        }
        
        if newDigit == digit {
            for i in 0..<scrollNumberViews.count {
                let scrollNumberView: STScrollNumberView = scrollNumberViews[i]
                scrollNumberView.scrollToNumber(numberArray[i])
            }
        }  else {
            let diff = newDigit - digit
            let translate = CGFloat(diff) * (singleNumberSize!.width / 2)
            
            UIView.animateWithDuration(0.33, animations: { [unowned self]() -> Void in
                self.containerView!.center = CGPoint(x: self.containerView!.center.x + translate, y: self.containerView!.center.y)
                }, completion: { (finished) -> Void in
                    if finished {
                        self.constructNewContainerView(newDigit: newDigit, diff: diff, numberArray: numberArray)
                    }
            })
        }
        
    }
    
    // MARK: - helper
    private func setupScrollNumberView() {
        let containerViewFrame = CGRect(origin: CGPointZero, size: CGSize(width: CGFloat(digit) * singleNumberSize.width, height: singleNumberSize.height))
        containerView = UIView(frame: containerViewFrame)
        containerView.center = absoluteCenter
        
        scrollNumberViews = []
        for i in 0..<digit {
            let numberFrame = CGRect(x: CGFloat(i)*singleNumberSize.width, y: 0, width: singleNumberSize.width, height: singleNumberSize.height)
            let scrollNumberView = STScrollNumberView(frame: numberFrame, font: font)
            scrollNumberViews.append(scrollNumberView)
            containerView.addSubview(scrollNumberView)
        }
        
        addSubview(containerView)
    }
    
    private func constructNewContainerView(newDigit newDigit: Int, diff: Int, numberArray: [Int]) {
        let newContainerViewFrame = CGRect(origin: CGPointZero, size: CGSize(width: CGFloat(newDigit) * singleNumberSize.width, height: singleNumberSize.height))
        let newContainerView = UIView(frame: newContainerViewFrame)
        newContainerView.center = absoluteCenter
        newContainerView.alpha = 0.0
        
        var newSrollNumberView: [STScrollNumberView] = []
        
        if diff > 0 {
            for i in 0..<diff {
                let numberFrame = CGRectMake(CGFloat(i)*singleNumberSize.width, 0, singleNumberSize.width, singleNumberSize.height)
                let scrollNumberView = STScrollNumberView(frame: numberFrame, font: font)
                newSrollNumberView.append(scrollNumberView)
                newContainerView.addSubview(scrollNumberView)
            }
            
            for i in 0..<digit {
                let numberFrame = CGRectMake(CGFloat(i+diff)*singleNumberSize.width, 0, singleNumberSize.width, singleNumberSize.height)
                let scrollNumberView = scrollNumberViews[i].deepCopy()
                scrollNumberView.frame = numberFrame
                newSrollNumberView.append(scrollNumberView)
                newContainerView.addSubview(scrollNumberView)
            }
        } else {
            for i in -diff..<digit {
                let numberFrame = CGRectMake(CGFloat(i+diff)*singleNumberSize.width, 0, singleNumberSize.width, singleNumberSize.height)
                let scrollNumberView = scrollNumberViews[i].deepCopy()
                scrollNumberView.frame = numberFrame
                newSrollNumberView.append(scrollNumberView)
                newContainerView.addSubview(scrollNumberView)
            }
        }

        
        addSubview(newContainerView)
        
        UIView.animateWithDuration(0.5, delay: 0.0, options: .CurveLinear, animations: { [unowned self]() -> Void in
            newContainerView.alpha = 1.0
            self.containerView.alpha = 0.0
            }) { [unowned self](finished) -> Void in
                self.containerView.removeFromSuperview()
                self.containerView = newContainerView
                self.scrollNumberViews = newSrollNumberView
                self.digit = newDigit
                
                for i in 0..<self.scrollNumberViews.count {
                    let scrollNumberView: STScrollNumberView = self.scrollNumberViews[i]
                    scrollNumberView.scrollToNumber(numberArray[i])
                }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
