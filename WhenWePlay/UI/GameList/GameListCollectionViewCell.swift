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

final public class GameListCollectionViewCell: UICollectionViewCell, NibReusable {

    var titleLabel: UILabel = {
        let l = UILabel()
        return l
    }()

    var item: Item! {
        didSet {
            titleLabel.text = item
        }
    }

    public override func awakeFromNib() {
        super.awakeFromNib()

        addSubview(titleLabel)
        constrain(titleLabel) { label in
            label.edges == label.superview!.edges.inseted(horizontally: 16)
        }
    }

}
