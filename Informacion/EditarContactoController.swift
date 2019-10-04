import Foundation
import UIKit

class EditarContactoController : UIViewController{
    
    var callbackActualizarTabla: (()-> Void)?
    var contacto: Contacto?
    
    
    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var txtTelefono: UITextField!
    
    override func viewDidLoad() {
        txtNombre.text = contacto!.nombre
        txtTelefono.text = contacto!.telefono
    }
    
    @IBAction func btnGuardar(_ sender: Any) {
        contacto?.nombre = txtNombre.text
        contacto?.telefono = txtTelefono.text
        callbackActualizarTabla!()
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    
    
}
