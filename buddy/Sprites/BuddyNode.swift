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

    // MARK: - Animation

    let animation = AnimationController()

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
}
