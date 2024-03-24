//
//  FieldLabel.swift
//  MyToDos
//
//  Created by Julia Gurbanova on 06.03.2024.
//

import UIKit

class FieldLabel: UILabel {
    required init(title: String) {
        super.init(frame: .zero)

        translatesAutoresizingMaskIntoConstraints = false
        textAlignment = .left
        font = .systemFont(ofSize: 21, weight: .light)
        textColor = .grayText
        text = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
