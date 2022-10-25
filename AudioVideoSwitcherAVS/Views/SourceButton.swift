//
//  SourceButton.swift
//  AudioVideoSwitcherAVS
//
//  Created by Ruben  Omar Campos Vazquez on 10/09/22.
//

import UIKit

@objc protocol SourceActionDelegate
{
    func selectedSourceButton(tag : Int, boton : UIButton)
}

class SourceButton: UIButton {
    @IBOutlet weak var delegate : SourceActionDelegate?
    override init(frame: CGRect) {
           super.init(frame: frame)
           setup()
         }

      required init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
           setup()
         }

      private func setup() {
          self.layer.cornerRadius = self.frame.width / 2
          self.layer.borderWidth = 3
          self.layer.borderColor = UIColor(red: 108/255, green: 127/255, blue: 227/255, alpha: 1).cgColor
          self.backgroundColor = UIColor(red: 61/255, green: 121/255, blue: 196/255, alpha: 1)
          self.tag = (Int(self.currentTitle ?? "0") ?? 0) - 1
          let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longPressed))
                  self.addGestureRecognizer(longPressRecognizer)
          
          if let u = UserDefaults.standard.value(forKey: "ultr") as? [Int]
          {
              self.setTitle("\(u[self.tag] + 1)", for: .normal)
             

          if let p = UserDefaults.standard.value(forKey: "nombres") as? [String]
          {
//              debugPrint(p)
              self.setTitle(p[self.tag] != "" ? p[self.tag] : "\(u[self.tag] + 1)", for: .normal)
          }
          }
          self.titleLabel?.font = UIFont(name: "Knockout-HTF52-Cruiserweight", size: 14)
         }
    
    
    @objc func longPressed(sender: UILongPressGestureRecognizer) {
        print("longpressed")
        delegate?.selectedSourceButton(tag: sender.view?.tag ?? 0, boton: self)
    }

}
