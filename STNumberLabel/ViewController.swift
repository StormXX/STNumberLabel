//
//  ViewController.swift
//  STNumberLabel
//
//  Created by DangGu on 15/11/7.
//  Copyright © 2015年 Donggu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberlabel: STNumberLabel!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberlabel = STNumberLabel(frame: CGRectMake(150, 200, 200, 50), digit: 4, font: UIFont.systemFontOfSize(22.0), singleNumberSize: CGSize(width: 20, height: 50))
        numberlabel.center = CGPoint(x: view.frame.width / 2, y: 200)
        view.addSubview(numberlabel);
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPressed(sender: AnyObject) {
        guard let text = textField.text, number = Int(text) else { return }
        numberlabel.scrollToNumber(number)
    }

}

