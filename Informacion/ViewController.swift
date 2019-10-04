//
//  ViewController.swift
//  Informacion
//
//  Created by Alumno on 10/1/19.
//  Copyright © 2019 Alumno. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    var contactos : [Contacto] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contactos.append(Contacto(nombre: "Adam Cole", telefono: "644159679", direccion: "Gold St.", correo: "AdamColebaybay@gmail.com", foto: "Adam"))
        
        contactos.append(Contacto(nombre: "Rey Mysterio", telefono: "6441619619", direccion: "Booyaka Ave. 619", correo: "Booyakabooyaka@gmail.com", foto:"Rey_Mysterio"))
        
        contactos.append(Contacto(nombre: "Roderick Strong", telefono: "644159679", direccion: "North American St.", correo: "Undisputedera@gmail.com", foto:"Roderick"))
        
        contactos.append(Contacto(nombre: "Booby Fish", telefono: "644159679", direccion: "Team St.", correo: "BoobyFish@gmal.com", foto: "Foto4"))
     
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactos.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "CeldaContacto") as? CeldaContactoController
        
        celda?.imgContacto.image = UIImage(named: contactos[indexPath.row].foto!)
        celda?.lblNombre.text = contactos[indexPath.row].nombre
        celda?.lblTelefono.text = contactos[indexPath.row].telefono
        
        return celda!
    }

    @IBOutlet weak var tvContactos: UITableView!
    
    
    
    func recargarTabla(){
        tvContactos.reloadData()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoToEditar"{
        let destino =  segue.destination as? EditarContactoController
            
         destino?.contacto = contactos[tvContactos.indexPathForSelectedRow!.row]
            destino?.callbackActualizarTabla = recargarTabla
        }
        else if segue.identifier == "GoToNuevo" {
            let destino =  segue.destination as? EditarContactoController
            
            contactos.append(Contacto(nombre: "", telefono: "", direccion: "", correo: "", foto: ""))
            
           
            destino?.contacto = contactos[contactos.count-1]
            destino?.callbackActualizarTabla = recargarTabla
            
            
            
            
        }
    }
    
    @IBAction func DoTapAgregar(_ sender: Any) {
        
         contactos.append(Contacto(nombre: "Nuevo", telefono: "Nuevo telefono", direccion: "Nueva Direccion", correo: "Nuevo correo", foto: "Adam"))
        
        tvContactos.reloadData()
    }
    
}

