//
//  MainButton.swift
//  MyToDos
//
//  Created by Julia Gurbanova on 05.03.2024.
//

import UIKit

class MainButton: UIButton {
    required init(title: String, color: UIColor) {
        super.init(frame: .zero)

        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 10
        backgroundColor = color
        setTitle(title, for: .normal)
        titleLabel?.font = .systemFont(ofSize: 28, weight: .light)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
