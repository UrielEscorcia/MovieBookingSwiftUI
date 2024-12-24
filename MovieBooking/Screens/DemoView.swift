//
//  DemoView.swift
//  MovieBooking
//
//  Created by Uriel  on 22/12/24.
//

import SwiftUI

struct DemoView: View {
    @State private var offset: CGSize = .zero
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .frame(width: 100, height: 100)
            .foregroundStyle(.blue)
            .offset(x: offset.width, y: offset.height)
            .gesture(DragGesture().onChanged { value in
                offset = value.translation
            }.onEnded { _ in
                withAnimation(.spring) {
                    offset = .zero
                }
            })
    }
}

#Preview {
    DemoView()
}
