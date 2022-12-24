//
//  PickerDestinyViewController.swift
//  AudioVideoSwitcherAVS
//
//  Created by Ruben  Omar Campos Vazquez on 10/09/22.
//

import UIKit
import SocketSwift
protocol pickerTvDelegate
{
    func tvSelected(row : Int, isDestiny : pickerType, nombre : String)
}

enum pickerType  {
    case destiny
    case source
    case Mixer
}

class PickerDestinyViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if isDestiny == .destiny
        {
            return destinies.count
        }
        else if isDestiny == .source
        {
            return sources.count
        }
        else
        {
            return mixes.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if isDestiny == .destiny
        {
            return destinies[row]
        }
        else if isDestiny == .source
        {
            return sources[row]
        }
        else
        {
            return mixes[row]
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.row = row
    }
    
    var destinies = [String]()
    var sources = [String]()
    var mixes = [String]()
    var row = 0
    var isDestiny : pickerType?
    @IBOutlet weak var pickerTV: UIPickerView!
    var delegate : pickerTvDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        if isDestiny == .destiny
        {
            for x in Range(1...144)
            {
                destinies.append("Destination \(x)")
            }
        }
        else if isDestiny == .source
        {
            for x in Range(1...100)
            {
                sources.append("SRC \(x)")
            }
        }
        else
        {
            for x in Range(1...32)
            {
                mixes.append("Mix \(x)")
            }
        }
        pickerTV.selectRow(self.row, inComponent: 0, animated: false)
    }
    @IBAction func closeAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func AceptAction(_ sender: UIButton) {
        if isDestiny == .Mixer
        {
        delegate?.tvSelected(row: row, isDestiny: isDestiny!,nombre: mixes[row] )
        }
        else if isDestiny == .destiny
        {
            delegate?.tvSelected(row: row, isDestiny: isDestiny!,nombre: destinies[row] )
        }
        else if isDestiny == .source
        {
            delegate?.tvSelected(row: row, isDestiny: isDestiny!,nombre: sources[row] )
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if isDestiny == .Mixer
        {
            
//            pickerTV.reloadAllComponents()
            DispatchQueue.global(qos: .utility).async {
                if let ipYamaha = UserDefaults.standard.string(forKey: "yamaha")
                {
                do
                {
                    
                    let client = try Socket(.inet, type: .stream, protocol: .tcp)
                    try client.connect(port: 49280, address: ipYamaha)
                    var cont = 0
                   if try client.wait(for: .write, timeout: 2, retryOnInterrupt: true)
                    {
                       while cont < 16 {
                           let message = ([UInt8])("get MIXER:Current/Mix/Label/Name \(cont) 0  \n".utf8)
                           try client.write(message)
                           //                        debugPrint(message)
                           var buffer = [UInt8](repeating: 0, count: 48)
                           let v = try client.read(&buffer, size: 50)
                           if let response = String(bytes: buffer, encoding: .utf8)
                           {
                               debugPrint(response, response.slice(from: "\"", to: "\n"))
                               if self.mixes.count > cont
                               {
                                   self.mixes[cont] = response.slice(from: "\"", to: "\n")?.replacingOccurrences(of: "\"", with: "") ?? "Mix \(cont + 1)"
                               }
                               else
                               {
                                   self.mixes.append(response.slice(from: "\"", to: "\n")?.replacingOccurrences(of: "\"", with: "") ?? "Mix \(cont + 1)")
                               }
                               
                           }
                           cont = cont + 1
                       }
                       DispatchQueue.main.async {
                           self.pickerTV.reloadAllComponents()
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
        }
    }
    
}


extension String {
    
    func slice(from: String, to: String) -> String? {
        return (range(of: from)?.upperBound).flatMap { substringFrom in
            (range(of: to, range: substringFrom..<endIndex)?.lowerBound).map { substringTo in
                String(self[substringFrom..<substringTo])
            }
        }
    }
}
