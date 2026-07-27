//
//  BehaviorManager.swift
//  buddy
//

import Foundation

final class BehaviorManager {

    static let shared = BehaviorManager()

    private init() {}

    // MARK: - Decision Making

    func nextState(using needs: NeedsManager) -> BuddyState {

        // Highest priority: Sleep
        if needs.energy < 20 {
            return .sleep
        }

        // Second priority: Eat
        if needs.hunger > 70 {
            return .eat
        }

        // Third priority: Play
        if needs.happiness < 30 {
            return .play
        }

        // Otherwise relax
        return [.idle, .sit].randomElement()!
    }

    // MARK: - Convenience

    func nextState() -> BuddyState {
        nextState(using: NeedsManager.shared)
    }
}
