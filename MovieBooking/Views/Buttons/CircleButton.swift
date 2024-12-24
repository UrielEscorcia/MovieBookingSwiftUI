//
//  CircleButton.swift
//  MovieBooking
//
//  Created by Uriel  on 11/12/24.
//

import SwiftUI

struct CircleButton: View {
    @State var action: () -> Void
    @State var image: String = "arrow.left"

    var gradient: [Color] = [.cyan, .cyan.opacity(0.1), .cyan]

    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: image)
                .frame(width: 44, height: 44)
                .background(.ultraThinMaterial)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .overlay {
                    Circle()
                        .trim(from: 0, to: CGFloat(0.5))
                        .stroke(
                            LinearGradient(colors: gradient, startPoint: .top, endPoint: .bottom), style: StrokeStyle(lineWidth: 2)
                        )
                        .rotationEffect(.degrees(135))
                        .frame(width: 44, height: 44)
                }
        }
    }
}

#Preview {
    CircleButton {
        print("Circle Button")
    }
}
