//
//  ViewModel.swift
//  WhenWePlay
//
//  Created by Alex Agapov on 26/03/2018.
//  Copyright © 2018 Alex Agapov. All rights reserved.
//

import UIKit

protocol CellViewModel {}

protocol SizeableCell: ConfigurableCell {
    static func size(for model: VM) -> CGSize
}
