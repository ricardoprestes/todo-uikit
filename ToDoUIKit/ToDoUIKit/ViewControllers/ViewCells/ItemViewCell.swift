//
//  ItemViewCell.swift
//  ToDoUIKit
//
//  Created by Ricardo Prestes on 21/09/25.
//

import UIKit

class ItemViewCell: UITableViewCell {
    
    static let identifier: String = "ItemViewCell"
    
    private let checkboxButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "circle"), for: .normal)
        return button
    }()
    
    private let titleLabel: UILabel =
    {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.textColor = .label
        return label
    }()
    
    private var isChecked = false
    
    var onToggle: (() -> Void)?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        
        checkboxButton.addTarget(self, action: #selector(toggleCheckbox), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        contentView.addSubviews(checkboxButton, titleLabel)
        
        let safeArea = contentView.safeAreaLayoutGuide
        
        checkboxButton
            .leading(equalTo: safeArea.leadingAnchor, constant: 16)
            .centerY(equalTo: safeArea.centerYAnchor)
            .width(28)
            .height(28)
        
        titleLabel
            .leading(equalTo: checkboxButton.trailingAnchor, constant: 16)
            .top(equalTo: safeArea.topAnchor, constant: 16)
            .trailing(equalTo: safeArea.trailingAnchor, constant: -16)
            .bottom(equalTo: safeArea.bottomAnchor, constant: -16)
    }
    
    func configure(item: ToDoItem) {
        titleLabel.text = item.title
        updateCheckbox(item: item)
    }
    
    func updateCheckbox(item: ToDoItem) {
        let imageName = item.done ? "checkmark.circle" : "circle"
        checkboxButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
    
    @objc func toggleCheckbox() {
        onToggle?()
    }
}
