//
//  ViewController.swift
//  Calculo
//
//  Created by Jonathan Casillas on 05/06/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var resultado: UILabel!
    @IBOutlet weak var descuento: UILabel!
    
    @IBOutlet weak var cantidad: UITextField!
    @IBOutlet weak var descCantidad: UITextField!
    
    let sizeScreen = UIScreen.main.nativeBounds.height

    override func viewDidLoad() {
        super.viewDidLoad()
            
        NotificationCenter.default.addObserver(self, selector: #selector(tecladoUp), name: UIResponder.keyboardWillShowNotification, object: nil );
        
        NotificationCenter.default.addObserver(self, selector: #selector(tecladoDown), name: UIResponder.keyboardDidHideNotification, object: nil)
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @objc func tecladoUp(){
        
        if sizeScreen <= 1136 {
            
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y = -50
            }
        }
    }
    
    @objc func tecladoDown(){
        
        if sizeScreen <= 1136{
            
            if self.view.frame.origin.y != 0 {
                self.view.frame.origin.y = 0
            }
        }
    }
    
    
    @IBAction func calcular(_ sender: UIButton) {
        guard let cantidadtxt = cantidad.text else { return }
        guard let descuentotxt = descCantidad.text else { return  }
        
        let cant = (cantidadtxt as NSString ).floatValue
        let desc = (descuentotxt as NSString ).floatValue
        
        let operacion = cant * desc/100
        let res = cant - operacion
        
        resultado.text = "$\(res)"
        descuento.text = "$\(operacion)"
        self.view.endEditing(true)
        
    }
    
    @IBAction func limpiar(_ sender: Any) {
            
        cantidad.text = ""
        descCantidad.text = ""
        
        resultado.text = "$0.00"
        descuento.text = "$0.00"
    }
    
}

