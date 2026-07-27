//
//  WorldObject.swift
//  buddy
//
//  Created by Varun Keshetti on 28/07/26.
//

//
//  WorldObject.swift
//  buddy
//

import SpriteKit

class WorldObject: SKSpriteNode {

    let objectID: String

    init(
        objectID: String,
        textureName: String,
        size: CGSize
    ) {

        self.objectID = objectID

        let texture = SKTexture(imageNamed: textureName)

        super.init(
            texture: texture,
            color: .clear,
            size: size
        )

        name = objectID
        zPosition = 0
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
