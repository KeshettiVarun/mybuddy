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
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Movement

    func moveToward(_ target: CGPoint) {

        guard state != .sleep,
              state != .eat else {
            return
        }

        position = movementController.update(
            position: position,
            target: target
        )

        let velocityX = movementController.velocity.x

        if abs(velocityX) > 1.5 {

            if velocityX > 0 {
                xScale = -abs(xScale)
            } else {
                xScale = abs(xScale)
            }
        }
    }

    var movementSpeed: CGFloat {

        sqrt(
            movementController.velocity.x * movementController.velocity.x +
            movementController.velocity.y * movementController.velocity.y
        )
    }
}
