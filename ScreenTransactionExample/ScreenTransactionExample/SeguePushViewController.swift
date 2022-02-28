//
//  SeguePushViewController.swift
//  ScreenTransactionExample
//
//  Created by 양준식 on 2021/12/28.
//

import UIKit

class SeguePushViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    var name: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("SegueWay ViewController viewDidLoad() function call")
        //전달받은 내용을 nameLabel에 표시
        if let name = name {
            self.nameLabel.text = name
            self.nameLabel.sizeToFit()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("SegueWay ViewController viewWillAppear() function call")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("SegueWay ViewController viewDidAppear() function call")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("SegueWay ViewController viewWillDisappear() function call")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("SegueWay ViewController viewDidDisappear() func call")
    }
    
    
    @IBAction func tapBackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    
  

}
