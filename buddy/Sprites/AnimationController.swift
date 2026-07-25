import SpriteKit

final class AnimationController {

    enum State {
        case idle
        case walk
        case run
        case sleep
    }

    private(set) var currentState: State = .idle

    func play(_ state: State, on buddy: SKSpriteNode) {

        guard currentState != state else { return }

        currentState = state

        buddy.removeAllActions()

        switch state {

        case .idle:

            buddy.setScale(1.0)

        case .walk:

            buddy.setScale(1.05)

        case .run:

            buddy.setScale(1.10)

        case .sleep:

            buddy.setScale(0.95)
        }
    }
}
