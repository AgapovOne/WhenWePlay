//
//  UIView+Extensions.swift
//  WhenWePlay
//
//  Created by Alex Agapov on 30/03/2018.
//  Copyright © 2018 Alex Agapov. All rights reserved.
//

import UIKit

extension UIView {
    func addDefaultWhiteShadow(backgroundColor: UIColor = .white,
                               cornerRadius: CGFloat = 8) {
        self.backgroundColor = backgroundColor

        layer.cornerRadius = cornerRadius

        addShadow()
    }

    func addShadow(color: CGColor = UIColor.black.withAlphaComponent(0.25).cgColor,
                   size: CGSize = CGSize(width: 0.0, height: 2.0),
                   opacity: Float = 1.0,
                   radius: CGFloat = 16.0) {
        layer.shadowColor = color
        layer.shadowOffset = size
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius

        layer.masksToBounds = false
    }
}
