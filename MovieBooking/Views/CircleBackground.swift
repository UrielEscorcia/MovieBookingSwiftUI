//
//  CircleBackground.swift
//  MovieBooking
//
//  Created by Willie Yam on 2022-08-16.
//

import SwiftUI

struct CircleBackground: View {
    @State var color: Color = .greenCircle
    
    var body: some View {
        Circle()
            .frame(width: 300, height: 300)
            .foregroundStyle(color)
    }
}

#Preview {
    CircleBackground()
}
