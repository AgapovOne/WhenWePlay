//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
import UIFramework

PlaygroundPage.current.needsIndefiniteExecution = true

let vc = GameListViewController.instantiate()

let (parent, _) = playgroundControllers(device: .phone4_7inch, orientation: .portrait, child: vc)

PlaygroundPage.current.liveView = parent
