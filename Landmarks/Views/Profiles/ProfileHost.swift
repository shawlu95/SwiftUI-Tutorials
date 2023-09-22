//
//  ProfileHost.swift
//  Landmarks
//
//  Created by main on 2023/9/22.
//  Copyright © 2023 Apple. All rights reserved.
//

import SwiftUI

struct ProfileHost: View {
    @State private var draftProfile = Profile.default


    var body: some View {
        Text("Profile for: \(draftProfile.username)")
    }
}

#Preview {
    ProfileHost()
}
