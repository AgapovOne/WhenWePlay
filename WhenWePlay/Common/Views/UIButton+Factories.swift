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
        btn.backgroundColor = .white
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(.red, for: .normal)

        btn.setTitleColor(UIColor.red.withAlphaComponent(0.6), for: .highlighted)

        btn.addDefaultStyles()

        return btn
    }

    static func createAlternateButton(title: String) -> UIButton {
        let btn = UIButton(frame: .zero)
        btn.backgroundColor = .red
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(.white, for: .normal)

        btn.setTitleColor(UIColor.white.withAlphaComponent(0.6), for: .highlighted)

        btn.addDefaultStyles()

        return btn
    }

    private func addDefaultStyles() {
        layer.cornerRadius = 8
        layer.masksToBounds = false

        contentEdgeInsets = UIEdgeInsetsMake(16, 32, 16, 32)
    }
}
