//
//  ConfiguracionViewController.swift
//  AudioVideoSwitcherAVS
//
//  Created by Ruben  Omar Campos Vazquez on 21/09/22.
//

import UIKit

protocol configPressedDelegate {
    func setIpPressed()
}

class ConfiguracionViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var maestrosw: UISwitch!
    @IBOutlet weak var IPultrix: UITextField!
    @IBOutlet weak var ipYAMAHA: UITextField!
    var delegate : configPressedDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        IPultrix.delegate = self
        ipYAMAHA.delegate = self
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        maestrosw.isOn = !UserDefaults.standard.bool(forKey: "maestro")
        super.viewWillAppear(animated)
        if let p = UserDefaults.standard.string(forKey: "yamaha")
        {
            ipYAMAHA.text = p
        }
        if let p = UserDefaults.standard.string(forKey: "ultrix")
        {
            IPultrix.text = p
        }
    }
    @IBAction func maestroChanged(_ sender: UISwitch) {
        UserDefaults.standard.set(!sender.isOn, forKey: "maestro")
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    @IBAction func saveAction(_ sender: UIButton) {
        if ipYAMAHA.text != "" && IPultrix.text != ""
        {
            if validateIpAddress(ipToValidate: ipYAMAHA.text!) && validateIpAddress(ipToValidate: IPultrix.text!)
            {
                UserDefaults.standard.set(ipYAMAHA.text!, forKey: "yamaha")
                UserDefaults.standard.set(IPultrix.text!, forKey: "ultrix")
                delegate?.setIpPressed()
                self.dismiss(animated: true, completion: nil)
            }
            else
            {
                self.alerta(message: "Formato no valido", title: "Error")
            }
        }
        else
        {
            self.alerta(message: "faltan datos por llenar.", title: "Error")
        }
    }
    
    func validateIpAddress(ipToValidate: String) -> Bool {

        var sin = sockaddr_in()
        var sin6 = sockaddr_in6()

        if ipToValidate.withCString({ cstring in inet_pton(AF_INET6, cstring, &sin6.sin6_addr) }) == 1 {
            // IPv6 peer.
            return true
        }
        else if ipToValidate.withCString({ cstring in inet_pton(AF_INET, cstring, &sin.sin_addr) }) == 1 {
            // IPv4 peer.
            return true
        }

        return false;
    }

}
