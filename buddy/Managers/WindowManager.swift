import AppKit

final class WindowManager {

    static let shared = WindowManager()

    private init() { }

    weak var window: NSWindow?

    func register(window: NSWindow) {
        self.window = window
    }

    func makeTransparent() {

        guard let window else { return }

        // Transparent window
        window.isOpaque = false
        window.backgroundColor = .clear
        window.hasShadow = false

        // Remove title bar completely
        window.titleVisibility = .hidden
        window.titlebarAppearsTransparent = true

        // Make it borderless
        window.styleMask = [.borderless]

        // Float above normal windows
        window.level = .floating

        // Don't activate the app when clicked
        window.collectionBehavior = [
            .canJoinAllSpaces,
            .fullScreenAuxiliary
        ]
    }
}
