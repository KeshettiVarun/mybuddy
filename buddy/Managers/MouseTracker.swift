//
//  MouseTracker.swift
//  buddy
//
//  Created by Varun Keshetti on 26/07/26.
//
import AppKit

final class MouseTracker {

    static let shared = MouseTracker()

    private init() { }

    var location: CGPoint {
        NSEvent.mouseLocation
    }
}
