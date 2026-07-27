//
//  MovementController.swift
//  buddy
//
//  Created by Varun Keshetti on 26/07/26.
//
import CoreGraphics

final class MovementController {

    var velocity = CGPoint.zero

    let maxSpeed: CGFloat = 8
    let acceleration: CGFloat = 0.45
    let friction: CGFloat = 0.82

    func update(position: CGPoint, target: CGPoint) -> CGPoint {

        var velocity = self.velocity

        let dx = target.x - position.x
        let dy = target.y - position.y

        let distance = sqrt(dx * dx + dy * dy)

        let stopDistance: CGFloat = 30

        if distance > stopDistance {

            let speed = min(maxSpeed, (distance - stopDistance) * 0.2)

            let desiredX = dx / distance * speed
            let desiredY = dy / distance * speed

            velocity.x += (desiredX - velocity.x) * acceleration
            velocity.y += (desiredY - velocity.y) * acceleration

        } else {

            velocity.x *= friction
            velocity.y *= friction
        }

        self.velocity = velocity

        return CGPoint(
            x: position.x + velocity.x,
            y: position.y + velocity.y
        )
    }
}
