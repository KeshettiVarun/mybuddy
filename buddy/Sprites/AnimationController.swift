import SpriteKit

final class AnimationController {

    private let animationKey = "BuddyAnimation"

    func play(_ state: BuddyState, on buddy: BuddyNode) {

        // Don't replay the same animation
        guard buddy.state != state else {
            return
        }

        // Update Buddy's state through the state machine
        buddy.state = state

        // Stop current animation
        buddy.removeAction(forKey: animationKey)

        let animation = animationData(for: state)

        guard !animation.textures.isEmpty else {
            return
        }

        buddy.texture = animation.textures.first

        let animate = SKAction.animate(
            with: animation.textures,
            timePerFrame: animation.frameTime,
            resize: false,
            restore: false
        )

        buddy.run(
            .repeatForever(animate),
            withKey: animationKey
        )
    }

    // MARK: - Animation Lookup

    private func animationData(for state: BuddyState) -> (textures: [SKTexture], frameTime: TimeInterval) {

        switch state {

        case .idle:
            return (TextureLibrary.shared.idle, 0.15)

        case .walk:
            return (TextureLibrary.shared.walk, 0.10)

        case .run:
            return (TextureLibrary.shared.run, 0.10)

        case .sit:
            return (TextureLibrary.shared.sit, 0.15)

        case .sleep:
            return (TextureLibrary.shared.sleep, 0.20)

        case .tailWag:
            return (TextureLibrary.shared.tailWag, 0.12)

        case .play:
            return (TextureLibrary.shared.play, 0.10)

        case .eat:
            return (TextureLibrary.shared.idle, 0.15)

        case .goingHome:
            // Walking home uses the walk animation
            return (TextureLibrary.shared.walk, 0.10)

        case .insideHouse:
            // Buddy isn't visible inside the house yet,
            // but return the sleep animation for now.
            return (TextureLibrary.shared.sleep, 0.20)
        }
    
    }
}
