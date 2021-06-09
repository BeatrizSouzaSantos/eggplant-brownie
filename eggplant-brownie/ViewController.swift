//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by user on 09/06/21.
//

import UIKit

class ViewController: UIViewController {
    
   @IBOutlet var nomeTextField: UITextField!
    @IBOutlet var felicidadeTextField: UITextField!
    
//Nenhum elemento está linkado na storyboard

    @IBAction func Adicionar(_ sender: Any) {
        let nome = nomeTextField.text
        let felicidade = felicidadeTextField.text
        
        print ("comi \(nome) e fiquei com felicidade \(felicidade)")
        
        
            
        }
    }
    
