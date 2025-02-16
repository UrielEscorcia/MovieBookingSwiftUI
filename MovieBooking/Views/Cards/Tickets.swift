//
//  Tickets.swift
//  MovieBooking
//
//  Created by Uriel  on 12/12/24.
//

import SwiftUI

struct Tickets: View {
    @State var tickets = Array(TicketMockData.tickets)
    
    var body: some View {
        ZStack {
            ForEach(tickets) { ticket in
                InfiniteStackView(tickets: $tickets, ticket: ticket)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
}

struct InfiniteStackView: View {
    @Binding var tickets: [Ticket]
    var ticket: Ticket
    
    @GestureState var isDragging = false
    @State var offset: CGFloat = .zero
    
    @State var height: CGFloat = 0
    
    var body: some View {
        VStack {
            TicketCard(title: ticket.title, subtitle: ticket.subtitle, top: ticket.top, bottom: ticket.bottom, height: $height)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .zIndex(getIndex() == 0 && offset > 100 ? Double(CGFloat(tickets.count) - getIndex()) - 1 : Double(CGFloat(tickets.count) - getIndex()))
        .rotationEffect(.init(degrees: getRotation(angle: 10)))
        .rotationEffect(getIndex() == 1 ? .degrees(-6) : .degrees(0))
        .rotationEffect(getIndex() == 2 ? .degrees(6) : .degrees(0))
        .scaleEffect(getIndex() == 0 ? 1 : 0.9)
        .offset(x: getIndex() == 1 ? -40 : 0)
        .offset(x: getIndex() == 2 ? 40 : 0)
        .offset(x: offset)
        .gesture(
            DragGesture()
                .updating($isDragging, body: { _, out, _ in
                    out = true
                })
                .onChanged { value in
                    var translation = value.translation.width
                    translation = tickets.first?.id == ticket.id ? translation : 0
                    translation = isDragging ? translation : 0
                    
                    
                    withAnimation(.easeInOut(duration: 0.3)) {
                        offset = translation
                        height = -offset / 5
                    }
                }
                .onEnded { _ in
                    let width = UIScreen.main.bounds.width
                    let swipedRigth = offset > width / 2
                    let swipedLeft = -offset > width / 2
                    
                    withAnimation(.easeInOut(duration: 0.5)) {
                        if swipedLeft {
                            offset = -width
                            removeTicket()
                        } else if swipedRigth {
                            offset = width
                            removeAndAdd()
                        } else {
                            offset = .zero
                            height = .zero
                        }
                    }
                }
        )
    }
    
    func getIndex() -> CGFloat {
        return CGFloat(tickets.firstIndex { $0.id == ticket.id } ?? 0)
    }
    
    func getRotation(angle: Double) -> Double {
        let width = UIScreen.main.bounds.width
        let progress = offset / width
        return Double(progress * angle)
    }
    
    func removeAndAdd() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            var updatedTicket = ticket
            updatedTicket.id = UUID().uuidString
            
            tickets.append(updatedTicket)
            
            withAnimation(.spring) {
                tickets.removeFirst()
            }
        }
    }
    
    func removeTicket() {
        withAnimation(.spring) {
            tickets.removeFirst()
        }
    }
}

#Preview {
    Tickets()
}
