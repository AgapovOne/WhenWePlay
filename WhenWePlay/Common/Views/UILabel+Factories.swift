//
//  UILabel+Factories.swift
//  WhenWePlay
//
//  Created by Aleksey Agapov on 27/03/2018.
//  Copyright © 2018 Alex Agapov. All rights reserved.
//

import UIKit

extension UILabel {
    static func createDefaultLabel() -> UILabel {
        let l = UILabel(frame: .zero)
        l.textColor = UIColor.black.withAlphaComponent(0.8)
        l.font = UIFont.preferredFont(forTextStyle: .body)
        return l
    }

    static func createCaptionLabel() -> UILabel {
        let l = UILabel(frame: .zero)
        l.textColor = UIColor.black.withAlphaComponent(0.6)
        l.font = UIFont.preferredFont(forTextStyle: .caption1)
        return l
    }
}
