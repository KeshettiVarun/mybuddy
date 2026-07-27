//
//  DogHouse.swift
//  buddy
//

import SpriteKit

final class DogHouse: WorldObject {

    /// Position where Buddy should stand before entering the house.
    var entrancePoint: CGPoint {
        CGPoint(
            x: position.x,
            y: position.y - 35
        )
    }

    /// Position where Buddy sleeps inside the house.
    var sleepingPoint: CGPoint {
        CGPoint(
            x: position.x,
            y: position.y
        )
    }

    init() {

        super.init(
            objectID: "DogHouse",
            textureName: "DogHouse",
            size: CGSize(width: 230, height: 230)
        )

        zPosition = 0
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
