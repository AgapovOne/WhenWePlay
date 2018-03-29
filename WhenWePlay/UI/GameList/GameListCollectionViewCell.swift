//
//  GameListCollectionViewCell.swift
//  WhenWePlay
//
//  Created by Alex Agapov on 23/03/2018.
//  Copyright © 2018 Alex Agapov. All rights reserved.
//

import UIKit
import Cartography
import Reusable

final public class GameListCollectionViewCell: UICollectionViewCell, Reusable, ConfigurableCell {
    public typealias VM = GameViewModel

    lazy var titleLabel: UILabel = {
        let l = UILabel.createDefaultLabel()
        return l
    }()

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    func setup() {
        addSubview(titleLabel)
        constrain(titleLabel) { label in
            label.edges == label.superview!.edges.inseted(horizontally: 16)
        }

        layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
        layer.shadowRadius = 16.0
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.masksToBounds = false
        layer.shadowOpacity = 1

//        layer.shadowPath = UIBezierPath(rect: bounds).cgPath

        layer.shouldRasterize = true
    }

    public var viewModel: GameViewModel? {
        didSet {
            titleLabel.text = viewModel?.title
        }
    }

}

extension GameListCollectionViewCell: SizeableCell {
    public static func size(for model: GameViewModel) -> CGSize {
        return CGSize(width: (UIApplication.shared.keyWindow?.bounds ?? UIScreen.main.bounds).width - 32,
                      height: 80)
    }
}
