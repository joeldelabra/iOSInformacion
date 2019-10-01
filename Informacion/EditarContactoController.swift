//
//  EditarContactoController.swift
//  Informacion
//
//  Created by Alumno on 10/1/19.
//  Copyright © 2019 Alumno. All rights reserved.
//

import Foundation
import UIKit

class EditarContactoController : UIViewController{
    
    var contacto: Contacto?
    
    
    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var txtTelefono: UITextField!
    
    override func viewDidLoad() {
        txtNombre.text = contacto!.nombre
        txtTelefono.text = contacto!.telefono
    }
    
    @IBAction func btnGuardar(_ sender: Any) {
        
    
    }
    
    
    
}
