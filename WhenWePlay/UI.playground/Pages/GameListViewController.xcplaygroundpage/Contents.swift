//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
import UIFramework

PlaygroundPage.current.needsIndefiniteExecution = true

let vm = GameListViewModel(games: [
    Game(uuid: UUID(), name: "THE GAME"),
    Game(uuid: UUID(), name: "THE GAME 2"),
    Game(uuid: UUID(), name: "THE NON GAME"),
    ])
let vc = GameListViewController.instantiate(viewModel: vm)

let (parent, _) = playgroundControllers(device: .pad, orientation: .portrait, child: vc)

PlaygroundPage.current.liveView = parent
