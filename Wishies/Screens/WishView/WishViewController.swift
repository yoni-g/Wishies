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
    @IBOutlet weak var editNavButton: UIBarButtonItem!
    @IBOutlet weak var shareNavButton: UIBarButtonItem!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        // init view modal
        viewModal = WishViewModal(wishId: wishId)
        // text fields
        wishTitleTextInput.text = viewModal.wishTitle
        wishTitleTextInput.placeholder = viewModal.titlePlaceholder
        wishTitleTextInput.delegate = viewModal
        wishBodyTextView.text = viewModal.wishBody
        wishBodyTextView.delegate = viewModal
        // button views
        editNavButton.isEnabled = viewModal.viewMode == .edit
        shareNavButton.isEnabled = viewModal.viewMode == .edit
        super.viewDidLoad()
//        wishBodyTextView.tex = viewModal.bodyPlaceholder
        // Do any additional setup after loading the view.
    }
    
    @IBAction func editNavBarAction(_ sender: Any) {
        viewModal.editAction()
    }
    
    @IBAction func shareNavBarAction(_ sender: Any) {
        viewModal.shareAction()
    }
    
    @IBAction func saveButtonAction(_ sender: Any) {
        
        if viewModal.isWishFieldValid {
            let result = viewModal.saveAction()
            if result.success {
                self.navigationController?.popViewController(animated: true)
            }
        }
        // TODO: add validation errors.. and a faild save handler ..
        
    }

}
