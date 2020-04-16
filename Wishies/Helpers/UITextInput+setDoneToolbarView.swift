//
//  UITextInput+setDoneToolbarView.swift
//  Wishies
//
//  Created by Yonathan Goriachnick on 16/04/2020.
//  Copyright © 2020 YGApps. All rights reserved.
//

import UIKit

extension UITextInput where Self: UIView {
    
    func setDoneButtonToolbarView(_ vc: UIViewController, _ selector: Selector){
        
        let toolbar:UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0,  width: vc.view.frame.size.width, height: 30))
        //create left side empty space so that done button set on right side
        let flexSpace = UIBarButtonItem(barButtonSystemItem:    .flexibleSpace, target: nil, action: nil)
        let doneBtn: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: vc, action: selector)
        toolbar.setItems([flexSpace, doneBtn], animated: false)
        toolbar.sizeToFit()
        
        // set the toolbar
        if self is UITextField{
            (self as! UITextField).inputAccessoryView = toolbar
        } else if self is UITextView{
            (self as! UITextView).inputAccessoryView = toolbar
        }
            
    }

}
