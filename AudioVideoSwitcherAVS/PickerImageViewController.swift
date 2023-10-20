//
//  PickerImageViewController.swift
//  AudioVideoSwitcherAVS
//
//  Created by Ruben  Omar Campos Vazquez on 10/09/22.
//

import UIKit
import SocketSwift
protocol channelSetDelegate {
    func channelSelected(channelRow : Int, channelName : String, imagenURL : String, data : Data?)
}

class PickerImageViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource,  UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @IBOutlet weak var nombreField: UITextField!
    var imagePicker = UIImagePickerController()
    var channels = [String]()
    var delegate : channelSetDelegate?
    var row = 0
    var imagen = ""
    var imagenData : Data?
    var nombreCustom = ""
    @IBOutlet weak var imageCanal: UIImageView!
    @IBOutlet weak var pickerCanal: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        for x in Range(1...64)
        {
            channels.append("Canal \(x)")
        }
        pickerCanal.selectRow(row, inComponent: 0, animated: true)
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let imagenData = imagenData {
            imageCanal.image = UIImage(data: imagenData)
        }
    }
    @IBAction func closeAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       if nombreCustom != ""
        {
           nombreField.text = nombreCustom
       }
        if let ip = UserDefaults.standard.string(forKey: "yamaha")
        {
            DispatchQueue.global(qos: .utility).async {
                do
                {
                    let client = try Socket(.inet, type: .stream, protocol: .tcp)
                    try client.connect(port: 49280, address: ip)
                    var cont = 0
                    if try client.wait(for: .write, timeout: 2, retryOnInterrupt: true)
                    {
                        while cont < 64 {
                            var message = ([UInt8])("get MIXER:Current/InCh/Label/Name \(cont) 0  \n".utf8)
                            try client.write(message)
                            var buffer = [UInt8](repeating: 0, count: 58)
                            let v = try client.read(&buffer, size: 58)
                            if let response = String(bytes: buffer, encoding: .utf8)
                            {
                                debugPrint("get MIXER:Current/InCh/Label/Name \(cont) 0 ")
                                
                                debugPrint(response, response.slice(from: "\"", to: "\""))
                                if response.components(separatedBy: " ").count > 3
                                {
                                    debugPrint(Int(response.components(separatedBy: " ")[3]),"indice")
                                    if response.components(separatedBy: " ")[0].contains(where: {$0 == "K"})
                                    {
                                        debugPrint("OK")
                                        if let indice = Int(response.components(separatedBy: " ")[3])
                                        {
                                            
                                            if self.channels.count > cont
                                            {
                                                self.channels[indice] = response.slice(from: "\"", to: "\"")?.replacingOccurrences(of: "\"", with: "") ?? ""
                                            }
                                            else
                                            {
                                                self.channels.append(response.slice(from: "\"", to: "\"")?.replacingOccurrences(of: "\"", with: "") ?? "")
                                            }
                                            
                                        }
                                    }
                                    else if response.components(separatedBy: " ")[0].contains(where: {$0 == "g"})
                                    {
                                        if let indice = Int(response.components(separatedBy: " ")[2])
                                        {
                                            
                                            if self.channels.count > cont
                                            {
                                                self.channels[indice] = response.slice(from: "\"", to: "\"")?.replacingOccurrences(of: "\"", with: "") ?? ""
                                            }
                                            else
                                            {
                                                self.channels.append(response.slice(from: "\"", to: "\"")?.replacingOccurrences(of: "\"", with: "") ?? "")
                                            }
                                            
                                        }
                                    }
                                    else
                                    {
                                        if let indice = Int(response.components(separatedBy: " ")[1])
                                        {
                                            
                                            if self.channels.count > cont
                                            {
                                                self.channels[indice] = response.slice(from: "\"", to: "\"")?.replacingOccurrences(of: "\"", with: "") ?? ""
                                            }
                                            else
                                            {
                                                self.channels.append(response.slice(from: "\"", to: "\"")?.replacingOccurrences(of: "\"", with: "") ?? "")
                                            }
                                            
                                        }
                                    }
                                    
                                }
                                
                            }

                            cont = cont + 1
                        }
                        
                        
                        debugPrint("21",self.channels)
                        DispatchQueue.main.async {
                            for (x,y) in self.channels.enumerated()
                            {
                                if y == ""
                                {
                                    self.channels[x] = "Canal \(x + 1)"
                                }
                            }
                            self.pickerCanal.reloadAllComponents()
                        }
                    }
                    client.close()
                }
                catch
                {
                    debugPrint(error)
                    
                }
            }
        }
        else
        {
            self.alerta(message: "Falta la ip Yamaha", title: "Error")
        }
    }
    @IBAction func aceptAction(_ sender: UIButton) {
        if nombreField.text == ""
        {
            delegate?.channelSelected(channelRow: row, channelName: channels[row], imagenURL: imagen, data: imagenData)
        }
        else
        {
            delegate?.channelSelected(channelRow: row, channelName: nombreField.text ?? "channel \(row + 1)", imagenURL: imagen, data: imagenData)
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectImage(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            print("Button capture")
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return channels.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return channels[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.row = row
    }
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo:  [NSObject: AnyObject] ){
        imageCanal.image = image
//        self.dismiss(animated: true, completion: { () -> Void in
//
//        })
        
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else {
                    fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        if let url = info[.imageURL]
        {
            debugPrint((url as! URL).absoluteString)
//            let fileUrl = URL(fileURLWithPath: url as! String)
            do
            {
                let imageData = try Data(contentsOf: url as! URL)
                imageCanal.image = UIImage(data: imageData)
                imagen = (url as! URL).absoluteString
                self.imagenData = imageData
            }
            catch
            {
                debugPrint(error)
            }
            
        }
//        imageCanal.image = image
        
        picker.dismiss(animated: true, completion: nil)
    }
}
