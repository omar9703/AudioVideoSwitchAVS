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
          
          self.tag = (Int(self.currentTitle ?? "0") ?? 0) - 1
          let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longPressed))
                  self.addGestureRecognizer(longPressRecognizer)
          
          if let u = UserDefaults.standard.value(forKey: "ultr") as? [Int]
          {
              self.setTitle("\(u[self.tag] + 1)", for: .normal)
          }
         }
    
    
    @objc func longPressed(sender: UILongPressGestureRecognizer) {
        print("longpressed")
        delegate?.selectedSourceButton(tag: sender.view?.tag ?? 0, boton: self)
    }

}
