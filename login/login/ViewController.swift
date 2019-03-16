//
//  ViewController.swift
//  login
//
//  Created by Alan Vargas on 3/1/19.
//  Copyright © 2019 Alan Vargas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButtonUI: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var myLabel: UILabel!
    // Clouds
    @IBOutlet weak var cloudOne: UIImageView!
    @IBOutlet weak var cloudTwo: UIImageView!
    @IBOutlet weak var cloudThree: UIImageView!
    @IBOutlet weak var cloudFour: UIImageView!
    @IBOutlet weak var baloon: UIImageView!
    
    let userLogin:String = ""
    let passwordLogin:String = ""
    let student = Student(name: "Alan", career: "ICO", nameImage: "myImage")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        userTextField.text = ""
        passwordTextField.text = ""
        
        // DESAPARECIENDO A LOS ELEMENTOS
        myLabel.frame.origin.x = view.frame.origin.x - myLabel.frame.size.width
        userTextField.frame.origin.x = view.frame.origin.x - userTextField.frame.size.width
        passwordTextField.frame.origin.x = view.frame.origin.x - passwordTextField.frame.size.width
        loginButtonUI.alpha = 0
        baloon.frame.origin.x = view.frame.origin.x - baloon.frame.size.width
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        // COMENZANDO LAS ANIMACIONES
        UIView.animate(withDuration: 4.0, delay: 0, options: [.autoreverse,.repeat], animations: {
            self.cloudOne.center.x = self.cloudOne.center.x - 100
        }, completion: nil)
        
        UIView.animate(withDuration: 2.0, delay: 0, options: [.autoreverse, .repeat], animations: {
            self.cloudTwo.center.x = self.cloudTwo.center.x + 60
        }, completion: nil)
        
        UIView.animate(withDuration: 5.0, delay: 0, options: [.autoreverse, .repeat], animations: {
            self.cloudThree.center.x = self.cloudThree.center.x - 60
        }, completion: nil)
        
        UIView.animate(withDuration: 10.0, delay: 0, options: [.autoreverse, .repeat], animations: {
            self.cloudFour.center.x = self.cloudFour.center.x + 150
        }, completion: nil)
        
        UIView.animate(withDuration: 15.0, delay: 1.0, options: [], animations: {
            self.baloon.center.x = self.baloon.center.x + 500
            self.baloon.center.y = self.baloon.center.y - 500
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5) {
            // DENTEO DEL CLOUSURE VA LA ANIMACION
            self.myLabel.center.x = self.view.center.x
        }
        UIView.animate(withDuration: 0.5, delay: 0.3, options: [], animations: {
            self.userTextField.center.x = self.view.center.x
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.5, options: [], animations: {
            self.passwordTextField.center.x = self.view.center.x
        }, completion: nil)
        
        UIView.animate(withDuration: 0.7, delay: 0.6, options: .curveEaseIn, animations: {
            self.loginButtonUI.alpha = 1.0
        }, completion: nil)
    }
    
    func setupUI(){
        // Button setup
        loginButtonUI.setTitleColor(UIColor.black, for: .normal)
        loginButtonUI.backgroundColor = UIColor.buttonsColor()
        loginButtonUI.layer.cornerRadius = 5.0 // Es el border-radious de swift
        
        // Register Button
        registerButton.setTitleColor(UIColor.white, for: .normal)
        
        // IMAGE BACKGROUND
        let imageView = UIImageView(image: UIImage(named: "bg-sunny"))
        imageView.frame = self.view.bounds
        view.insertSubview(imageView, at: 0)
        
        // LABEL
        myLabel.text = "Bienvenido"
        myLabel.textColor = UIColor.white
        
        // CLOUD IMAGES
        cloudOne.contentMode = .scaleAspectFit
        cloudTwo.contentMode = .scaleAspectFit
        cloudThree.contentMode = .scaleAspectFit
        cloudFour.contentMode = .scaleAspectFit
        baloon.contentMode = .scaleAspectFit
    }

    @IBAction func loginButton(_ sender: UIButton) {
        if userTextField.text == userLogin && passwordTextField.text == passwordLogin {
            
            // Instancia segura de un ViewController
            guard let mainStoryboard = storyboard, let profileCV = mainStoryboard.instantiateViewController(withIdentifier: "profileVC") as? ProfileViewController else { return }
            profileCV.student = student
            // Creamos un nuevo navigation controller y usamos como root al profileViewController
            let navigationController = UINavigationController(rootViewController: profileCV)
            // Navegamos hacia allà
            present(navigationController, animated: true, completion: nil)
            
            
            // Esto es lo mismo de arriba pero de manera distinta...
           /* if let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "profileVC") as? ProfileViewController {
                nextViewController.student = student
                // Creamos un nuevo navigation controller y usamos como root al profileViewController
                let newNavigationController = UINavigationController(rootViewController: nextViewController)
                // Navegamos hacia allà
                self.present(newNavigationController, animated: true, completion: nil)
            } */
            
        } else {
            let alert = UIAlertController(title: "¡Ops!", message: "Usuario o Contraseña incorrectos", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
            present(alert, animated: true, completion: {() in
                self.userTextField.text = ""
                self.passwordTextField.text = ""
            })
        }
    }
    
    // Accion para el gesto que agregamos a la vista
    @IBAction func hideKeyboard(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
}

