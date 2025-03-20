//
//  ViewController.swift
//  MyFirstCalculator
//
//  Created by yeonjin on 3/15/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstOperandField: UITextField!
    
    @IBAction func selectOperator(_ sender: Any) {
        
        let actionSheet=UIAlertController(title: nil, message: nil , preferredStyle: .actionSheet)
        
        let plusAction=UIAlertAction(title: "+ (더하기)", style: .default) { _ in
            
            self.operatorButton.setTitle("+", for: .normal)
            
        }
        actionSheet.addAction(plusAction)
        
        let minusAction=UIAlertAction(title: "-(빼기)", style: .default) { _ in
            self.operatorButton.setTitle("-", for: .normal)}
        actionSheet.addAction(minusAction)
        
        let divideAction=UIAlertAction(title: "/(나누기)", style: .default) { _ in
            self.operatorButton.setTitle("/", for: .normal)
        }
        actionSheet.addAction(divideAction)
        
        let multiplyAction=UIAlertAction(title: "*(곱하기)", style: .default) { _ in
            self.operatorButton.setTitle("*", for: .normal)
        }
        actionSheet.addAction(multiplyAction)
        
        present(actionSheet, animated: true)
        
    }
  
        
        

    @IBOutlet weak var operatorButton: UIButton!
    
    
    @IBOutlet weak var secondOperandField: UITextField!
    
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func calculator(_ sender: Any) {
       

        if let text=firstOperandField.text, let a=Int(text){
            
        }
        
        if let text=secondOperandField.text, let b=Int(text){
            
        }
        
            
        if let op=operatorButton.title(for: .normal) {}
        //op는 ? 으로 나타나 있는 operator 버튼을 연산자를 가져와서 상수에 저장해둔 것
        
        
        if let text=firstOperandField.text,let a=Int(text){
            if let text=secondOperandField.text,let b=Int(text){
                if let op=operatorButton.title(for: .normal){
                    
                    if op == "+" {
                        let result = a+b
                        resultLabel.text = "\(result)"
                    }else if op == "-" {
                        let result = a-b
                        resultLabel.text = "\(result)"
                    }else if op == "*" {
                        let result = a*b
                        resultLabel.text = "\(result)"
                    }else if op == "/" {
                        let result = a/b
                        resultLabel.text="\(result)"
                    }else {
                        print("연산자 선택")
                    }
                }
                
            }
        }
        
    
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view}
    }
}

