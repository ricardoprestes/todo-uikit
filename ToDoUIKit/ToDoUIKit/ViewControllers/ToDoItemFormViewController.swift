//
//  ToDoItemViewController.swift
//  ToDoUIKit
//
//  Created by Ricardo Prestes on 21/09/25.
//

import UIKit

class ToDoItemFormViewController: UIViewController {
    
    let stackView: UIStackView = {
        let stack = UIStackView()
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
    }
    
    
    @objc func cancelTapped() {
        dismiss(animated: true)
    }
    
    @objc func saveTapped() {
        dismiss(animated: true)
    }
    
}
