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

public struct GameViewModel: CellViewModel {
    var id: UUID
    var title: String

    init(_ game: Game) {
        id = game.uuid
        title = game.name
    }
}

extension GameViewModel: Hashable, AutoEquatable {
    public var hashValue: Int {
        return id.hashValue
    }
}

final public class GameListCollectionViewCell: UICollectionViewCell, Reusable, ConfigurableCell {
    public typealias VM = GameViewModel

    var titleLabel: UILabel = {
        let l = UILabel(frame: .zero)
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
        backgroundColor = .red

        addSubview(titleLabel)
        constrain(titleLabel) { label in
            label.edges == label.superview!.edges.inseted(horizontally: 16)
        }

        let view = UIView()
        view.backgroundColor = .green
        addSubview(view)
        constrain(view) { (view) in
            view.width == 50
            view.right == view.superview!.right
            view.top == view.superview!.top
            view.bottom == view.superview!.bottom
        }
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
