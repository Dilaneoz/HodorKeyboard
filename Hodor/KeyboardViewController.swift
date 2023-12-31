//
//  KeyboardViewController.swift
//  Hodor
//
//  Created by Atil Samancioglu on 28.07.2019.
//  Copyright © 2019 Atil Samancioglu. All rights reserved.
//

import UIKit

// keyboardda bir buton yapıp butonu hodor resmine çeviricem ve tıklandığında text te hodor yazıcak

class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //HODOR
        
        let hodorButton = UIButton(type: UIButton.ButtonType.system) // butonun üstüne bir arka plan koyuyoruz bu arka planda da hodor görseli olucak
        hodorButton.frame = CGRect(x: 150, y: 50, width: 140, height: 120)
        hodorButton.setBackgroundImage(UIImage(named: "hodor.png"), for: UIControl.State.normal) // arka plana istediğimiz resmi koyabiliriz. normal bir buton
        hodorButton.addTarget(self, action: #selector(hodorTapped), for: UIControl.Event.touchUpInside) // herhangi bir fonksiyonu hodor butonu tıklandığında çağrıyor. touchUpInside : üstüne tıklandığında yap
        view.addSubview(hodorButton)
        
        
        // Perform custom UI setup here
        self.nextKeyboardButton = UIButton(type: .system)
        
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), for: [])
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        
        self.view.addSubview(self.nextKeyboardButton)
        
        self.nextKeyboardButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.nextKeyboardButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
    @objc func hodorTapped() {
            
        let textProxy = textDocumentProxy as UITextDocumentProxy // bir yere yazı yazdırmak için textDocumentProxy kullanılır
        textProxy.insertText("HODOR!") // tıklanınca texte hodor yazdıracak

    }
    
    override func viewWillLayoutSubviews() {
        self.nextKeyboardButton.isHidden = !self.needsInputModeSwitchKey
        super.viewWillLayoutSubviews()
    }
    
    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
        
        var textColor: UIColor
        let proxy = self.textDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
            textColor = UIColor.white
        } else {
            textColor = UIColor.black
        }
        self.nextKeyboardButton.setTitleColor(textColor, for: [])
    }

}
