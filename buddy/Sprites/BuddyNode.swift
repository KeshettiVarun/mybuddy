import SpriteKit

final class BuddyNode: SKSpriteNode {

    let animation = AnimationController()

    init() {

        let texture = SKTexture(imageNamed: "BuddySpriteSheet")
        texture.filteringMode = .linear

        super.init(
            texture: texture,
            color: .clear,
            size: CGSize(width: 140, height: 140)
        )
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
