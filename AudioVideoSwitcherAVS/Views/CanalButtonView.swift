//
//  CanalButtonView.swift
//  AudioVideoSwitcherAVS
//
//  Created by Ruben  Omar Campos Vazquez on 10/09/22.
//

import UIKit

@objc protocol ImageActionDelegate
{
    func selectedSourceButton(tag : Int, imagen : UIView)
}

class CanalButtonView: UIView {

    @IBOutlet weak var delegate : ImageActionDelegate?
    override init(frame: CGRect) {
           super.init(frame: frame)
           setup()
         }

      required init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
           setup()
         }

      private func setup() {
//          self.tag = (Int(self.currentTitle ?? "0") ?? 0) - 1
          let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longPressed))
                  self.addGestureRecognizer(longPressRecognizer)
//          debugPrint(superview?.isKind(of: UIStackView.self))
          for x in subviews
          {
              if x.isKind(of: UILabel.self)
              {
                  (x as? UILabel)?.text = "Canal \(self.tag + 1)"
                  (x as? UILabel)?.textAlignment = .center
              }
          }
         }
    
    @objc func longPressed(sender: UILongPressGestureRecognizer) {
        print("longpressed")
        delegate?.selectedSourceButton(tag: sender.view?.tag ?? 0, imagen: self)
    }

}
