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
import Hero

final class GameListCollectionViewCell: UICollectionViewCell, Reusable, ConfigurableCell {
    typealias VM = GameViewModel

    lazy var titleLabel: UILabel = {
        let l = UILabel.createDefaultLabel()
        return l
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    func setup() {
        addSubview(titleLabel)
        constrain(titleLabel) { label in
            label.edges == label.superview!.edges.inseted(horizontally: 16)
        }

        backgroundColor = .white

        layer.cornerRadius = 8

        addShadow()
    }

    var viewModel: GameViewModel? {
        didSet {
            titleLabel.hero.id = "\(viewModel?.hashValue)"
            titleLabel.text = viewModel?.title
        }
    }

}

extension GameListCollectionViewCell: SizeableCell {
    static func size(for model: GameViewModel) -> CGSize {
        return CGSize(width: (UIApplication.shared.keyWindow?.bounds ?? UIScreen.main.bounds).width - 32,
                      height: 80)
    }
}
