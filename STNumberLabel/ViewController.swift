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
        numberlabel = STNumberLabel(frame: CGRect(x: 150, y: 200, width: 200, height: 50), digit: 4, font: UIFont.systemFont(ofSize: 22.0), singleNumberSize: CGSize(width: 20, height: 50))
        numberlabel.center = CGPoint(x: view.width / 2, y: 200)
        view.addSubview(numberlabel);
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPressed(_ sender: AnyObject) {
        guard let text = textField.text, let number = Int(text) else { return }
        numberlabel.scrollToNumber(number)
    }

}

