//
//  ProfileViewController.swift
//  login
//
//  Created by Alan Vargas on 3/1/19.
//  Copyright © 2019 Alan Vargas. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UINavigationControllerDelegate {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var careerLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
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
        navigationItem.title = "Profile"
        
        // Logout Button
        let logoutButton = UIBarButtonItem(title: "Logout", style: .plain , target: self, action: #selector(logout))
        navigationItem.rightBarButtonItem = logoutButton
        
        let photoButton = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(addingPhoto))
        navigationItem.leftBarButtonItem = photoButton
    
        // STUDENT
        nameLabel.text = student.name
        careerLabel.text = student.career
    }
    
    @objc func addingPhoto() {
        let pickerController = UIImagePickerController()
        pickerController.allowsEditing = true
        // Para el uso de los protocolos Delegate
        pickerController.delegate = self
        
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Cámara", style: .default, handler: { (action) in
            // Necesitamos agregar permisos para acceder a la cámara
            pickerController.sourceType = .camera
            self.present(pickerController, animated: true, completion: nil)
        }))
        actionSheet.addAction(UIAlertAction(title: "Biblioteca", style: .default, handler: { (action) in
           pickerController.sourceType = .photoLibrary
            self.present(pickerController, animated: true, completion: nil)
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        present(actionSheet, animated: true, completion: nil)
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

extension ProfileViewController: UIImagePickerControllerDelegate {
    // Funcion para cuando elegimos la foto
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let imageGuard = info[.editedImage] as? UIImage else {return}
        imageView.image = imageGuard
        picker.dismiss(animated: true, completion: nil)
    }
    
    // Funcion para cuando oprimimos cancel
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
