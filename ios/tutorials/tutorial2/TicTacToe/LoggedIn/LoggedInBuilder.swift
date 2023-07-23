//
//  LoggedInBuilder.swift
//  TicTacToe
//
//  Created by 이다솜 on 2023/07/23.
//  Copyright © 2023 Uber. All rights reserved.
//

import RIBs

protocol LoggedInDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    var loggedInViewController: LoggedInViewControllable { get }
}

final class LoggedInComponent: Component<LoggedInDependency>, OffGameDependency {

    let player1Name: String
    let player2Name: String
    
    init(dependency: LoggedInDependency, player1Name: String, player2Name: String) {
        self.player1Name = player1Name
        self.player2Name = player2Name
        super.init(dependency: dependency)
    }
    
    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
    fileprivate var loggedInViewController: LoggedInViewControllable {
        return dependency.loggedInViewController
    }

}

// MARK: - Builder

protocol LoggedInBuildable: Buildable {
    func build(withListener listener: LoggedInListener,
               player1Name: String,
               player2Name: String) -> LoggedInRouting
}

final class LoggedInBuilder: Builder<LoggedInDependency>, LoggedInBuildable {

    override init(dependency: LoggedInDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: LoggedInListener, player1Name: String, player2Name: String) -> LoggedInRouting {
        let component = LoggedInComponent(dependency: dependency,
                                          player1Name: player1Name,
                                          player2Name: player2Name)
        let interactor = LoggedInInteractor()
        interactor.listener = listener
        
        let offGameBuilder = OffGameBuilder(dependency: component)
        return LoggedInRouter(interactor: interactor, viewController: component.loggedInViewController, offGameBuilder: offGameBuilder)
    }
}
