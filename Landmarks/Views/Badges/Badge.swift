//
//  Badge.swift
//  Landmarks
//
//  Created by main on 8/15/23.
//  Copyright © 2023 Apple. All rights reserved.
//

import SwiftUI

struct Badge: View {
    var badgeSymbols: some View {
        RotatedBadgeSymbol(angle: Angle(degrees: 0))
            .opacity(0.5)
    }
    var body: some View {
        ZStack {
            BadgeBackground()
            badgeSymbols
        }
    }
}

#Preview {
    Badge()
}
