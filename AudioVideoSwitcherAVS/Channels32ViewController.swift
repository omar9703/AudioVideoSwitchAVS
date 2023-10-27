//
//  Channels32ViewController.swift
//  AudioVideoSwitcherAVS
//
//  Created by Omar Campos on 13/10/23.
//

import UIKit
import SocketSwift

class Channels32ViewController: UIViewController,ImageActionDelegate,channelSetDelegate,pickerTvDelegate,configPressedDelegate {
    func setIpPressed() {
        ipYamaha = UserDefaults.standard.string(forKey: "yamaha")
        
        pinger2?.stopPinging()
        pingLoaded = false
        if !pingLoaded
        {
            pingFunction()
        }
    }
    
    func tvSelected(row: Int, isDestiny: pickerType, nombre: String) {
        if isDestiny == .destiny
        {
        UserDefaults.standard.set(row, forKey: "destiny")
        }
        else if isDestiny == .source
        {
//
        }
        else
        {
            sliderView.tag = row + 1
            mixLabel.text = nombre
            UserDefaults.standard.set(row + 1, forKey: "silderTag")
            UserDefaults.standard.set(nombre, forKey: "mixLabel")
        }
    }
    
    var pingLoaded = false
    var ChannelSetting : UIView?
    var bandera = true
    var selectedChannels = [false, false, false, false,false,false,false,false,false, false, false, false,false,false,false,false, false, false, false,false, false,false,false,false,false,false,false,false,false,false,false,false]
    var SelectedChannelsIds = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31]
    var selctedSoloIds = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31]
    var isModeConfig = false
    var volume = -16
    var yamahaStats = true
    var ipYamaha : String?
    var pinger2 : SwiftyPing?
    var leer = false
    @IBOutlet weak var configLabel: UILabel!
    @IBOutlet weak var configSwitch: UISwitch!
    @IBOutlet weak var configIpButton: UIButton!
    @IBOutlet var canales : [UIImageView]!
    @IBOutlet weak var yamahaUltrix: UIView!
    @IBOutlet weak var canal14: UIImageView!
    @IBOutlet weak var canal13: UIImageView!
    @IBOutlet weak var canal12: UIImageView!
    @IBOutlet weak var canal11: UIImageView!
    @IBOutlet weak var canal10: UIImageView!
    @IBOutlet weak var canal7: UIImageView!
    @IBOutlet weak var sliderView: UISlider!
    @IBOutlet weak var canal6: UIImageView!
    @IBOutlet weak var canal5: UIImageView!
    @IBOutlet weak var canal4: UIImageView!
    @IBOutlet weak var canal3: UIImageView!
    @IBOutlet weak var canal8: UIImageView!
    @IBOutlet weak var canal1: UIImageView!
    @IBOutlet weak var canal2: UIImageView!
    @IBOutlet weak var canal9: UIImageView!
    @IBOutlet weak var canal15: UIImageView!
    @IBOutlet weak var canal16: UIImageView!
    @IBOutlet weak var canal17: UIImageView!
    @IBOutlet weak var canal18: UIImageView!
    @IBOutlet weak var canal19: UIImageView!
    @IBOutlet weak var canal20: UIImageView!
    @IBOutlet weak var canal21: UIImageView!
    @IBOutlet weak var canal22: UIImageView!
    @IBOutlet weak var canal23: UIImageView!
    @IBOutlet weak var canal24: UIImageView!
    @IBOutlet weak var canal25: UIImageView!
    @IBOutlet weak var canal26: UIImageView!
    @IBOutlet weak var canal27: UIImageView!
    @IBOutlet weak var canal28: UIImageView!
    @IBOutlet weak var canal29: UIImageView!
    @IBOutlet weak var canal30: UIImageView!
    @IBOutlet weak var canal31: UIImageView!
    @IBOutlet weak var canal32: UIImageView!
    @IBOutlet weak var mixLabel: UILabel!
    @IBOutlet var soloButtons : [UIView]!
    override func viewDidLoad() {
        super.viewDidLoad()
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
        canal21.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.canalAction(_:))))
        canal22.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.canalAction(_:))))
        canal23.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.canalAction(_:))))
        canal24.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.canalAction(_:))))
        canal25.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.canalAction(_:))))
        canal26.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.canalAction(_:))))
        canal27.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.canalAction(_:))))
        canal28.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.canalAction(_:))))
        canal29.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.canalAction(_:))))
        canal30.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.canalAction(_:))))
        canal31.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.canalAction(_:))))
        canal32.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.canalAction(_:))))
        
        soloButtons.forEach { t in
            let path = UIBezierPath(roundedRect:t.bounds,
                                    byRoundingCorners:[.topLeft],
                                    cornerRadii: CGSize(width: 20, height:  20))
            let maskLayer = CAShapeLayer()

            maskLayer.path = path.cgPath
            t.layer.mask = maskLayer
        }
        
        self.view.addGestureRecognizer(UIPinchGestureRecognizer(target: self, action: #selector(self.panGestureSettings(_:))))
        
        sliderView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.sliderGesture(_:))))
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        ipYamaha = UserDefaults.standard.string(forKey: "yamaha")
        let notificationCenter = NotificationCenter.default
            notificationCenter.addObserver(self, selector: #selector(appMovedToBackground), name: UIApplication.willTerminateNotification, object: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1)
        {
            self.pingFunction()
        }
//        getStatus()
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
        
        
        
        
    }
    @IBAction func configSiwtch(_ sender: UISwitch) {
        isModeConfig = sender.isOn
        if !sender.isOn
        {
            configLabel.isHidden = true
            configSwitch.isHidden = true
            mixLabel.isHidden = true
            configIpButton.isHidden = true
        }
        else
        {
            
            
            configIpButton.isHidden = false
        }
    }
    @IBAction func ConfigButtonAction(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "config") as! ConfiguracionViewController
        vc.delegate = self
        vc.origen = "32"
        self.present(vc, animated: true, completion: nil)
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
        
        let pingInterval:TimeInterval = 2
        let timeoutInterval:TimeInterval = 1
        let configuration = PingConfiguration(interval: pingInterval, with: timeoutInterval)
        if let ipYamaha = ipYamaha {
             pinger2 = try? SwiftyPing(host: ipYamaha, configuration: PingConfiguration(interval: 5, with: 6), queue: DispatchQueue.global())
            pinger2?.observer = { (response) in
                let duration = response.duration
//                print(duration,response)
                if let _ = response.error
                {
                    DispatchQueue.main.async {
                        self.yamahaStats = true
                        self.yamahaUltrix.backgroundColor = .red
                    }
                }
                else
                {
                    DispatchQueue.main.async {
                        if !self.leer
                        {
                            let timer = Timer.scheduledTimer(timeInterval: 30.0, target: self, selector: #selector(self.status(_:)), userInfo: nil, repeats: true)
                            self.status(timer)
//                            self.getStatusSlider()
//                            self.getStatus()
                            self.leer.toggle()
                        }
                        self.yamahaStats = true
                        self.yamahaUltrix.backgroundColor = .green
                    }
                }
            }
            try? pinger2?.startPinging()
        }
        
    }
    @objc func status(_ timer : Timer)
    {
        getStatus()
        getStatusSlider()
    }
    func getStatus()
    {
        if self.bandera && !UserDefaults.standard.bool(forKey: "maestro")
        {
            var client : Socket?
            self.bandera = false
                do
                {
                    client = try Socket(.inet, type: .stream, protocol: .tcp)
                    try client?.connect(port: 49280, address: ipYamaha)
                    if let u = try client?.wait(for: .write, timeout: 2, retryOnInterrupt: true), u
                    {
                        for (x,y) in SelectedChannelsIds.enumerated()
                        {
                            
                            let vtag = self.sliderView.tag - 1
                            let message = ([UInt8])("get MIXER:Current/InCh/ToMix/Level  \(y) \(vtag)\n".utf8)
                            try client?.write(message)
                            debugPrint(y)
                            var buffer = [UInt8](repeating: 0, count: 52)
                            _ = try client?.read(&buffer, size: 52)
                            if let response = String(bytes: buffer, encoding: .utf8)
                            {
                                //debugPrint(response, response.replacingOccurrences(of: "\0", with: "").replacingOccurrences(of: "\n", with: ""))
                                let str = response.replacingOccurrences(of: "\0", with: "").replacingOccurrences(of: "\n", with: "")
                                let split = str.split(separator: " ")
                                let last = String(split.suffix(1).joined(separator: [" "]))
                                debugPrint(last)
                                if let valor = Int(last)
                                {
                                    for p in self.view.subviews
                                    {
                                        //                                debugPrint(x)
                                        if let s1 = p as? UIStackView
                                        {
                                            for y in s1.subviews
                                            {
                                                if let f = y as? CanalButtonView
                                                {
                                                    if f.tag == x
                                                    {
                                                        //debugPrint(valor)
                                                        if (valor > -7000 && valor < -200) || (valor >= 100) && (valor < 1001)
                                                        {
                                                            DispatchQueue.main.async {
                                                                for h in f.subviews
                                                                {
                                                                    if h.isKind(of: UILabel.self)
                                                                    {
                                                                        h.backgroundColor = .yellow
                                                                    }
                                                                }
                                                            }
                                                            self.selectedChannels[x] = true
                                                        }
                                                        else if valor >= -200 && valor < 100
                                                        {
                                                            DispatchQueue.main.async {
                                                                for h in f.subviews
                                                                {
                                                                    if h.isKind(of: UILabel.self)
                                                                    {
                                                                        h.backgroundColor = UIColor(red: 195/255, green: 24/255, blue: 53/255, alpha: 1)
                                                                    }
                                                                }
                                                            }
                                                            self.selectedChannels[x] = true
                                                        }
                                                        else
                                                        {
                                                            DispatchQueue.main.async {
                                                                for h in f.subviews
                                                                {
                                                                    if h.isKind(of: UILabel.self)
                                                                    {
                                                                        h.backgroundColor = UIColor(red: 61/255, green: 121/255, blue: 196/255, alpha: 1)
                                                                    }
                                                                }
                                                            }
                                                            self.selectedChannels[x] = false
                                                        }
                                                    }
                                                }
                                            }
                                            
                                        }
                                    }
                                    
                                }
                            }
                        }
                    }
                        client?.close()
                }
                catch
                {
                    //client?.close()
                    debugPrint(error)
                    self.bandera = true
                }
            }
            self.bandera = true
    }
    @IBAction func clearChnnels(_ sender: UIButton) {
        if !isModeConfig && yamahaStats && bandera && !UserDefaults.standard.bool(forKey: "maestro")
        {
            bandera = false
            
            if let ipYamaha = ipYamaha {
                var client : Socket?
                let vTag = self.sliderView.tag - 1
                do{
                    client = try Socket(.inet, type: .stream, protocol: .tcp)
                   try client?.connect(port: 49280, address: ipYamaha)
                    if let u = try client?.wait(for: .write, timeout: 2, retryOnInterrupt: true), u
                    {
                        for (x,y) in selectedChannels.enumerated()
                        {
                            if y
                            {
                                let message = ([UInt8])("set MIXER:Current/InCh/ToMix/Level \(self.SelectedChannelsIds[x]) \(vTag) \(-32000) \n".utf8)
                                try client?.write(message)
                                
                                debugPrint("holis")
                                var buffer = [UInt8](repeating: 0, count: 1500)
                                try client?.read(&buffer, size: 100)
                                selectedChannels[x] = false
                                for o in canales
                                {
                                    if o.tag == x
                                    {
                                        
                                        for i in o.superview!.subviews
                                        {
                                            
                                            if i.isKind(of: UILabel.self)
                                            {
                                                (i as? UILabel)?.backgroundColor = UIColor(red: 61/255, green: 121/255, blue: 196/255, alpha: 1)
                                            }
                                            
                                        }
                                    }
                                }
                                
                                
                                
                            }
                        }
                    }
                   client?.close()
                    self.bandera = true
               }
               catch
               {
                   debugPrint(error)
                   //client?.close()
                   self.bandera = true
               }
            }
        }
    }
    func getStatusSlider()
    {
        var client : Socket?
        do
        {
            
             client = try Socket(.inet, type: .stream, protocol: .tcp)
            try client?.connect(port: 49280, address: ipYamaha)
            _ = 0
            if let u = try client?.wait(for: .write, timeout: 2, retryOnInterrupt: true), u
            {
                let message = ([UInt8])("get MIXER:Current/Mix/Fader/Level \(sliderView.tag - 1) 0\n".utf8)
                try client?.write(message)
                //            debugPrint(y)
                var buffer = [UInt8](repeating: 0, count: 52)
                _ = try client?.read(&buffer, size: 52)
                if let response = String(bytes: buffer, encoding: .utf8)
                {
                    //debugPrint(response, response.replacingOccurrences(of: "\0", with: "").replacingOccurrences(of: "\n", with: ""))
                    let str = response.replacingOccurrences(of: "\0", with: "").replacingOccurrences(of: "\n", with: "")
                    let split = str.split(separator: " ")
                    let last = String(split.suffix(1).joined(separator: [" "]))
                    //debugPrint(last)
                    if let valor = Int(last)
                    {
                        for x in self.view.subviews
                        {
                            if let y = x as? UISlider
                            {
                                switch valor {
                                case (-28000)...(-6000):
                                    sliderView.value = -15
                                    break
                                case (-5999)...(-5500):
                                    sliderView.value = -14
                                    break
                                case (-5499)...(-5000):
                                    sliderView.value = -13
                                    break
                                case (-4999)...(-4500):
                                    sliderView.value = -12
                                    break
                                case (-4499)...(-4000):
                                    sliderView.value = -11
                                    break
                                case (-3999)...(-3500):
                                    sliderView.value = -10
                                    break
                                case (-3499)...(-3000):
                                    sliderView.value = -9
                                    break
                                case (-2999)...(-2500):
                                    sliderView.value = -8
                                    break
                                case (-2499)...(-2000):
                                    sliderView.value = -7
                                    break
                                case (-1999)...(-1500):
                                    sliderView.value = -6
                                    break
                                case (-1499)...(-1000):
                                    sliderView.value = -5
                                    break
                                case (-999)...(-500):
                                    sliderView.value = -4
                                    break
                                case (-499)...(0):
                                    sliderView.value = -3
                                    break
                                case (0)...(300):
                                    sliderView.value = -2
                                    break
                                case (301)...(500):
                                    sliderView.value = -1
                                    break
                                case (501)...(700):
                                    sliderView.value = 0
                                    break
                                case 701...1000:
                                    sliderView.value = 1
                                    break
                                default:
                                    sliderView.value = -16
                                    break
                                }
                            }
                        }
                    }
                }
            }
                client?.close()
            
        }
        catch
        {
            //client?.close()
            debugPrint(error)
        }
    }
    @objc func appMovedToBackground() {
        print("App moved to background!")
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
            if !isModeConfig && yamahaStats
            {
                if let ipYamaha = ipYamaha {
                    debugPrint(ipYamaha)
                    let vtag = sender.tag
                    DispatchQueue.global(qos: .utility).async {
                        do
                        {
                            let client = try Socket(.inet, type: .stream, protocol: .tcp)
                            try client.connect(port: 49280, address: ipYamaha)
                            if try client.wait(for: .write, timeout: 2)
                            {
                                let message = ([UInt8])("set MIXER:Current/Mix/Fader/Level \(vtag  - 1) 0 \(level) \n".utf8)
                                try client.write(message)
                                debugPrint("holis")
                                var buffer = [UInt8](repeating: 0, count: 1500)
                                try client.read(&buffer, size: 100)
                                client.close()
                            }
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
    
    @objc func canalAction(_ sender: UITapGestureRecognizer) {
        debugPrint("holis", sender.view?.tag)
        if !isModeConfig && yamahaStats && bandera && !UserDefaults.standard.bool(forKey: "maestro")
        {
            bandera = false
            if let ipYamaha = ipYamaha {
                debugPrint(ipYamaha,sender.view?.tag)
                var nivel = 0
                if !selectedChannels[sender.view?.tag ?? 1]
                {
                    selectedChannels[sender.view?.tag ?? 1] = true
                    nivel = 0
                    for x in sender.view!.superview!.subviews
                    {
                        if x.isKind(of: UILabel.self)
                        {
                            x.backgroundColor = UIColor(red: 195/255, green: 24/255, blue: 53/255, alpha: 1)
                        }
                    }
                }
                else
                {
                    selectedChannels[sender.view?.tag ?? 1] = false
                    nivel = -32768
                    for x in sender.view!.superview!.subviews
                    {
                        if x.isKind(of: UILabel.self)
                        {
                            x.backgroundColor = UIColor(red: 61/255, green: 121/255, blue: 196/255, alpha: 1)
                        }
                    }
                }
                let t = SelectedChannelsIds[sender.view?.tag ?? 0]
                var client : Socket?
                debugPrint(t)
                DispatchQueue.global(qos: .utility).async {
                    do
                    {
                        
                        client = try Socket(.inet, type: .stream, protocol: .tcp)
                        try client?.connect(port: 49280, address: ipYamaha)
                        if let u = try client?.wait(for: .write, timeout: 2), u
                        {
                            let vTag = self.sliderView.tag - 1
                            //client.close()
                            let message = ([UInt8])("set MIXER:Current/InCh/ToMix/Level \(t) \(vTag) \(nivel) \n".utf8)
                            try client?.write(message)
                            debugPrint("holis",t)
                            var buffer = [UInt8](repeating: 0, count: 1500)
                            try client?.read(&buffer, size: 100)
                            client?.close()
                        }
                    }
                    catch
                    {
                        debugPrint(error)
                        //client?.close()
                        DispatchQueue.main.async {
                            sender.view!.backgroundColor = .clear
                        }
                    }
                }
            }
            else{
                self.alerta(message: "Falta la ip del dispositivo destino.", title: "Error")
            }
            bandera = true
        }
        
    }
    func channelSelected(channelRow: Int, channelName: String, imagenURL : String, data : Data?) {
        var id = 0
        var t = 0
        let  n = channelName
        SelectedChannelsIds[(ChannelSetting as? CanalButtonView)?.tag ?? 0] = channelRow
        selctedSoloIds[(ChannelSetting as? CanalButtonView)?.tag ?? 0] = channelRow
        id = channelRow
        t = (ChannelSetting as? CanalButtonView)?.tag ?? 0
        
        //        ChannelSetting?.tag = channelRow
        for x in ChannelSetting!.subviews
        {
            if x.isKind(of: UILabel.self)
            {
                (x as? UILabel)?.text = channelName
                
            }
            else if x.isKind(of: UIView.self)
            {
                for y in x.subviews
                {
                    if (y as? UILabel)?.tag == 1
                    {
                        (y as? UILabel)?.text = String(channelRow + 1)
                    }
                }
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
    func selectedSourceButton(tag: Int, imagen: UIView, imagendata: Data?) {
        if isModeConfig
        {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MixersController") as! PickerImageViewController
            vc.delegate = self
            ChannelSetting = imagen
            vc.imagenData = imagendata
            for x in imagen.subviews
            {
                debugPrint(x)
                if x.isKind(of: UILabel.self)
                {
                    if let text = (x as? UILabel)?.text
                    {
                        if !text.contains("Canal")
                        {
                            vc.nombreCustom = text
                        }
                    }
                }
            }
            vc.row = SelectedChannelsIds[tag]
            self.present(vc, animated: true, completion: nil)
        }
    }

}
