//
//  BookingView.swift
//  MovieBooking
//
//  Created by Uriel  on 23/12/24.
//

import SwiftUI

struct BookingView: View {
    @Environment(\.dismiss) var dismiss
    
    let gradient = [Color("backgroundColor2").opacity(0), Color("backgroundColor2"), Color("backgroundColor2"), Color("backgroundColor2")]
    
    @State var selectedDate = false
    @State var bindingSelection = false
    @State var selectedHour = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("booking")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxHeight: .infinity, alignment: .top)
                
                VStack {
                    LinearGradient(colors: gradient, startPoint: .top, endPoint: .bottom)
                        .frame(height: 600)
                }
                .frame(maxHeight: .infinity, alignment: .bottom)
                
                VStack(spacing: 0) {
                    HStack {
                        CircleButton(action: {
                            dismiss()
                        }, image: "arrow.left")
                        
                        Spacer()
                        
                        CircleButton(action: {}, image: "ellipsis")
                    }.padding(EdgeInsets(top: 46, leading: 20, bottom: 0, trailing: 20))
                    
                    Text("Doctor Strange")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .padding(.top, 200)
                    
                    Text("in the Multiverse of Madness")
                        .font(.title3)
                        .foregroundStyle(.white)
                    
                    Text("Dr. Stephen Strange casts a forbidden spell that opens the multiverse. A threat emerges that must be stopped.")
                        .font(.subheadline)
                        .foregroundStyle(.white)
                        .padding(30)
                    
                    Text("Select date and time")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                    
                    HStack(alignment: .top, spacing: 20) {
                        DateButton(weekDay: "Thu", numDay: "21", isSelected: $bindingSelection)
                            .padding(.top, 90)
                        
                        DateButton(weekDay: "Fri", numDay: "22", isSelected: $bindingSelection)
                            .padding(.top, 70)
                        
                        DateButton(weekDay: "Sat", numDay: "23",width: 70, height: 100, isSelected: $selectedDate) {
                            withAnimation(.spring) {
                                selectedDate.toggle()
                            }
                        }
                        .padding(.top, 30)
                        
                        DateButton(weekDay: "Sun", numDay: "24", isSelected: $bindingSelection)
                            .padding(.top, 70)
                        
                        DateButton(weekDay: "Mon", numDay: "25", isSelected: $bindingSelection)
                            .padding(.top, 90)
                    }
                    
                    HStack(alignment: .top, spacing: 20) {
                        TimeButton(hour: "16:00", isSelected: $bindingSelection)
                            .padding(.top, 20)
                        
                        TimeButton(hour: "17:00", isSelected: $bindingSelection)
                        
                        TimeButton(hour: "18:00", width: 70, height: 40, isSelected: $selectedHour) {
                            withAnimation(.spring) {
                                selectedHour.toggle()
                            }
                        }
                        .padding(.top, -20)
                        
                        TimeButton(hour: "19:00", isSelected: $bindingSelection)
                        
                        TimeButton(hour: "20:00", isSelected: $bindingSelection)
                            .padding(.top, 20)
                    }
                    
                    NavigationLink {
                        SeatsView()
                    } label: {
                        LargeButton()
                            .padding(20)
                            .offset(y: selectedDate && selectedHour ? 0 : 200)
                    }
                    
                    
                    
                }
                .frame(maxHeight: .infinity, alignment: .top)
                
                
            }
            .background(.backgroundColor2)
            .ignoresSafeArea()
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    BookingView()
}
