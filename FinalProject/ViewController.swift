//
//  ViewController.swift
//  FinalProject
//
//  Created by Rolando Galvez on 3/13/25.
//

import UIKit
class ViewController: UIViewController {
    let employeesPin = ["1234","9876"]
    let adminPin = "0000"
    
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var confirmButton: UIButton!
    
    
    @IBOutlet weak var mainStack: UIStackView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.isSecureTextEntry = true
        
    }
    override func viewDidAppear(_ animated: Bool) {
        textField.text = ""

    }

    
    @IBAction func confirmTap(_ sender: Any) {
        let curIn = textField.text!
        if(curIn == adminPin || employeesPin.contains(curIn)){
            if let tabViewController = storyboard?.instantiateViewController(withIdentifier: "tabBarView") as? UITabBarController {
                CurSession.curSesh.curPIN = curIn
                let tabs = tabViewController.viewControllers!
                if curIn != adminPin{
                    tabViewController.viewControllers =
                    [tabs[0], tabs[1]]
                }
                else{
                    tabViewController.viewControllers = tabs
                }
                
                tabViewController.modalPresentationStyle = .fullScreen
                present(tabViewController,animated: true , completion: nil)
            }
            
        }
        else{
            let alertController = UIAlertController(title: "Error", message: "Invalid Pin", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            present(alertController, animated: true)
        }
    }
    
    
    
    
}

