//
//  WishViewController.swift
//  Wishies
//
//  Created by Yonathan Goriachnick on 28/03/2020.
//  Copyright © 2020 YGApps. All rights reserved.
//

import UIKit
import Combine

class WishViewController: UIViewController, Storyboarded {
    
    var wishId: String!
    var viewModal: WishViewModal!
    private var viewSubscriber: AnyCancellable?
    
    @IBOutlet weak var wishTitleTextInput: UITextField!
    @IBOutlet weak var wishBodyTextView: UITextView!
    @IBOutlet weak var editNavButton: UIBarButtonItem!
    @IBOutlet weak var deleteNavButton: UIBarButtonItem!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        setupViewModal()
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func setupViewModal(){
        // init view modal
        viewModal = WishViewModal(wishId: wishId)
        // text fields
        wishTitleTextInput.text = viewModal.wishTitle
        wishTitleTextInput.placeholder = viewModal.titlePlaceholder
        wishBodyTextView.text = viewModal.wishBody
        
        wishBodyTextView.delegate = self
        wishTitleTextInput.delegate = self
        // set done button to remove keyboard
        wishTitleTextInput.setDoneButtonToolbarView(self, #selector(doneButtonAction))
        wishBodyTextView.setDoneButtonToolbarView(self, #selector(doneButtonAction))
        // button views mode config 
        viewSubscriber = viewModal.$viewMode.sink { [weak self] in
            self?.editNavButton.isEnabled = $0 == .edit
            self?.deleteNavButton.isEnabled = $0 == .edit
        }
    }
    
    @IBAction func editNavBarAction(_ sender: Any) {
        viewModal.editAction()
    }
    
    @IBAction func deleteNavBarAction(_ sender: Any) {
        let result = viewModal.deleteAction()
        if result.success {
            MainCoordinator.shared.back()
        }
    }
    
    @IBAction func saveButtonAction(_ sender: Any) {
        if viewModal.isWishFieldValid {
            let result = viewModal.saveAction()
            if result.success {
                MainCoordinator.shared.back()
            }
        }
        // TODO: add validation errors.. and a faild save handler ..
//        viewModal.viewMode = (viewModal.viewMode == .edit) ? .new : .edit
        
        
    }
    
    @objc func doneButtonAction(){
        self.view.endEditing(true)
    }
}


extension WishViewController: UITextViewDelegate{
    func textViewDidChange(_ textView: UITextView) {
        viewModal.wishBody = textView.text ?? ""
    }
}

extension WishViewController: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        viewModal.wishTitle = textField.text ?? ""
        return true
    }
}
