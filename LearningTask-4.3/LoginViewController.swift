//
//  ViewController.swift
//  LearningTask-4.3
//
//  Created by rafael.rollo on 16/02/2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    typealias MensagemDeValidacao = String
    
    @IBOutlet weak var senhaTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func loginButton(_ sender: Any) {
        
        switch loginValido() {
        case (false,let mensagemDeValidacao):
            exibirAlertaLoginButton(para: mensagemDeValidacao)
            
        default:
            logarNaSuaConta()
        }
    }
    
    @IBAction func esqueceuASenhaButton(_ sender: Any) {
        switch EsqueciASenha() {
        case (false,let mensagemDeValidacao):
            exibirAlertaEsqueceuASenhaButton(para: mensagemDeValidacao)
            
        default:
            mudarSenhaDaConta()
        }
        
    }
    
    func loginValido() -> (Bool, MensagemDeValidacao?) {
        if let email = emailTextField.text, email.isEmpty {
            return (false,"Email não pode estar em branco.")
        }
        if let senha = senhaTextField.text, senha.isEmpty {
            return (false, "Digite sua senha de acesso.")
        }
        
        return (true, nil)
    }
    
    func logarNaSuaConta() {
        //chama a lógica que cadastra, e no final o alert que deu certo...
        let alert = UIAlertController(title: "Logando", message: "Fazendo login na sua conta", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        
        self.present(alert, animated: true)
    }
    
    func exibirAlertaLoginButton(para mensagemDeValidacao: MensagemDeValidacao?) {
        let mensagem = mensagemDeValidacao ?? "Verifique os dados e tente novamente"
        
        let alert = UIAlertController(title: "Ops", message: mensagem, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        
        self.present(alert, animated: true)
    }
    
    func exibirAlertaEsqueceuASenhaButton(para mensagemDeValidacao: MensagemDeValidacao?) {
        let mensagem = mensagemDeValidacao ?? "Verifique os dados e tente novamente"
        
        let alert = UIAlertController(title: "Ops", message: mensagem, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        
        self.present(alert, animated: true)
    }
    
    func EsqueciASenha() -> (Bool, MensagemDeValidacao?) {
        
        if let email = emailTextField.text, email.isEmpty {
            return (false,"Informe seu email novamente.")
        }
        return (true, nil)
    }
    
    func mudarSenhaDaConta() {
        //chama a lógica que cadastra, e no final o alert que deu certo...
        let alert = UIAlertController(title: "Redefinir Senha", message: "Enviamos um email para \(emailTextField.text!).\nSiga as instruções para criar uma nova senha segura.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        
        self.present(alert, animated: true)
    }
}



