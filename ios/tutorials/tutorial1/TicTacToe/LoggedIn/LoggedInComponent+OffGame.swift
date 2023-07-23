//
//  LoggedInComponent+OffGame.swift
//  TicTacToe
//
//  Created by 이다솜 on 2023/07/24.
//  Copyright © 2023 Uber. All rights reserved.
//

import RIBs

/// The dependencies needed from the parent scope of LoggedIn to provide for the OffGame scope.
// TODO: Update LoggedInDependency protocol to inherit this protocol.
protocol LoggedInDependencyOffGame: Dependency {
    // TODO: Declare dependencies needed from the parent scope of LoggedIn to provide dependencies
    // for the OffGame scope.
}

extension LoggedInComponent: OffGameDependency {

    // TODO: Implement properties to provide for OffGame scope.
}
