//
//  StatusUI.swift
//  MovieBooking
//
//  Created by Willie Yam on 2022-08-19.
//

import SwiftUI

struct StatusUI: View {
    @State var color: Color = Color(.white)
    @State var text: String = "Available"
    
    var body: some View {
        HStack(spacing: 10.0) {
            Circle()
                .frame(width: 10, height: 10)
                .foregroundStyle(color)
            
            Text(text)
                .font(.subheadline)
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    StatusUI(color: .lightBlue)
}
