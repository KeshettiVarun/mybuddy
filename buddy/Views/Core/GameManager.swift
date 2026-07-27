//
//  GameManager.swift
//  buddy
//
//  Created by Varun Keshetti on 27/07/26.
//

//
//  GameManager.swift
//  buddy
//

import Foundation

final class GameManager {

    static let shared = GameManager()

    private init() {}

    func update(deltaTime: TimeInterval, buddy: BuddyNode) {

        // Update Buddy's needs
        NeedsManager.shared.update(
            deltaTime: deltaTime,
            currentState: buddy.state
        )

        // Future:
        // WorldManager.shared.update(...)
        // InteractionManager.shared.update(...)
        // AIManager.shared.update(...)
    }
}
