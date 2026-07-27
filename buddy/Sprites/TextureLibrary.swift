import SpriteKit

final class TextureLibrary {

    static let shared = TextureLibrary()

    private init() {}

    let idle = TextureLibrary.loadFrames(
        prefix: "idle",
        count: 8
    )

    let walk = TextureLibrary.loadFrames(
        prefix: "walk",
        count: 8
    )
    let run = TextureLibrary.loadFrames(prefix: "run", count: 10)
    let sit = TextureLibrary.loadFrames(prefix: "sit", count: 5)
    let sleep = TextureLibrary.loadFrames(prefix: "sleep", count: 6)
    let tailWag = TextureLibrary.loadFrames(prefix: "tailwag", count: 5)
    let play = TextureLibrary.loadFrames(prefix: "play", count: 7)
    let enterHouse: [SKTexture] = []

    private static func loadFrames(
        prefix: String,
        count: Int
    ) -> [SKTexture] {

        var textures: [SKTexture] = []

        for index in 1...count {

            let name = String(
                format: "%@_%02d",
                prefix,
                index
            )

            let texture = SKTexture(imageNamed: name)
            texture.filteringMode = .nearest


            textures.append(texture)
        }

        return textures
    }
}
