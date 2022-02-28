//
//  ViewController.swift
//  ScreenTransactionExample
//
//  Created by 양준식 on 2021/12/27.
//

import UIKit

class ViewController: UIViewController, SendDataDelegate {

    
    @IBOutlet weak var nameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad() function call")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear() function call")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear() function call")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear() function call")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear() func call")
    }
    
    
    @IBAction func tapCodePresentButton(_ sender: UIButton) {
        // 인스턴스화 + 다운캐스팅
        guard let viewController = self.storyboard?.instantiateViewController(identifier: "CodePresentViewController") as? CodePresentViewController else { return }
        viewController.modalPresentationStyle = .fullScreen
        //데이터 넘겨주기
        viewController.name = "yang"
        // 권한 위임 !! 이 설정을 해줘야 데이터를 받아올 수 있다.
        viewController.delegate = self
        self.present(viewController, animated: true, completion: nil)
    }
    
    @IBAction func tapCodePushButton(_ sender: UIButton) {
        //storyBoard상의 뷰 컨트롤러를 인스턴스화 + 다운캐스팅 ===> 명시적으로 형 변환 
        guard let viewController = self.storyboard?.instantiateViewController(identifier: "CodePushViewController") as? CodePushViewController else { return }
        //데이터 넘겨주기
        viewController.name = "yyyang"
        //값을 다시 받아오기 위해 권한 위임 
        viewController.delegate2 = self
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    //SegueWay 방식으로 화면을 넘길 때, 데이터를 다시 받아오는 방식
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? SeguePushViewController {
            viewController.name = "YJS"
        }
    }
    
    func sendData(name: String) {
        self.nameLabel.text = name
        self.nameLabel.sizeToFit()
    }
    
}

