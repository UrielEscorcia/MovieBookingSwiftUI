//
//  TicketView.swift
//  MovieBooking
//
//  Created by Uriel  on 11/12/24.
//

import SwiftUI

struct TicketView: View {
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
            
            VStack(spacing: 30.0) {
                Text("Mobile Ticket")
                    .font(.title3)
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
                
                Text("Once you buy a movie ticket simply scan de barcode to access to your movie.")
                    .frame(maxWidth: 248)
                    .font(.body)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
            }
            .padding(.horizontal, 20)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            
            Tickets()
                .padding(.top, 30)
        }
        .background {
            LinearGradient(gradient: Gradient(colors: [Color("backgroundColor"), Color("backgroundColor2")]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
        }
    }
}

#Preview {
    TicketView()
}
