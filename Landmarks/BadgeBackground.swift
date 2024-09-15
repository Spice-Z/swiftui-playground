//
//  BadgeBackground.swift
//  Landmarks
//
//  Created by Yugo Ogura on 2024-09-15.
//

import SwiftUI

struct BadgeBackground: View {
    var body: some View {
        GeometryReader { geometry in Path { path in
            let width: CGFloat = min(geometry.size.width, geometry.size.height)
            let height = width
            path.move(
                to: CGPoint(
                    x: width * 0.95,
                    y: height * (0.20 + HexagonParameters.adjustment)
                )
            )
            
            HexagonParameters.segments.forEach { segment in
                path.addLine(
                    to: CGPoint(
                        x: width * segment.line.x,
                        y: height * segment.line.y
                    )
                )
                path.addQuadCurve(
                    to: CGPoint(
                        x: width * segment.curve.x,
                        y: height * segment.curve.y
                    ),
                    control: CGPoint(
                        x: width * segment.control.x,
                        y: height * segment.control.y
                    )
                )
            }
        }
        .fill(.linearGradient(
                        Gradient(colors: [Self.gradientStart, Self.gradientEnd]),
                        startPoint: UnitPoint(x: 0.5, y: 0),
                        endPoint: UnitPoint(x: 0.5, y: 0.6)
                    ))
        }.aspectRatio(1, contentMode: .fit)
    }
    static let gradientStart = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
        static let gradientEnd = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)
}

#Preview {
    BadgeBackground()
}
