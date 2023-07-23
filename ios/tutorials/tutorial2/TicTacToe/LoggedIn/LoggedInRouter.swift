//
//  LoggedInRouter.swift
//  TicTacToe
//
//  Created by 이다솜 on 2023/07/23.
//  Copyright © 2023 Uber. All rights reserved.
//

import RIBs

protocol LoggedInInteractable: Interactable, OffGameListener {
    var router: LoggedInRouting? { get set }
    var listener: LoggedInListener? { get set }
}

protocol LoggedInViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
    func present(viewController: ViewControllable)
    func dismiss(viewController: ViewControllable)
}

final class LoggedInRouter: ViewableRouter<LoggedInInteractable, LoggedInViewControllable>, LoggedInRouting {

    private let offGameBuilder: OffGameBuildable
    private var currentChild: ViewableRouting?
    
    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: LoggedInInteractable, viewController: LoggedInViewControllable, offGameBuilder: OffGameBuildable) {
        self.viewController = viewController
        self.offGameBuilder = offGameBuilder
        super.init(interactor: interactor)
        interactor.router = self
    }
    
    override func didLoad() {
        super.didLoad()
        attachOffGame()
    }
    
    func attachOffGame() {
        let offGame = offGameBuilder.build(withListener: interactor)
        self.currentChild = offGame
        attachChild(offGame)
        viewController.present(viewController: offGame.viewControllable)
    }
    
    func cleanupViews() {
        if let currentChild = currentChild {
            viewController.dismiss(viewController: currentChild.viewControllable)
        }
    }
}
