//
//  BuddyAIController.swift
//  buddy
//

import SpriteKit

final class BuddyAIController {

    enum Mode {
        case followMouse
        case goingHome
        case sleeping
    }

    private(set) var mode: Mode = .followMouse

    private let homeEnergyThreshold: Double = 20
    private let wakeEnergyThreshold: Double = 80

    func currentTarget(
        mouse: CGPoint,
        house: DogHouse
    ) -> CGPoint {

        switch mode {

        case .followMouse:
            return mouse

        case .goingHome:
            return house.entrancePoint

        case .sleeping:
            return house.sleepingPoint
        }
    }

    func update(
        buddy: BuddyNode,
        house: DogHouse
    ) {

        switch mode {

        case .followMouse:

            if NeedsManager.shared.energy <= homeEnergyThreshold {
                mode = .goingHome
            }

        case .goingHome:

            let distance = hypot(
                buddy.position.x - house.entrancePoint.x,
                buddy.position.y - house.entrancePoint.y
            )

            if distance < 10 {

                buddy.animation.play(.sleep, on: buddy)
                buddy.position = house.sleepingPoint

                mode = .sleeping
            }

        case .sleeping:

            if NeedsManager.shared.energy >= wakeEnergyThreshold {

                buddy.position = house.entrancePoint
                buddy.animation.play(.idle, on: buddy)

                mode = .followMouse
            }
        }
    }

    func reset() {
        mode = .followMouse
    }
}
