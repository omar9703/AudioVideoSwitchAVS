//
//  CanalButtonView.swift
//  AudioVideoSwitcherAVS
//
//  Created by Ruben  Omar Campos Vazquez on 10/09/22.
//

import UIKit

@objc protocol ImageActionDelegate
{
    func selectedSourceButton(tag : Int, imagen : UIView,imagendata : Data?)
}

class CanalButtonView: UIView {

    @IBOutlet weak var delegate : ImageActionDelegate?
    var dataBDD : soundChannel?
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
//          delegate = self.parentContainerViewController as? ViewController
          let ch = channelData.getCanal(tag: self.tag)
          dataBDD = ch
          let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longPressed))
                  self.addGestureRecognizer(longPressRecognizer)
//          debugPrint(superview?.isKind(of: UIStackView.self))
          for x in subviews
          {
              debugPrint(x)
              if x.isKind(of: UILabel.self)
              {
                  
                (x as? UILabel)?.text = ch?.nombre ?? ("Canal")
                (x as? UILabel)?.textAlignment = .center
    
              }
              else if x.isKind(of: UIImageView.self)
              {
                  if let im = ch?.imagenData
                  {
                      do
                      {
                
                          (x as? UIImageView)?.image = UIImage(data: im)
                          
                      }
                      catch
                      {
                          debugPrint(error)
                      }

                  }
              }
              else if x.isKind(of: UIView.self)
              {
                  for y in x.subviews
                  {
                      if (y as? UILabel)?.tag == 1
                      {
                          (y as? UILabel)?.text = String((ch?.canalId ?? self.tag) + 1)
                      }
                  }
              }
              
          }
          
         }
    
    @objc func longPressed(sender: UILongPressGestureRecognizer) {
        print("longpressed")
        delegate?.selectedSourceButton(tag: sender.view?.tag ?? 0, imagen: self, imagendata : dataBDD?.imagenData)
    }

}
