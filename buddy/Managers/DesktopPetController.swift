//
//  DesktopPetController.swift
//  buddy
//
//  Created by Varun Keshetti on 26/07/26.
//

import AppKit
import CoreGraphics

final class DesktopPetController {

    static let shared = DesktopPetController()

    private init() {}

    var target = CGPoint.zero

    func updateTarget(_ point: CGPoint) {
        target = point
    }
}

