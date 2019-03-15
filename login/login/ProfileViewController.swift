//
//  ProfileViewController.swift
//  login
//
//  Created by Alan Vargas on 3/1/19.
//  Copyright © 2019 Alan Vargas. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var careerLabel: UILabel!
    var student = Student()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // METODO QUE SE LLAMA AL MORIR EL VIEWCONTROLLER
    deinit {
        print("Profile ViewController muertooo")
    }
    
    func setupUI() {
        // Logout Button
        let logoutButton = UIBarButtonItem(title: "Logout", style: .plain , target: self, action: #selector(logout))
        navigationItem.rightBarButtonItem = logoutButton
        navigationItem.title = "Profile"
        
        // STUDENT
        nameLabel.text = student.name
        careerLabel.text = student.career
    }
    
    @objc func logout(){
        // CREACION DE UNA ALERTA
        let alert = UIAlertController(title: "Cerrar Sesión", message: "¿Estás seguro de querer salir?", preferredStyle: .actionSheet)
        // USO DE UN CLOUSURE
        alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler:{ (action) in
            // Se usa para salir de este view  controller
            self.dismiss(animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Cancelar", style: .destructive, handler: nil))
        present(alert, animated: true, completion: nil)
    }

}
