//
//  NotificationView.swift
//  WatchLandmarks Watch App
//
//  Created by main on 2023/9/24.
//  Copyright © 2023 Apple. All rights reserved.
//

import SwiftUI

struct NotificationView: View {
    var title: String?
    var message: String?
    var landmark: Landmark?

    var body: some View {
        VStack {
            if landmark != nil {
                CircleImage(image: landmark!.image.resizable())
                    .scaledToFit()
            }

            Text(title ?? "Unknown Landmark")
                .font(.headline)

            Divider()

            Text(message ?? "You are within 5 miles of one of your favorite landmarks.")
                .font(.caption)
        }
        .lineLimit(0)
    }
}

#Preview {
    Group {
//        NotificationView()
        NotificationView(
            title: "Turtle Rock",
            message: "You are within 5 miles of Turtle Rock.",
            landmark: ModelData().landmarks[0])
    }
}
