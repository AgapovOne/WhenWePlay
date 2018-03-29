//
//  UIButton+Factories.swift
//  WhenWePlay
//
//  Created by Alex Agapov on 23/03/2018.
//  Copyright © 2018 Alex Agapov. All rights reserved.
//

import UIKit

extension UIButton {
    static func createDefaultButton(title: String) -> UIButton {
        let btn = UIButton(frame: .zero)
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(.red, for: .normal)

        btn.setTitleColor(UIColor.red.withAlphaComponent(0.6), for: .highlighted)

        btn.backgroundColor = .white
        btn.layer.cornerRadius = 8

        btn.contentEdgeInsets = UIEdgeInsetsMake(16, 32, 16, 32)

        btn.layer.shadowColor = UIColor.black.withAlphaComponent(0.25).cgColor
        btn.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        btn.layer.shadowOpacity = 1.0
        btn.layer.shadowRadius = 16.0
        btn.layer.masksToBounds = false

        return btn
    }
}
