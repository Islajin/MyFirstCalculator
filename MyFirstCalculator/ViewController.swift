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
            firstOperandField.becomeFirstResponder()
            showAlert(message : "값을 입력해주세요.")
            //경고창을 표시한 후에 firstResponder을 호출하면 경고창이 그 전의 리스폰더를 기억해 두기 때문에 경고창 앞에 선언해야 한다.
            return}
        
        guard let text=secondOperandField.text, let b=Int(text) else {
            secondOperandField.becomeFirstResponder( )
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
        
        if firstOperandField.isFirstResponder {
            firstOperandField.resignFirstResponder( )
        }

        if secondOperandField.isFirstResponder {
            secondOperandField.resignFirstResponder( )
        }
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstOperandField.delegate = self
        // Do any additional setup after loading the view}
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        firstOperandField.becomeFirstResponder()
    }
}


extension ViewController : UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard !string.isEmpty else {
            return true
        }
        
        guard let _ = Int(string) else {return false}
        
        return true
    }
    
    
}
