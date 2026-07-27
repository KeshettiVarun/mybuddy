//
//  BuddyStateMachine.swift
//  buddy
//
//  Created by Varun Keshetti on 27/07/26.
//

import Foundation

final class BuddyStateMachine {

    private(set) var currentState: BuddyState = .idle

    func transition(to newState: BuddyState) {

        guard currentState != newState else {
            return
        }

        currentState = newState
    }

    func isInState(_ state: BuddyState) -> Bool {
        currentState == state
    }
}
