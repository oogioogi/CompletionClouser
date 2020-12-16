//
//  ViewController.swift
//  CompletionClouser
//
//  Created by 이용석 on 2020/12/02.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    var token: NSObjectProtocol!
    
    deinit {
        if let token = token {
            NotificationCenter.default.removeObserver(self, name: PopUpViewController.NotificationCenterName, object: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        token = NotificationCenter.default.addObserver(forName: PopUpViewController.NotificationCenterName, object: nil
                                                       , queue: OperationQueue.main, using: { [weak self](noti) in
                                                        self?.label.text = "noti"
                                                        self?.dismiss(animated: true, completion: nil)
                                                       })
    }
    
    @IBAction func PopUpOpen(_ sender: UIButton) {
        //스토리 보드를 가져온다
        let storyBoard = UIStoryboard.init(name: "popUpView", bundle: nil)
        let popUpVC = storyBoard.instantiateViewController(identifier: "alertView") as? PopUpViewController
        //   사라지는 스타일
        popUpVC?.modalTransitionStyle = .crossDissolve
        //popUpVC?.modalTransitionStyle = .coverVertical
        //popUpVC?.modalTransitionStyle = .flipHorizontal
        //popUpVC?.modalTransitionStyle = .partialCurl
        //.  보여지는 스타일
        popUpVC?.modalPresentationStyle = .overCurrentContext
        
        // 함수 구현
        popUpVC?.completionClosure = { (action) in
            print("\(action)")
            self.label.text = action
        }
           
        popUpVC?.myprotocol = self
        self.present(popUpVC!, animated: true, completion: nil)
        
    }
    
}

extension ViewController: ProtocolDelegate {
    func protocolaction(_ string: String) {
        self.label.text = string
    }
    
}
    
    

/*
 let imageDataDict:[String: UIImage] = ["image": image]

   // post a notification
   NotificationCenter.default.post(name: NSNotification.Name(rawValue: "notificationName"), object: nil, userInfo: imageDataDict)
   // `default` is now a property, not a method call

  // Register to receive notification in your class
  NotificationCenter.default.addObserver(self, selector: #selector(self.showSpinningWheel(_:)), name: NSNotification.Name(rawValue: "notificationName"), object: nil)

  // handle notification
  @objc func showSpinningWheel(_ notification: NSNotification) {
         print(notification.userInfo ?? "")
         if let dict = notification.userInfo as NSDictionary? {
             if let id = dict["image"] as? UIImage{
                 // do something with your image
             }
         }
  }
 */
