//
//  ViewController.swift
//  AudioVideoSwitcherAVS
//
//  Created by Ruben  Omar Campos Vazquez on 07/09/22.
//

import UIKit
import SocketSwift
class ViewController: UIViewController {
    @IBOutlet weak var configIpButton: UIButton!
    @IBOutlet weak var canal14: UIView!
    @IBOutlet weak var canal13: UIView!
    @IBOutlet weak var canal12: UIView!
    @IBOutlet weak var canal11: UIView!
    @IBOutlet weak var canal10: UIView!
    @IBOutlet weak var canal7: UIView!
    @IBOutlet weak var sliderView: UISlider!
    @IBOutlet weak var canal6: UIView!
    @IBOutlet weak var canal5: UIView!
    @IBOutlet weak var canal4: UIView!
    @IBOutlet weak var canal3: UIView!
    @IBOutlet weak var canal8: UIView!
    @IBOutlet weak var camaraAction1: UIButton!
    @IBOutlet weak var camara2: UIButton!
    @IBOutlet weak var camara3: UIButton!
    @IBOutlet weak var canal1: UIView!
    @IBOutlet weak var canal2: UIView!
    @IBOutlet weak var canal9: UIView!
    @IBOutlet weak var canal15: UIView!
    @IBOutlet weak var canal16: UIView!
    @IBOutlet weak var canal17: UIView!
    @IBOutlet weak var canal18: UIView!
    @IBOutlet weak var canal19: UIView!
    @IBOutlet weak var canal20: UIView!
    @IBOutlet weak var LabelTV: UILabel!
    @IBOutlet weak var mixLabel: UILabel!
    @IBOutlet var myButtons: [UIButton]!
    @IBOutlet weak var configLabel: UILabel!
    @IBOutlet weak var configSwitch: UISwitch!
    @IBOutlet var channelsLabel : [UILabel]!
    @IBOutlet var channelsImages : [UIImageView]!
    @IBOutlet var SoloButtons : [UIButton]!
    var tvRow = 0
    var selectedChannels = [false, false, false, false,false,false,false,false,false, false, false, false,false,false,false,false, false, false, false,false]
    var SelectedChannelsIds = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19]
    var selctedSoloIds = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19]
    var selectedUltrixIds = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49]
    var selectedCamara = [false]
    var selectedSolo = [false, false, false, false,false,false,false,false,false, false, false, false,false,false,false,false, false, false, false,false]
    var buttonsTV = [UIButton]()
    var buttonsetting : UIButton?
    var ChannelSetting : UIView?
    var isModeConfig = false
    var volume = -16
    var ipYamaha : String?
    var ipUltrix :  String?
    override func viewDidLoad() {
        super.viewDidLoad()
        channelsLabel.forEach { x in
            x.isHidden = true
        }
        buttonsTV.append(camaraAction1)
        canal1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.canalAction(_:))))
        canal2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.canalAction(_:))))
        canal3.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.canalAction(_:))))
        canal4.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.canalAction(_:))))
        canal5.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.canalAction(_:))))
        canal6.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.canalAction(_:))))
        canal7.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.canalAction(_:))))
        canal8.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.canalAction(_:))))
        canal9.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.canalAction(_:))))
        canal10.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.canalAction(_:))))
        canal11.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.canalAction(_:))))
        canal12.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.canalAction(_:))))
        canal13.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.canalAction(_:))))
        canal14.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.canalAction(_:))))
        canal15.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.canalAction(_:))))
        canal16.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.canalAction(_:))))
        canal17.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.canalAction(_:))))
        canal18.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.canalAction(_:))))
        canal19.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.canalAction(_:))))
        canal20.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.canalAction(_:))))
        LabelTV.isUserInteractionEnabled = true
        
        
        //        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longPressed))
        //        self.canal1.addGestureRecognizer(longPressRecognizer)
        LabelTV.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.tvActionSelected(_:))))
        self.view.addGestureRecognizer(UIPinchGestureRecognizer(target: self, action: #selector(self.panGestureSettings(_:))))
        
        sliderView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.sliderGesture(_:))))
        //        stack1.frame.size.width = UIScreen.main.bounds.width * 0.66
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        ipYamaha = UserDefaults.standard.string(forKey: "yamaha")
        ipUltrix = UserDefaults.standard.string(forKey: "ultrix")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let canals = channelData.getCanales()
        {
            canals.forEach { s in
                selctedSoloIds[s.tag ?? 0] = s.canalId ?? 0
                SelectedChannelsIds[s.tag ?? 0] = s.canalId ?? 0
            }
        }
        if let nombre = UserDefaults.standard.string(forKey: "mixLabel")
        {
            mixLabel.text = nombre
            sliderView.tag = UserDefaults.standard.integer(forKey: "silderTag")
        }
        let y = UserDefaults.standard.integer(forKey: "destiny")
        self.tvRow = y
        self.LabelTV.text = "Destination \(y + 1)"
        
        if let u = UserDefaults.standard.value(forKey: "ultr") as? [Int]
        {
            debugPrint(u)
            selectedUltrixIds = u
        }
        
        
    }
    
    @objc func sliderGesture(_ sender : UITapGestureRecognizer)
    {
        if isModeConfig
        {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "pickerController") as! PickerDestinyViewController
            vc.delegate = self
            vc.row = sliderView.tag - 1
            vc.isDestiny = .Mixer
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    @objc func panGestureSettings(_ sender : UIPinchGestureRecognizer)
    {
        debugPrint("gesture")
        configLabel.isHidden = false
        configSwitch.isHidden = false
        mixLabel.isHidden = false
        mixLabel.text = "Mix \(sliderView.tag)"
    }
    
    func pingFunction()
    {
        
    }
    @IBAction func configSiwtch(_ sender: UISwitch) {
        isModeConfig = sender.isOn
        if !sender.isOn
        {
            configLabel.isHidden = true
            configSwitch.isHidden = true
            mixLabel.isHidden = true
            channelsLabel.forEach { x in
                x.isHidden = true
            }
            channelsImages.forEach { x in
                x.isHidden = false
            }
            configIpButton.isHidden = true
        }
        else
        {
            channelsImages.forEach { x in
                x.isHidden = true
            }
            channelsLabel.forEach { x in
                x.isHidden = false
            }
            configIpButton.isHidden = false
        }
    }
    @IBAction func ConfigButtonAction(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "config") as! ConfiguracionViewController
        vc.delegate = self
        self.present(vc, animated: true, completion: nil)
    }
    @objc func tvActionSelected(_ sender : UITapGestureRecognizer)
    {
        if isModeConfig
        {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "pickerController") as! PickerDestinyViewController
            vc.delegate = self
            vc.row = tvRow
            vc.isDestiny = .destiny
            self.present(vc, animated: true, completion: nil)
        }
    }
    @IBAction func camaraAction(_ sender: UIButton) {
        if !isModeConfig
        {
            //        selectedCamara[sender.tag - 1] =  true
            //        for (y,x) in selectedCamara.enumerated()
            //        {
            //            if y == sender.tag - 1
            //            {
            //                buttonsTV[y].backgroundColor = .blue
            //            }
            //            else
            //            {
            //                selectedCamara[y] = false
            //                buttonsTV[y].backgroundColor = .clear
            //            }
            //        }
            if let ipUltrix = ipUltrix {
                debugPrint(sender.tag, ipUltrix)
                for x in myButtons
                {
                    if x == sender
                    {
                        sender.backgroundColor = .blue
                    }
                    else
                    {
                        x.backgroundColor = .lightGray
                    }
                }
                debugPrint(self.selectedUltrixIds[sender.tag]+1)
                DispatchQueue.global(qos: .utility).async {
                    
                    do
                    {
                        let client = try Socket(.inet, type: .stream, protocol: .tcp)
                        try client.connect(port: 7788, address: ipUltrix)
                        //            try client.wait(for: .write, timeout: 2000)
                        let message = ([UInt8])("XPT I:1 D:\(self.tvRow + 1) S:\(self.selectedUltrixIds[sender.tag]+1) \r\n".utf8)
                        try client.write(message)
                        debugPrint("holis")
                        //            var buffer = [UInt8](repeating: 0, count: 1500)
                        //            try client.read(&buffer, size: 100)
                        client.close()
                        debugPrint("holis")
                    }
                    catch
                    {
                        debugPrint(error)
                        DispatchQueue.main.async {
                            sender.backgroundColor = .lightGray
                        }
                    }
                }
            }
            else{
                self.alerta(message: "Falta la ip del dispositivo destino.", title: "Error")
            }
        }
    }
    
    @objc func canalAction(_ sender: UITapGestureRecognizer) {
        debugPrint("holis")
        if !isModeConfig
        {
            if let ipYamaha = ipYamaha {
                debugPrint(ipYamaha,sender.view?.tag)
                var nivel = 0
                if !selectedChannels[sender.view?.tag ?? 1]
                {
                    selectedChannels[sender.view?.tag ?? 1] = true
                    nivel = 0
                    sender.view?.backgroundColor = .blue
                }
                else
                {
                    selectedChannels[sender.view?.tag ?? 1] = false
                    nivel = -32768
                    sender.view?.backgroundColor = .clear
                }
                let t = SelectedChannelsIds[sender.view?.tag ?? 0]
                debugPrint(t)
                DispatchQueue.global(qos: .utility).async {
                    do
                    {
                        let client = try Socket(.inet, type: .stream, protocol: .tcp)
                        try client.connect(port: 49280, address: ipYamaha)
                        try client.wait(for: .write, timeout: 2000)
                        let message = ([UInt8])("set MIXER:Current/InCh/Fader/Level \(t) 0 \(nivel) \n".utf8)
                        try client.write(message)
                        debugPrint("holis",t)
                        var buffer = [UInt8](repeating: 0, count: 1500)
                        try client.read(&buffer, size: 100)
                        client.close()
                    }
                    catch
                    {
                        debugPrint(error)
                        DispatchQueue.main.async {
                            sender.view!.backgroundColor = .clear
                        }
                    }
                }
            }
            else{
                self.alerta(message: "Falta la ip del dispositivo destino.", title: "Error")
            }
        }
        
    }
    @IBAction func SoloAction(_ sender: UIButton) {
        debugPrint(sender.tag)
        if !isModeConfig
        {
            if let ipYamaha = ipYamaha {
                debugPrint(ipYamaha)
                var nivel = 0
                
                if !selectedSolo[sender.tag]
                {
                    selectedSolo[sender.tag] = true
                    nivel = 0
                    sender.backgroundColor = .blue
                }
                else
                {
                    selectedSolo[sender.tag] = false
                    nivel = -32768
                    sender.backgroundColor = .lightGray
                }
                debugPrint(self.selctedSoloIds[sender.tag])
                DispatchQueue.global(qos: .utility).async {
                    do
                    {
                        let client = try Socket(.inet, type: .stream, protocol: .tcp)
                        try client.connect(port: 49280, address: ipYamaha)
                        let w = try client.wait(for: .write, timeout: 1, retryOnInterrupt: false)
                        debugPrint(w)
                        let message = ([UInt8])("set MIXER:Current/InCh/ToMix/Level \(self.selctedSoloIds[sender.tag]) \(self.sliderView.tag - 1) \(nivel) \n".utf8)
                        try client.write(message)
                        
                        debugPrint("holis")
                        var buffer = [UInt8](repeating: 0, count: 1500)
                        try client.read(&buffer, size: 100)
                        client.close()
                    }
                    catch
                    {
                        debugPrint(error)
                        DispatchQueue.main.async {
                            sender.backgroundColor = .lightGray
                        }
                    }
                }
            }
            else{
                self.alerta(message: "Falta la ip del dispositivo destino.", title: "Error")
            }
        }
    }
    @IBAction func VolumeChange(_ sender: UISlider) {
        let step: Float = 1
        let roundedValue = round(sender.value / step) * step
        sender.value = roundedValue
        var level = 0
        if Float(volume) != roundedValue
        {
            volume = Int(roundedValue)
            debugPrint(volume)
            if volume == -16
            {
                level = -32000
            }
            else if volume == -15
            {
                level = -6000
            }
            else if volume == -14
            {
                level = -5500
            }
            else if volume == -13
            {
                level = -5000
            }
            else if volume == -12
            {
                level = -4500
            }
            else if volume == -11
            {
                level = -4000
            }
            else if volume == -10
            {
                level = -3500
            }
            else if volume == -9
            {
                level = -3000
            }
            else if volume == -8
            {
                level = -2500
            }
            else if volume == -7
            {
                level = -2000
            }
            else if volume == -6
            {
                level = -1500
            }
            else if volume == -5
            {
                level = -1000
            }
            else if volume == -4
            {
                level = -500
            }
            else if volume == -3
            {
                level = 0
            }
            else if volume == -2
            {
                level = 300
            }
            else if volume == -1
            {
                level = 500
            }
            else if volume == 0
            {
                level = 700
            }
            else if volume == 1
            {
                level = 1000
            }
            if !isModeConfig
            {
                if let ipYamaha = ipYamaha {
                    debugPrint(ipYamaha)
                    DispatchQueue.global(qos: .utility).async {
                        do
                        {
                            let client = try Socket(.inet, type: .stream, protocol: .tcp)
                            try client.connect(port: 49280, address: ipYamaha)
                            try client.wait(for: .write, timeout: 2)
                            let message = ([UInt8])("set MIXER:Current/Mix/Fader/Level \(sender.tag - 1) 0 \(level) \n".utf8)
                            try client.write(message)
                            debugPrint("holis")
                            var buffer = [UInt8](repeating: 0, count: 1500)
                            try client.read(&buffer, size: 100)
                            client.close()
                        }
                        catch
                        {
                            debugPrint(error)
                        }
                    }
                }
                else{
                    self.alerta(message: "Falta la ip del dispositivo destino.", title: "Error")
                }
                
            }
        }
    }
    
}

