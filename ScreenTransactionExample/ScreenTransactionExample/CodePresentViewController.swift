//
//  CodePresentViewController.swift
//  ScreenTransactionExample
//
//  Created by 양준식 on 2021/12/28.
//

import UIKit

class CodePresentViewController: UIViewController {

    @IBOutlet var nameLabel: UIView!
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tapBackButton(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
