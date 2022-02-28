//
//  CodePresentViewController.swift
//  ScreenTransactionExample
//
//  Created by 양준식 on 2021/12/28.
//

import UIKit

protocol SendDataDelegate: AnyObject {
    func sendData(name: String)
    
}
class CodePresentViewController: UIViewController {


    @IBOutlet weak var nameLabel: UILabel!
    var name: String?
    //delegate는 weak 해줘야한다!
    weak var delegate: SendDataDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let name = name {
            self.nameLabel.text = name
            self.nameLabel.sizeToFit()
        }
    }

    @IBAction func tapBackButton(_ sender: UIButton) {
        self.delegate?.sendData(name: "YangJS")
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
