//
//  CodePushViewController.swift
//  ScreenTransactionExample
//
//  Created by 양준식 on 2021/12/28.
//

import UIKit


class CodePushViewController: UIViewController {


    @IBOutlet weak var nameLabel: UILabel!
    var name: String?
    //delegate는 weak 해줘야한다!
    weak var delegate2: SendDataDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("CodePush UIViewCtrler viewDidLoad() function call")
        if let name = name {
            self.nameLabel.text = name
            self.nameLabel.sizeToFit()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("CodePush UIViewCtrler viewWillAppear() function call")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("CodePush UIViewCtrler viewDidAppear() function call")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("CodePush UIViewCtrler viewWillDisappear() function call")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("CodePush UIViewCtrler viewDidDisappear() func call")
    }

    @IBAction func tapBackButton(_ sender: UIButton) {
        self.delegate2?.sendData(name: "YangJ")
        self.navigationController?.popViewController(animated:true)
    }
}
