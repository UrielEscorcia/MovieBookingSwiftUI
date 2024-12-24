//
//  LargeButton.swift
//  MovieBooking
//
//  Created by Willie Yam on 2022-08-19.
//

import SwiftUI

struct LargeButton: View {
    var selectedBorderColors: [Color] = [Color("pink"), Color("pink").opacity(0), Color("pink").opacity(0)]
    
    var body: some View {
        Text("Reservation")
            .font(.body)
            .fontWeight(.medium)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity, maxHeight: 60)
            .background(LinearGradient(colors: [Color("majenta"), Color("purple")], startPoint: .topLeading, endPoint: .bottomTrailing))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .overlay {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(LinearGradient(colors: selectedBorderColors, startPoint: .topLeading, endPoint: .bottomTrailing), style: StrokeStyle(lineWidth: 2))
                    .frame(maxWidth: .infinity, maxHeight: 58)
            }
    }
}

#Preview {
    LargeButton()
}

