//
//  PopUpViewController.swift
//  CompletionClouser
//
//  Created by 이용석 on 2020/12/02.
//

import UIKit

class PopUpViewController: UIViewController {

    @IBOutlet var popUpView: UIView!
    
    // 함수형 변수 : 인자를 가지고 함수를 델리 게이트 한다
    var completionClosure: ((String)->Void)?
    
    var myprotocol: ProtocolDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func protocolBtnClicked(_ sender: UIButton) {
        
        myprotocol?.protocolaction("Hello Protocol")
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func NotificationCenterAction(_ sender: UIButton) {
        NotificationCenter.default.post(name: PopUpViewController.NotificationCenterName, object: nil, userInfo: nil)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func dismissClosureAction (sender: UIButton) {
        
        if let completionClosure = completionClosure {
            completionClosure("Hello")
        }
        
        self.dismiss(animated: true, completion: nil)
    }

}
extension PopUpViewController {
    static let NotificationCenterName = Notification.Name(rawValue: "NotificationCenterName")
}