extension UIViewController
{
    func alerta(message: String, title: String = "") {
      let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
      let OKAction = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
      alertController.addAction(OKAction)
      self.present(alertController, animated: true, completion: nil)
    }
}

extension ViewController: pickerTvDelegate, SourceActionDelegate, ImageActionDelegate, channelSetDelegate, configPressedDelegate
{
    func setIpPressed() {
        ipYamaha = UserDefaults.standard.string(forKey: "yamaha")
        ipUltrix = UserDefaults.standard.string(forKey: "ultrix")
    }
    //este delegado es para setear el canal de audio
    func channelSelected(channelRow: Int, channelName: String, imagenURL : String, data : Data?) {
        var id = 0
        var t = 0
        var n = channelName
        for x in ChannelSetting!.superview!.subviews
        {
            if !x.isKind(of: CanalButtonView.self)
            {
                debugPrint(x.subviews)
                SelectedChannelsIds[x.subviews.first?.tag ?? 0] = channelRow
                selctedSoloIds[x.subviews.first?.tag ?? 0] = channelRow
                id = channelRow
                t = x.subviews.first?.tag ?? 0
                break
            }
        }
//        ChannelSetting?.tag = channelRow
        for x in ChannelSetting!.subviews
        {
            if x.isKind(of: UILabel.self)
            {
                (x as? UILabel)?.text = channelName
                break
            }
        }
        if imagenURL != ""
        {
            for x in ChannelSetting!.subviews
            {
                if x.isKind(of: UIImageView.self)
                {
                    do
                    {
                        if let url = URL(string: imagenURL)
                        {
                        let imageData = try Data(contentsOf: url)
                        (x as? UIImageView)?.image = UIImage(data: imageData)
                        }
                    }
                    catch
                    {
                        debugPrint(error)
                    }
                }
            }
        }
        let s = soundChannel(canalId: id, tag: t, nombre: n,imagen: imagenURL, imagenData: data)
        if channelData.getClubExistence(channel: s)
        {
            debugPrint("esta")
            channelData.UpdateClubes(channel: s)
        }
        else
        {
            debugPrint("no esta")
            channelData.saveChannel(channel: s)
        }

        
    }
    // este delegado es para abrir el picker del canal de audio
    func selectedSourceButton(tag: Int, imagen: UIView, imagendata : Data?) {
        debugPrint()
        
        if isModeConfig
        {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MixersController") as! PickerImageViewController
            vc.delegate = self
            ChannelSetting = imagen
            vc.imagenData = imagendata
            vc.row = SelectedChannelsIds[tag]
            self.present(vc, animated: true, completion: nil)
        }
    }
    //Este delegado es para abrir el picker destinations Video
    func selectedSourceButton(tag: Int, boton: UIButton) {
//        print(tag)
        if isModeConfig
        {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "pickerController") as! PickerDestinyViewController
            vc.delegate = self
            vc.isDestiny = .source
            buttonsetting = boton
            vc.row = selectedUltrixIds[boton.tag]
//        vc.row = tvRow
            self.present(vc, animated: true, completion: nil)
        }
    }
    // Este delegado es para los origenes y destinos del lado de Video y los mixes para el Silder
    func tvSelected(row: Int, isDestiny : pickerType, nombre : String) {
        if isDestiny == .destiny
        {
        LabelTV.text = "Destination \(row + 1)"
        self.tvRow = row
        UserDefaults.standard.set(row, forKey: "destiny")
        }
        else if isDestiny == .source
        {
//            buttonsetting?.tag = row
            buttonsetting?.setTitle("\(row + 1)", for: .normal)
            selectedUltrixIds[buttonsetting?.tag ?? 0] = row
            UserDefaults.standard.set(selectedUltrixIds, forKey: "ultr")
        }
        else
        {
            sliderView.tag = row + 1
            mixLabel.text = nombre
            UserDefaults.standard.set(row + 1, forKey: "silderTag")
            UserDefaults.standard.set(nombre, forKey: "mixLabel")
        }
    }
    
    
}
