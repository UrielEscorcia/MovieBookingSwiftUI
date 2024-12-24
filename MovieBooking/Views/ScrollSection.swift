//
//  ScrollSection.swift
//  MovieBooking
//
//  Created by Uriel  on 16/12/24.
//

import SwiftUI

struct ScrollSection: View {
    var title: String = "Now playing"
    let posters: [String]

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
                .foregroundStyle(.white)
                .padding(.horizontal, 20)

            ScrollView(.horizontal) {
                HStack(spacing: 20) {
                    ForEach(posters.indices, id: \.self) { index in
                        NavigationLink {
                            BookingView()
                        } label: {
                            Image(posters[index])
                                .resizable()
                                .frame(width: 100, height: 130)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                        }
                    }
                }
                .offset(x: 20)
                .padding(.trailing, 40)
            }
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    ScrollSection(posters: posters1)
}
