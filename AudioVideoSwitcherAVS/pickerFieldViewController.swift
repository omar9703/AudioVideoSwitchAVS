//
//  pickerFieldViewController.swift
//  AudioVideoSwitcherAVS
//
//  Created by Omar Campos on 03/10/22.
//

import UIKit
protocol pickerButtonDelegate
{
    func buttonSelected(row : Int, nombre : String?)
}
class pickerFieldViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var sources = [String]()
    var titulo = ""
    @IBOutlet weak var pickerTV: UIPickerView!
    var row = 0
    var delegate : pickerButtonDelegate?
    @IBOutlet weak var textBoton: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        for x in Range(1...100)
        {
            sources.append("SRC \(x)")
        }
        textBoton.text = titulo
        // Do any additional setup after loading the view.
    }
    @IBAction func acpetAction(_ sender: UIButton) {
        delegate?.buttonSelected(row: row, nombre: textBoton.text != "" ? textBoton.text!: nil)
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func cancelAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        pickerTV.selectRow(self.row, inComponent: 0, animated: false)
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       
            return sources.count

    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return sources[row]
        
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.row = row
    }
}
