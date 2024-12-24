//
//  SeatsView.swift
//  MovieBooking
//
//  Created by Uriel  on 23/12/24.
//

import SwiftUI

struct SeatsView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var animate = false
    @State private var showButton = false
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                CircleButton(action: {
                    dismiss()
                }, image: "arrow.left")
                
                Spacer()
                
                Text("Choose Seats")
                    .font(.title3)
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
                
                Spacer()
                
                CircleButton(action: {}, image: "calendar")
            }
            .padding(.top, 46)
            .padding(.horizontal, 20)
            
            Image("frontSeat")
                .padding(.top, 55)
                .glow(color: .pink, radius: 20)
            
            Image("seats")
                .frame(height: 240)
                .padding(.top, 60)
                .padding(.horizontal, 20)
                .onTapGesture {
                    withAnimation(.spring) {
                        showButton = true
                    }
                }
            
            HStack(spacing: 20.0) {
                StatusUI()
                StatusUI(color: .majenta, text: "Reserved")
                StatusUI(color: .cyan, text: "Selected")
            }
            .padding(.top, 40)
            .padding(.bottom, 30)
            
            ZStack(alignment: .topLeading) {
                Circle()
                    .frame(width: 200, height: 200)
                    .foregroundStyle(.purple)
                    .blur(radius: animate ? 70 : 100)
                    .offset(x: animate ? -100 : 20, y: animate ? -20 : -20)
                    .task {
                        withAnimation(.easeInOut(duration: 7).repeatForever()) {
                            animate.toggle()
                        }
                    }
                
                Circle()
                    .frame(width: 200, height: 200)
                    .foregroundStyle(.lightBlue)
                    .blur(radius: animate ? 50 : 100)
                    .offset(x: animate ? 50 : 70, y: animate ? 70 : 30)
                
                Circle()
                    .frame(width: 200, height: 200)
                    .foregroundStyle(.pink)
                    .blur(radius: animate ? 70 : 100)
                    .offset(x: animate ? 150 : 170, y: animate ? 90 : 100)
                
                VStack(alignment: .leading, spacing: 20) {
                    HStack(spacing: 10) {
                        Image(systemName: "calendar")
                        Text("April 28, 2024")
                        Circle()
                            .frame(width: 6, height: 6)
                        Text("6:00 PM")
                    }
                    
                    HStack(spacing: 10) {
                        Image(systemName: "calendar")
                        Text("April 28, 2024")
                        Circle()
                            .frame(width: 6, height: 6)
                        Text("6:00 PM")
                    }
                    
                    HStack(spacing: 10) {
                        Image(systemName: "calendar")
                        Text("April 28, 2024")
                        Circle()
                            .frame(width: 6, height: 6)
                        Text("6:00 PM")
                    }
                }
                .padding(.top, 40)
                .padding(.horizontal, 40)
                .font(.subheadline)
                
                HStack {
                    Spacer()
                    RoundButton {
                        NavigationUtil.popToRootView()
                    }
                }
                .frame(maxHeight: .infinity)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .clipped()
            .foregroundStyle(.white)
            .background(.ultraThinMaterial)
            .offset(y: showButton ? 0 : 300)
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color("backgroundColor"))
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    SeatsView()
}
