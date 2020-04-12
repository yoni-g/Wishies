//
//  WishViewController.swift
//  Wishies
//
//  Created by Yonathan Goriachnick on 28/03/2020.
//  Copyright © 2020 YGApps. All rights reserved.
//

import UIKit

class WishViewController: UIViewController {
    
    var wishId: String!
    var viewModal: WishViewModal!
    
    @IBOutlet weak var wishTitleTextInput: UITextField!
    @IBOutlet weak var wishBodyTextView: UITextView!
    
    override func viewDidLoad() {
        viewModal = WishViewModal(wishId: wishId)
        super.viewDidLoad()
        wishTitleTextInput.text = viewModal.wishTitle
        wishTitleTextInput.placeholder = viewModal.titlePlaceholder
        wishBodyTextView.text = viewModal.wishBody
//        wishBodyTextView.tex = viewModal.bodyPlaceholder
        // Do any additional setup after loading the view.
    }
    
    @IBAction func editNavBarAction(_ sender: Any) {
    }
    
    @IBAction func shareNavBarAction(_ sender: Any) {
    }
    
    @IBAction func saveButtonAction(_ sender: Any) {
    }

}
