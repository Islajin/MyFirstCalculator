//
//  ViewController.swift
//  MyFirstCalculator
//
//  Created by yeonjin on 3/15/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstOperandField: UITextField!
    
    @IBOutlet weak var secondOperandField: UITextField!
    
    var selectedOperator: Operator?
    
    func showAlert(message : String, title: String = "알림") {
        let alert=UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction=UIAlertAction(title: title, style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
        
    }
    
    @IBAction func selectOperator(_ sender: Any) {
        
        let actionSheet=UIAlertController(title: nil, message: nil , preferredStyle: .actionSheet)
        
        let plusAction=UIAlertAction(title: "+ (더하기)", style: .default) { _ in
            
            self.selectedOperator = .plus
            self.operatorButton.setTitle("+", for: .normal)
            
        }
        actionSheet.addAction(plusAction)
        
        let minusAction=UIAlertAction(title: "-(빼기)", style: .default) { _ in
            self.selectedOperator = .minus
            self.operatorButton.setTitle("-", for: .normal)}
        
        actionSheet.addAction(minusAction)
        
        let divideAction=UIAlertAction(title: "/(나누기)", style: .default) { _ in
            self.selectedOperator = .divide
            self.operatorButton.setTitle("/", for: .normal)
    
        }
        actionSheet.addAction(divideAction)
        
        let multiplyAction=UIAlertAction(title: "*(곱하기)", style: .default) { _ in
            self.selectedOperator = .multiply
            self.operatorButton.setTitle("*", for: .normal)
        }
        actionSheet.addAction(multiplyAction)
        
        present(actionSheet, animated: true)
        
    }
  
        

    @IBOutlet weak var operatorButton: UIButton!
    

    
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func calculator(_ sender: Any) {
    
        //it let과 gurad let 이 다른 이유는 guard문 사용시 스코프가 guard문 내에 한정되지 않기때문임
        
        guard let text=firstOperandField.text, let a=Int(text) else {
           showAlert(message : "값을 입력해주세요.")
            
            return}
        
        guard let text=secondOperandField.text, let b=Int(text) else {
            showAlert(message : "값을 입력해주세요.")
            return}
        
        guard let op=selectedOperator else {
            showAlert(message : "연산자를 선택해주세요.")
            return
        }
        
        
        var result: Int? = nil
        //result를 옵셔널 Int상수로 선언
        switch op {
        case .plus:
            result = a+b
        case .minus:
            result = a-b
        case .multiply:
            result = a*b
        case .divide:
            result=a/b
        }
        
        //result가 옵셔널이 아니면 resultLabel.text= "\(result)"
        
        guard let result else {
            return
        }
        resultLabel.text = "\(result)"
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view}
    }
}

