//
//  NeedsManager.swift
//  buddy
//

import Foundation

final class NeedsManager {

    static let shared = NeedsManager()

    private init() {}

    // MARK: - Needs

    private(set) var energy: Double = 100
    private(set) var happiness: Double = 100
    private(set) var hunger: Double = 0

    // MARK: - Update

    func update(deltaTime: TimeInterval, currentState: BuddyState) {

        // Hunger slowly increases
        hunger += deltaTime * 0.2

        // Energy
        switch currentState {

        case .sleep:
            energy += deltaTime * 1.5

        default:
            energy -= deltaTime * 0.1
        }

        // Happiness
        switch currentState {

        case .play:
            happiness += deltaTime * 1.0

        case .eat:
            hunger -= deltaTime * 2.0
            happiness += deltaTime * 0.3

        default:
            happiness -= deltaTime * 0.05
        }

        clampValues()
    }

    // MARK: - Helpers

    private func clampValues() {

        hunger = min(max(hunger, 0), 100)
        energy = min(max(energy, 0), 100)
        happiness = min(max(happiness, 0), 100)
    }
}
