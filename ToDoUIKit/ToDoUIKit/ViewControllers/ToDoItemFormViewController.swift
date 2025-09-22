//
//  ToDoItemViewController.swift
//  ToDoUIKit
//
//  Created by Ricardo Prestes on 21/09/25.
//

import UIKit

class ToDoItemFormViewController: UIViewController {
    
    let titleTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Title"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 16
        return stack
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        title = "New To Do"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelTapped))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveTapped))
        
        setupViews()
    }
    
    func setupViews() {
        view.addSubviews(stackView)
        stackView.addArrangedSubview(titleTextField)
        
        let safeArea = view.safeAreaLayoutGuide
        stackView
            .leading(equalTo: safeArea.leadingAnchor, constant: 16)
            .top(equalTo: safeArea.topAnchor, constant: 16)
            .trailing(equalTo: safeArea.trailingAnchor, constant: -16)
    }
    
    
    @objc func cancelTapped() {
        dismiss(animated: true)
    }
    
    @objc func saveTapped() {
        dismiss(animated: true)
    }
    
}
