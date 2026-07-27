//
//  BuddyNode.swift
//  buddy
//

import SpriteKit

final class BuddyNode: SKSpriteNode {

    // MARK: - State

    let stateMachine = BuddyStateMachine()

    var state: BuddyState {
        get {
            stateMachine.currentState
        }
        set {
            stateMachine.transition(to: newValue)
        }
    }

    // MARK: - Components

    let animation = AnimationController()
    private let movementController = MovementController()

    // MARK: - Initialization

    init() {

        let idleFrames = TextureLibrary.shared.idle

        super.init(
            texture: idleFrames.first,
            color: .clear,
            size: idleFrames.first?.size() ?? CGSize(width: 220, height: 220)
        )

        name = "Buddy"
        zPosition = 100
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Movement

    func moveToward(_ target: CGPoint) {

        guard state != .sleep else {
            return
        }

        let previousPosition = position

        position = movementController.update(
            position: position,
            target: target
        )

        let dx = position.x - previousPosition.x

        if abs(dx) > 1 {

            if dx > 0 {
                xScale = -abs(xScale)
            } else {
                xScale = abs(xScale)
            }
        }
    }

    // MARK: - Helpers

    var movementSpeed: CGFloat {

        hypot(
            movementController.velocity.x,
            movementController.velocity.y
        )
    }

    func stopMoving() {

        movementController.velocity = .zero
    }
}
