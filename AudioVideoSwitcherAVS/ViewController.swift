//
//  ViewController.swift
//  AudioVideoSwitcherAVS
//
//  Created by Ruben  Omar Campos Vazquez on 07/09/22.
//

import UIKit
import SocketSwift
//import SwiftPing
class ViewController: UIViewController {
    var bandera = true
    @IBOutlet var canales : [UIImageView]!
    @IBOutlet weak var ultrixStatus: UIView!
    @IBOutlet weak var yamahaUltrix: UIView!
    @IBOutlet weak var configIpButton: UIButton!
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
    @IBOutlet weak var camaraAction1: UIButton!
    @IBOutlet weak var camara2: UIButton!
    @IBOutlet weak var camara3: UIButton!
    @IBOutlet weak var canal1: UIImageView!
    @IBOutlet weak var canal2: UIImageView!
    @IBOutlet weak var canal9: UIImageView!
    @IBOutlet weak var canal15: UIImageView!
    @IBOutlet weak var canal16: UIImageView!
    @IBOutlet weak var canal17: UIImageView!
    @IBOutlet weak var canal18: UIImageView!
    @IBOutlet weak var canal19: UIImageView!
    @IBOutlet weak var canal20: UIImageView!
    @IBOutlet weak var LabelTV: UILabel!
    @IBOutlet weak var mixLabel: UILabel!
    @IBOutlet var myButtons: [UIButton]!
    @IBOutlet weak var configLabel: UILabel!
    @IBOutlet weak var configSwitch: UISwitch!
    @IBOutlet var soloButtons : [UIView]!
    var pinger : SwiftyPing?
    var pinger2 : SwiftyPing?
    var tvRow = 0
    var pingLoaded = false
    var selectedChannels = [false, false, false, false,false,false,false,false,false, false, false, false,false,false,false,false, false, false, false,false]
    var SelectedChannelsIds = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19]
    var selctedSoloIds = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19]
    var selectedUltrixIds = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49]
    var nombresUltrix = ["","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","",""]
    var selectedCamara = [false]
    var selectedSolo = [false, false, false, false,false,false,false,false,false, false, false, false,false,false,false,false, false, false, false,false]
    var buttonsTV = [UIButton]()
    var buttonsetting : UIButton?
    var ChannelSetting : UIView?
    var isModeConfig = false
    var volume = -16
    var ipYamaha : String?
    var ipUltrix :  String?
    var ultrixstats = false
    var yamahaStats = false
    var leer = false
    override func viewDidLoad() {
        super.viewDidLoad()
        soloButtons.forEach { t in
            t.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.SoloAction(_:))))
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
        
        ultrixStatus.layer.cornerRadius = 12
        yamahaUltrix.layer.cornerRadius = 12
        
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
        let notificationCenter = NotificationCenter.default
            notificationCenter.addObserver(self, selector: #selector(appMovedToBackground), name: UIApplication.willTerminateNotification, object: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1)
        {
            self.pingFunction()
        }
//        getStatus()
    }
    @objc func appMovedToBackground() {
        print("App moved to background!")
    }
    func getStatusSlider()
    {
        var client : Socket?
        do
        {
            
             client = try Socket(.inet, type: .stream, protocol: .tcp)
            try client?.connect(port: 49280, address: ipYamaha)
            var cont = 0
            //                    try client.wait(for: .write, timeout: 2000)
            let message = ([UInt8])("get MIXER:Current/Mix/Fader/Level \(sliderView.tag - 1) 0\n".utf8)
            try client?.write(message)
//            debugPrint(y)
            var buffer = [UInt8](repeating: 0, count: 52)
            let v = try client?.read(&buffer, size: 52)
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
            client?.close()
        }
        catch
        {
            client?.close()
            debugPrint(error)
        }
    }
    @objc func status(_ timer : Timer)
    {
        getStatus()
        getStatusSlider()
        getStatusSolo()
    }
    
    func getStatusSolo()
    {
            var client : Socket?
                do
                {
                    for (x,y) in selctedSoloIds.enumerated()
                    {
                        let vtag = self.sliderView.tag - 1
                         client = try Socket(.inet, type: .stream, protocol: .tcp)
                        try client?.connect(port: 49280, address: ipYamaha)
                        var cont = 0
                        let message = ([UInt8])("get MIXER:Current/InCh/ToMix/Level \(y) \(vtag)\n".utf8)
                        try client?.write(message)
                        debugPrint(y)
                        var buffer = [UInt8](repeating: 0, count: 52)
                        let v = try client?.read(&buffer, size: 52)
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
                                                                if h.isKind(of: UIView.self)
                                                                {
                                                                    for u in h.subviews
                                                                    {
                                                                        if u.isKind(of: UIImageView.self)
                                                                        {
                                                                            h.backgroundColor = UIColor(red: 255/255, green: 156/255, blue: 0/255, alpha: 1)
                                                                            
                                                                            (u as? UIImageView)?.image = UIImage(named: "auriculares")
                                                                        }
                                                                    }
                                                                    
                                                                }
                                                            }
                                                        }
                                                        self.selectedSolo[x] = true
                                                    }
                                                    else if valor >= -200 && valor < 100
                                                    {
                                                        DispatchQueue.main.async {
                                                            for h in f.subviews
                                                            {
                                                                if h.isKind(of: UIView.self)
                                                                {
                                                                    for u in h.subviews
                                                                    {
                                                                        if u.isKind(of: UIImageView.self)
                                                                        {
                                                                            h.backgroundColor =  UIColor(red: 255/255, green: 156/255, blue: 0/255, alpha: 1)
                                                                            
                                                                                (u as? UIImageView)?.image = UIImage(named: "auriculares")
                                                                            
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                        self.selectedSolo[x] = true
                                                    }
                                                    else
                                                    {
                                                        DispatchQueue.main.async {
                                                            for h in f.subviews
                                                            {
                                                                if h.isKind(of: UIView.self)
                                                                {
                                                                    for u in h.subviews
                                                                    {
                                                                        if u.isKind(of: UIImageView.self)
                                                                        {
                                                                            h.backgroundColor = UIColor(red: 69/255, green: 93/255, blue: 220/255, alpha: 1)
                                                                            
                                                                            (u as? UIImageView)?.image = UIImage(named: "microfono")
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                        self.selectedSolo[x] = false
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
                    
                }
                
                catch
                {
                    client?.close()
                    debugPrint(error)
                }
            
    }
    func getStatus()
    {
        if self.bandera && !UserDefaults.standard.bool(forKey: "maestro")
        {
            var client : Socket?
            self.bandera = false
                do
                {
                    for (x,y) in SelectedChannelsIds.enumerated()
                    {
                        client = try Socket(.inet, type: .stream, protocol: .tcp)
                       try client?.connect(port: 49280, address: ipYamaha)
                       var cont = 0
                        let message = ([UInt8])("get MIXER:Current/InCh/Fader/Level \(y) 0\n".utf8)
                        try client?.write(message)
                        debugPrint(y)
                        var buffer = [UInt8](repeating: 0, count: 52)
                        let v = try client?.read(&buffer, size: 52)
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
                        client?.close()
                    }
                   
                }
                
                catch
                {
                    client?.close()
                    debugPrint(error)
                    self.bandera = true
                }
            }
            self.bandera = true
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let u = UserDefaults.standard.value(forKey: "nombres") as? [String]
        {
            debugPrint(u)
            self.nombresUltrix = u
        }
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
        
        let pingInterval:TimeInterval = 2
        let timeoutInterval:TimeInterval = 1
        let configuration = PingConfiguration(interval: pingInterval, with: timeoutInterval)
        if let ipUltrix = ipUltrix {
            pingLoaded = true
        pinger = try? SwiftyPing(host: ipUltrix, configuration: PingConfiguration(interval: 0.5, with: 5), queue: DispatchQueue.global())
        pinger?.observer = { (response) in
            let duration = response.duration
//            print(duration,response)
            if let e = response.error
            {
                DispatchQueue.main.async {
                    self.ultrixstats = false
                    self.ultrixStatus.backgroundColor = .red
                }
            }
            else
            {
                DispatchQueue.main.async {
                    
                    self.ultrixstats = true
                    self.ultrixStatus.backgroundColor = .green
                }
            }
        }
        try? pinger?.startPinging()
        }
        if let ipYamaha = ipYamaha {
             pinger2 = try? SwiftyPing(host: ipYamaha, configuration: PingConfiguration(interval: 0.5, with: 5), queue: DispatchQueue.global())
            pinger2?.observer = { (response) in
                let duration = response.duration
//                print(duration,response)
                if let e = response.error
                {
                    DispatchQueue.main.async {
                        self.yamahaStats = false
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
    @IBAction func clearChnnels(_ sender: UIButton) {
        if !isModeConfig && yamahaStats && bandera && !UserDefaults.standard.bool(forKey: "maestro")
        {
            bandera = false
            
            if let ipYamaha = ipYamaha {
                var client : Socket?
                let vTag = self.sliderView.tag
                do{
                    client = try Socket(.inet, type: .stream, protocol: .tcp)
                   try client?.connect(port: 49280, address: ipYamaha)
                   let w = try client?.wait(for: .write, timeout: 1, retryOnInterrupt: false)
                   debugPrint(w)
                    for (x,y) in selectedChannels.enumerated()
                    {
                        if y
                        {
                            let message = ([UInt8])("set MIXER:Current/InCh/Fader/Level \(self.SelectedChannelsIds[x]) \(0) \(-32000) \n".utf8)
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
                   
                   client?.close()
                    self.bandera = true
               }
               catch
               {
                   debugPrint(error)
                   client?.close()
                   self.bandera = true
               }
            }
        }
    }
    @IBAction func soloButton(_ sender: UIButton) {
        if !isModeConfig && yamahaStats && bandera
        {
            bandera = false
            
            if let ipYamaha = ipYamaha {
                var client : Socket?
                let vTag = self.sliderView.tag
                do{
                    client = try Socket(.inet, type: .stream, protocol: .tcp)
                   try client?.connect(port: 49280, address: ipYamaha)
                   let w = try client?.wait(for: .write, timeout: 1, retryOnInterrupt: false)
                   debugPrint(w)
                    for (x,y) in selectedSolo.enumerated()
                    {
                        if y
                        {
                            let message = ([UInt8])("set MIXER:Current/InCh/ToMix/Level \(self.selctedSoloIds[x]) \(vTag - 1) \(-32000) \n".utf8)
                            try client?.write(message)
                            
                            debugPrint("holis")
                            var buffer = [UInt8](repeating: 0, count: 1500)
                            try client?.read(&buffer, size: 100)
                            selectedSolo[x] = false
                            for o in soloButtons
                            {
                                if o.tag == x
                                {
                                    o.backgroundColor = UIColor(red: 69/255, green: 93/255, blue: 220/255, alpha: 1)
                                    for i in o.subviews
                                    {
                                        
                                            if i.isKind(of: UIImageView.self)
                                            {
                                                (i as? UIImageView)?.image = UIImage(named: "microfono")
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
                   debugPrint(error)
                   client?.close()
                   
               }
            }
            bandera = true
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
        if !isModeConfig && ultrixstats && bandera
        {
            bandera = false
            if let ipUltrix = ipUltrix {
                debugPrint(sender.tag, ipUltrix)
                for x in myButtons
                {
                    if x == sender
                    {
                        sender.backgroundColor = UIColor(red: 195/255, green: 24/255, blue: 53/255, alpha: 1)
                        x.layer.borderColor = UIColor(red: 231/255, green: 25/255, blue: 76/255, alpha: 1).cgColor
                    }
                    else
                    {
                        x.layer.borderColor = UIColor(red: 108/255, green: 127/255, blue: 227/255, alpha: 1).cgColor
                        x.backgroundColor = UIColor(red: 61/255, green: 121/255, blue: 196/255, alpha: 1)
                    }
                }
                debugPrint(self.selectedUltrixIds[sender.tag]+1)
                var client : Socket?
                DispatchQueue.global(qos: .utility).async {
                    
                    do
                    {
                         client = try Socket(.inet, type: .stream, protocol: .tcp)
                        let y = try client?.wait(for: .write, timeout: 1, retryOnInterrupt: true)
                        debugPrint(y)
                        try client?.connect(port: 7788, address: ipUltrix)
                        
                        let message = ([UInt8])("XPT I:1 D:\(self.tvRow + 1) S:\(self.selectedUltrixIds[sender.tag]+1) \r\n".utf8)
                        try client?.write(message)
                        debugPrint("holis")
                        //            var buffer = [UInt8](repeating: 0, count: 1500)
                        //            try client.read(&buffer, size: 100)
                        client?.close()
                        debugPrint("holis")
                        
                    }
                    catch
                    {
                        debugPrint(error)
                        client?.close()
                        DispatchQueue.main.async {
                            sender.backgroundColor = .lightGray
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
                        try client?.wait(for: .write, timeout: 2000)
                        //client.close()
                        let message = ([UInt8])("set MIXER:Current/InCh/Fader/Level \(t) 0 \(nivel) \n".utf8)
                        try client?.write(message)
                        debugPrint("holis",t)
                        var buffer = [UInt8](repeating: 0, count: 1500)
                        try client?.read(&buffer, size: 100)
                        client?.close()
                    }
                    catch
                    {
                        debugPrint(error)
                        client?.close()
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
    @objc func SoloAction(_ sender: UITapGestureRecognizer) {
        debugPrint(sender.view!.tag)
        if !isModeConfig && yamahaStats && bandera
        {
            bandera = false
            if let ipYamaha = ipYamaha {
                debugPrint(ipYamaha)
                var nivel = 0
                
                if !selectedSolo[sender.view!.tag]
                {
                    selectedSolo[sender.view!.tag] = true
                    nivel = 0
                    sender.view!.backgroundColor = UIColor(red: 255/255, green: 156/255, blue: 0/255, alpha: 1)
                    for x in sender.view!.subviews
                    {
                        (x as? UIImageView)?.image = UIImage(named: "auriculares")
                    }
                }
                else
                {
                    selectedSolo[sender.view!.tag] = false
                    nivel = -32768
                    sender.view!.backgroundColor = UIColor(red: 69/255, green: 93/255, blue: 220/255, alpha: 1)
                    for x in sender.view!.subviews
                    {
                        (x as? UIImageView)?.image = UIImage(named: "microfono")
                    }
                }
                debugPrint(self.selctedSoloIds[sender.view!.tag])
                let tag = sender.view?.tag ?? 0
                let vtag = self.sliderView.tag
                var client : Socket?
                DispatchQueue.global(qos: .utility).async {
                    do
                    {
                         client = try Socket(.inet, type: .stream, protocol: .tcp)
                        try client?.connect(port: 49280, address: ipYamaha)
                        let w = try client?.wait(for: .write, timeout: 1, retryOnInterrupt: false)
                        debugPrint(w)
                        let message = ([UInt8])("set MIXER:Current/InCh/ToMix/Level \(self.selctedSoloIds[tag]) \(vtag - 1) \(nivel) \n".utf8)
                        try client?.write(message)
                        
                        debugPrint("holis")
                        var buffer = [UInt8](repeating: 0, count: 1500)
                        try client?.read(&buffer, size: 100)
                        client?.close()
                    }
                    catch
                    {
                        debugPrint(error)
                        client?.close()
                        DispatchQueue.main.async {
                            sender.view!.backgroundColor = UIColor(red: 69/255, green: 93/255, blue: 220/255, alpha: 1)
                            for x in sender.view!.subviews
                            {
                                (x as? UIImageView)?.image = UIImage(named: "microfono")
                            }
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
                            try client.wait(for: .write, timeout: 2)
                            let message = ([UInt8])("set MIXER:Current/Mix/Fader/Level \(vtag  - 1) 0 \(level) \n".utf8)
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

extension ViewController: pickerTvDelegate, SourceActionDelegate, ImageActionDelegate, channelSetDelegate, configPressedDelegate, pickerButtonDelegate
{
    // cambio de id y nombre del ultrix
    func buttonSelected(row: Int, nombre: String?) {
        buttonsetting?.setTitle(nombre ?? "\(row + 1)", for: .normal)
        nombresUltrix[buttonsetting?.tag ?? 0] = nombre ?? ""
        UserDefaults.standard.set(nombresUltrix, forKey: "nombres")
        selectedUltrixIds[buttonsetting?.tag ?? 0] = row
        UserDefaults.standard.set(selectedUltrixIds, forKey: "ultr")
        debugPrint(nombresUltrix)
    }
    // cambio de ip de los dispositivos
    func setIpPressed() {
        ipYamaha = UserDefaults.standard.string(forKey: "yamaha")
        ipUltrix = UserDefaults.standard.string(forKey: "ultrix")
        pinger?.stopPinging()
        pinger2?.stopPinging()
        pingLoaded = false
        if !pingLoaded
        {
            pingFunction()
        }
    }
    //este delegado es para setear el canal de audio
    func channelSelected(channelRow: Int, channelName: String, imagenURL : String, data : Data?) {
        var id = 0
        var t = 0
        var n = channelName
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
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "pickerField") as! pickerFieldViewController
            vc.delegate = self
            buttonsetting = boton
            vc.row = selectedUltrixIds[boton.tag]
            vc.titulo = boton.currentTitle ?? ""
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
