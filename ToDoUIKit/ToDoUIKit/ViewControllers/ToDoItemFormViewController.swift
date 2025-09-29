//
//  ToDoItemViewController.swift
//  ToDoUIKit
//
//  Created by Ricardo Prestes on 21/09/25.
//

import UIKit

class ToDoItemFormViewController: UIViewController {
    
    //MARK: - Views
    let titleLable: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "To Do"
        return label
    }()
    
    let titleTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Title"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Finish by"
        return label
    }()
    
    let dateTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Select a date"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.datePickerMode = .date
        picker.preferredDatePickerStyle = .wheels
        return picker
    }()
    
    let obsercationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Observation"
        return label
    }()
    
    let observationTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.layer.cornerRadius = 8
        textView.layer.borderWidth = 1
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.layer.borderColor = UIColor.separator.cgColor
        return textView
    }()
    
    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 16
        return stack
    }()

    private let viewModel = ToDoItemFormViewModel()
    private var item: ToDoItem?
    
    var onSave: (() -> Void)?
    
    init(item: ToDoItem? = nil) {
        super.init(nibName: nil, bundle: nil)
        self.item = item
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        title = "New To Do"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelTapped))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveTapped))
        
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let item = item {
            titleTextField.text = item.title
            observationTextView.text = item.observation
            if let date = item.date {
                dateTextField.text = DateFormatter.localizedString(from: date, dateStyle: .medium, timeStyle: .none)
            }
        }
    }
    
    
    func setupViews() {
        view.addSubviews(stackView)
        stackView.addArrangedSubview(titleLable)
        stackView.addArrangedSubview(titleTextField)
        stackView.addArrangedSubview(dateLabel)
        stackView.addArrangedSubview(dateTextField)
        stackView.addArrangedSubview(obsercationLabel)
        stackView.addArrangedSubview(observationTextView)
        
        let safeArea = view.safeAreaLayoutGuide
        stackView
            .leading(equalTo: safeArea.leadingAnchor, constant: 16)
            .top(equalTo: safeArea.topAnchor, constant: 16)
            .trailing(equalTo: safeArea.trailingAnchor, constant: -16)
        
        observationTextView
            .height(60)
        
        dateTextField.inputView = datePicker
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneTapped))
        toolbar.setItems([doneButton], animated: false)
        dateTextField.inputAccessoryView = toolbar
    }
    
    
    @objc func cancelTapped() {
        dismiss(animated: true)
    }
    
    @objc func saveTapped() {
        viewModel.title = titleTextField.text ?? ""
        
        if let date = dateTextField.text, !date.isEmpty {
            viewModel.date = datePicker.date
        } else {
            viewModel.date = nil
        }
        
        viewModel.observation = observationTextView.text ?? ""
        
        viewModel.save(item: self.item)
        
        onSave?()
        dismiss(animated: true)
    }
    
    @objc func doneTapped() {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        dateTextField.text = formatter.string(from: datePicker.date)
        view.endEditing(true)
    }
    
}
