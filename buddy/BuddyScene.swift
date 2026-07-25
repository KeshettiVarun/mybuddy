import SpriteKit

final class BuddyScene: SKScene {

    private let buddy = BuddyNode()

    override func didMove(to view: SKView) {

        backgroundColor = .clear

        buddy.position = CGPoint(
            x: size.width / 2,
            y: size.height / 2
        )

        addChild(buddy)
    }

    override func update(_ currentTime: TimeInterval) {

        // Mouse position in screen coordinates
        let mouse = MouseTracker.shared.location

        guard let view = self.view,
              let window = view.window else {
            return
        }

        // Convert screen → window
        let windowPoint = window.convertPoint(fromScreen: mouse)

        // Convert window → SpriteKit scene
        let scenePoint = convertPoint(fromView: windowPoint)

        let dx = scenePoint.x - buddy.position.x
        let dy = scenePoint.y - buddy.position.y
        let distance = sqrt(dx * dx + dy * dy)

        if distance > 5 {

            buddy.animation.play(.walk, on: buddy)

            let speed: CGFloat = 6

            buddy.position.x += dx / distance * speed
            buddy.position.y += dy / distance * speed

        } else {

            buddy.animation.play(.idle, on: buddy)
        }
    }
}
