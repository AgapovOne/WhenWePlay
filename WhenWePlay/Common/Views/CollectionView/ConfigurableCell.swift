//
//  ConfigurableCell.swift
//  TempuraElements
//
//  Created by Andrea De Angelis on 10/01/2018.
//

import Reusable

// a configurableCell is a ReusableCell that can be configured with an object T and the indexPath
// this will be used when it's time to load the cell content
protocol ConfigurableCell: Reusable {
    associatedtype VM: CellViewModel

    var viewModel: VM? { get set }
}
