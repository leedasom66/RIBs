//
//  LoggedInComponent+TicTacToe.swift
//  TicTacToe
//
//  Created by 이다솜 on 2023/07/24.
//  Copyright © 2023 Uber. All rights reserved.
//

import RIBs

/// The dependencies needed from the parent scope of LoggedIn to provide for the TicTacToe scope.
// TODO: Update LoggedInDependency protocol to inherit this protocol.
protocol LoggedInDependencyTicTacToe: Dependency {
    // TODO: Declare dependencies needed from the parent scope of LoggedIn to provide dependencies
    // for the TicTacToe scope.
}

extension LoggedInComponent: TicTacToeDependency {

    // TODO: Implement properties to provide for TicTacToe scope.
}
