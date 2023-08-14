//
//  BadgeSymbol.swift
//  Landmarks
//
//  Created by main on 8/15/23.
//  Copyright © 2023 Apple. All rights reserved.
//

import SwiftUI

struct BadgeSymbol: View {
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let width = min(geometry.size.width, geometry.size.height)
                let height = width * 0.75
                let spacing = width * 0.030 // to top
                let middle = width * 0.5
                let topWidth = width * 0.226
                let topHeight = height * 0.488

                path.addLines([
                    CGPoint(x: middle, y: spacing), // top
                    CGPoint(x: middle - topWidth, y: topHeight - spacing), // lower left
                    CGPoint(x: middle, y: topHeight / 2 + spacing), // lower middle
                    CGPoint(x: middle + topWidth, y: topHeight - spacing), // lower right
                    CGPoint(x: middle, y: spacing)
                ])
                
                path.move(to: CGPoint(x: middle, y: topHeight / 2 + spacing * 3))
                path.addLines([
                    CGPoint(x: middle - topWidth, y: topHeight + spacing),
                    CGPoint(x: spacing, y: height - spacing), // lower left
                    CGPoint(x: width - spacing, y: height - spacing), // lower right
                    CGPoint(x: middle + topWidth, y: topHeight + spacing),
                    CGPoint(x: middle, y: topHeight / 2 + spacing * 3) // top
                ])
            }
        }
    }
}

#Preview {
    BadgeSymbol()
}
