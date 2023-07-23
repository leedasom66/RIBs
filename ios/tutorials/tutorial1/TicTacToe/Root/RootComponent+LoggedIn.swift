//
//  RootComponent+LoggedIn.swift
//  TicTacToe
//
//  Created by 이다솜 on 2023/07/24.
//  Copyright © 2023 Uber. All rights reserved.
//

import RIBs

/// The dependencies needed from the parent scope of Root to provide for the LoggedIn scope.
// TODO: Update RootDependency protocol to inherit this protocol.
protocol RootDependencyLoggedIn: Dependency {
    // TODO: Declare dependencies needed from the parent scope of Root to provide dependencies
    // for the LoggedIn scope.
}

extension RootComponent: LoggedInDependency {

    // TODO: Implement properties to provide for LoggedIn scope.
    var LoggedInViewController: LoggedInViewControllable {
        return rootViewController
    }
}
