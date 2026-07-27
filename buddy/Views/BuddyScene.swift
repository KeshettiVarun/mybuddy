//
//  BuddyScene.swift
//  buddy
//

import SpriteKit
import AppKit

final class BuddyScene: SKScene {

    private let buddy = BuddyNode()
    private let house = DogHouse()
    private let movementController = MovementController()

    private var idleTimer: TimeInterval = 0
    private var behaviorTimer: TimeInterval = 0
    private var lastUpdateTime: TimeInterval = 0

    private var lastMousePosition = CGPoint.zero

    override func didMove(to view: SKView) {

        backgroundColor = .clear

        if let screen = NSScreen.main {
            size = screen.frame.size
        }

        // Position the dog house (Bottom Left)
        house.position = CGPoint(
            x: house.size.width / 2 + 40,
            y: house.size.height / 2 + 40
        )

        // Position Buddy
        buddy.position = CGPoint(
            x: size.width / 2,
            y: size.height / 2
        )

        addChild(house)
        addChild(buddy)

        buddy.animation.play(.idle, on: buddy)
    }

    override func update(_ currentTime: TimeInterval) {

        let deltaTime = currentTime - lastUpdateTime
        lastUpdateTime = currentTime

        GameManager.shared.update(
            deltaTime: deltaTime,
            buddy: buddy
        )

        // Mouse position
        let mouse = MouseTracker.shared.location

        let mouseMoved = hypot(
            mouse.x - lastMousePosition.x,
            mouse.y - lastMousePosition.y
        )

        if mouseMoved > 5 {

            if buddy.state == .sleep &&
                NeedsManager.shared.energy >= 80 {

                behaviorTimer = 0
                idleTimer = 0
                buddy.animation.play(.idle, on: buddy)

            } else if buddy.state == .sit ||
                        buddy.state == .play ||
                        buddy.state == .eat {

                behaviorTimer = 0
                idleTimer = 0
                buddy.animation.play(.idle, on: buddy)
            }
        }

        lastMousePosition = mouse

        guard let view = self.view,
              let window = view.window else {
            return
        }

        let windowPoint = window.convertPoint(fromScreen: mouse)
        let scenePoint = convertPoint(fromView: windowPoint)

        DesktopPetController.shared.updateTarget(scenePoint)

        let velocityX = movementController.velocity.x

        if abs(velocityX) > 1.5 {

            if velocityX > 0 {
                buddy.xScale = -abs(buddy.xScale)
            } else {
                buddy.xScale = abs(buddy.xScale)
            }
        }

        // Move Buddy only when allowed
        if buddy.state != .sleep &&
            buddy.state != .eat {

            buddy.position = movementController.update(
                position: buddy.position,
                target: scenePoint
            )
        }

        let speed = sqrt(
            movementController.velocity.x * movementController.velocity.x +
            movementController.velocity.y * movementController.velocity.y
        )

        if buddy.state == .idle {

            if mouseMoved < 1 {
                idleTimer += deltaTime
            } else {
                idleTimer = 0
            }

        } else {

            idleTimer = 0
        }

        if buddy.state != .idle {

            behaviorTimer += deltaTime

            let duration: TimeInterval

            switch buddy.state {

            case .sleep:
                duration = 8

            case .play:
                duration = 4

            case .sit:
                duration = 3

            case .eat:
                duration = 3

            default:
                duration = 3
            }

            if behaviorTimer > duration {

                behaviorTimer = 0

                if buddy.state == .sleep &&
                    NeedsManager.shared.energy < 80 {
                    return
                }

                if buddy.state == .eat &&
                    NeedsManager.shared.hunger > 10 {
                    return
                }

                let nextState = BehaviorManager.shared.nextState()

                buddy.animation.play(nextState, on: buddy)
            }
        }

        if idleTimer > 5 {

            idleTimer = 0

            let state = BehaviorManager.shared.nextState()

            buddy.animation.play(state, on: buddy)
        }

        // Automatic movement animations
        switch buddy.state {

        case .sleep,
             .sit,
             .play,
             .tailWag,
             .eat:
            break

        default:

            if speed < 0.5 {
                buddy.animation.play(.idle, on: buddy)

            } else if speed < 6 {

                buddy.animation.play(.walk, on: buddy)

            } else {

                buddy.animation.play(.run, on: buddy)
            }
        }
    }
}
