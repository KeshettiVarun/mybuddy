//
//  WindowAccessor.swift
//  buddy
//
import SwiftUI
import AppKit

struct WindowAccessor: NSViewRepresentable {

    func makeNSView(context: Context) -> NSView {

        let view = NSView()

        DispatchQueue.main.async {

            if let window = view.window {

                WindowManager.shared.register(window: window)
                WindowManager.shared.makeTransparent()            }
        }

        return view
    }

    func updateNSView(_ nsView: NSView, context: Context) { }
}
//  Created by Varun Keshetti on 25/07/26.
//

