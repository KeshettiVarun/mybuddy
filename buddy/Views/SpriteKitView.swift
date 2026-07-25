//
//  SpriteKitView.swift
//  buddy
//
//  Created by Varun Keshetti on 26/07/26.
//

import SwiftUI
import SpriteKit

struct SpriteKitView: NSViewRepresentable {

    func makeNSView(context: Context) -> SKView {

        let skView = SKView()

        // This is supported on macOS
        skView.allowsTransparency = true

        let scene = BuddyScene()
        scene.scaleMode = .resizeFill
        scene.backgroundColor = .clear

        skView.presentScene(scene)

        return skView
    }

    func updateNSView(_ nsView: SKView, context: Context) { }
}

