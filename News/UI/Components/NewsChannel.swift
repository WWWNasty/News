//
// Created by Настя on 11.06.2020.
// Copyright (c) 2020 Настя. All rights reserved.
//
import SwiftUI
import Foundation

struct NewsChannel: View {
    var title: String
    var description: String

    var body: some View {
        HStack {
            VStack {
                //star!!!!!!!
                Text(title).bold()
                Text(description)
            }
            Spacer()
            Image(systemName: "star").font(.system(size: 16, weight: .regular))
            Image(systemName: "star.fill").font(.system(size: 16, weight: .regular))
        }

    }
}


