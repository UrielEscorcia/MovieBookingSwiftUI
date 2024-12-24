//
//  HomeView.swift
//  MovieBooking
//
//  Created by Uriel  on 16/12/24.
//

import SwiftUI

struct HomeView: View {
    @State var animate: Bool = false
    
    var body: some View {
        ZStack {
            CircleBackground(color: .greenCircle)
                .blur(radius: animate ? 30 : 100)
                .offset(x: animate ? -50 : -130, y: animate ? -30 : -100)
                .task {
                    withAnimation(.easeInOut(duration: 7).repeatForever()) {
                        animate.toggle()
                    }
                }
            
            CircleBackground(color: .pinkCircle)
                .blur(radius: animate ? 30 : 100)
                .offset(x: animate ? 100 : 130, y: animate ? 150 : 100)
            
            VStack(spacing: 0) {
                Text("Choose Movie")
                    .fontWeight(.bold)
                    .font(.title3)
                    .foregroundStyle(.white)
                
                CustomSearchBar()
                    .padding(EdgeInsets(top: 30, leading: 20, bottom: 20, trailing: 20))
                
                ScrollView {
                    VStack(spacing: 20) {
                        ScrollSection(title: "Now Playing", posters: posters1)
                        ScrollSection(title: "Coming Soon", posters: posters2)
                        ScrollSection(title: "Top Movies", posters: posters3)
                        ScrollSection(title: "Favorites", posters: posters1)
                    }
                    .padding(.bottom, 90)
                }
                .scrollIndicators(.hidden)
                .scrollDismissesKeyboard(.immediately)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
        .background(
            LinearGradient(colors: [Color("backgroundColor"), Color("backgroundColor2")], startPoint: .top, endPoint: .bottom)
        )
    }
}

#Preview {
    HomeView()
}
