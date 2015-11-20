//
//  UIViewExtension.swift
//  STNumberLabel
//
//  Created by DangGu on 15/11/16.
//  Copyright © 2015年 Donggu. All rights reserved.
//

import UIKit

extension UIView {
    func width() -> CGFloat {
        return CGRectGetWidth(frame)
    }
    
    func height() -> CGFloat {
        return CGRectGetHeight(frame)
    }
    
    func minX() -> CGFloat {
        return CGRectGetMinX(frame)
    }
    
    func minY() -> CGFloat {
        return CGRectGetMinY(frame)
    }
    
    func maxX() -> CGFloat {
        return CGRectGetMaxX(frame)
    }
    
    func maxY() -> CGFloat {
        return CGRectGetMaxY(frame)
    }
    
    func absoluteCenter() -> CGPoint {
        return CGPoint(x: width() / 2, y: height() / 2)
    }
}