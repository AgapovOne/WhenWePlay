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

        btn.contentEdgeInsets = UIEdgeInsetsMake(16, 32, 16, 32)

        btn.addDefaultWhiteShadow()

        return btn
    }
}
