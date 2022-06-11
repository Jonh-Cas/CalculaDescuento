//
//  Notas.swift
//  Calculo
//
//  Created by Jonathan Casillas on 05/06/22.
//

import Foundation

/**
    Componente Label
 
 Se utiliza para poner textos en una aplicación

 
 Comandos Rapidos
 
 Para Clonar una componente en el StoryBoard se utiliza el sigueinte combinación de teclas
 Alt + arrastar el componente hacia abajo
 
 Recomendaciones
-Los contrastrains no siembre deben tener la direcion en los 4 lados a veces debe tner altura o anchura dependiendo del dispositivo
 
 Para poder hacer las funcionalidades del storyboard debe entrar al archivo de ViewCpntroller
 
 VIEWCONTROLLER
 Este archivo sirve para poner las funcionalidades de la pantalla inicial
 
 UIScreen.main.nativeBounds.height = Te da la altura en numero del dispositivo para quer puedas hacer resposivas mas las aplicaiones
 
PARA QUE SE CIERRE EL TECLADO
se le coloca a la siguiente funcion  la linea de codigo     view.endEditing(true)    con esto se cerrara el teclado presionando fuera del teclado
 
 override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
     view.endEditing(true)
 }
 
 PARA SUBIR Y BAJAR EL TECLADO EN UN DISPOSITIVO DE BAJO TAMAÑO SE COLOCA EN LA SIGUIENTE FUNCION EL NOTIFICATIONCENTER
 
Ejemplo:
 
 let sizeScreen = UIScreen.main.nativeBounds.height
 
 override func viewDidLoad() {
     super.viewDidLoad()
         
     NotificationCenter.default.addObserver(self, selector: #selector(tecladoUp), name: UIResponder.keyboardWillShowNotification, object: nil );
     
     NotificationCenter.default.addObserver(self, selector: #selector(tecladoDown), name: UIResponder.keyboardDidHideNotification, object: nil)
     
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
 
 
 PARA AGREGAR FUNCIONALIDADES BOTONES, LABELS, TEXTFIELD, ENTRE OTRAS DEBEMOS APRETAR EL BOTON ASISTANS
 Para agregar funcionalidades debemos arrastrarel campo quese le aplicara una funcion, manteniendo apretado control arrastrando al ViewController
 Ejemplo
 @IBOutlet weak var resultado: UILabel!
 @IBOutlet weak var descuento: UILabel!
 
 @IBOutlet weak var cantidad: UITextField!
 @IBOutlet weak var descCantidad: UITextField!
 
 para botones se realizan hasta abajo de la estructura
 Ejemplo de eventos de boton
 
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
 
 
 */
