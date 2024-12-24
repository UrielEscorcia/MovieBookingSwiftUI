//
//  Ticket.swift
//  MovieBooking
//
//  Created by Uriel  on 11/12/24.
//

import Foundation

struct Ticket: Identifiable {
    var id = UUID().uuidString
    var image: String
    var title: String
    var subtitle: String
    var top: String
    var bottom: String
}

enum TicketMockData {
    static let tickets: [Ticket] = [
        Ticket(image: "thor", title: "Thor", subtitle: "Love and Thunder", top: "thor-top", bottom: "thor-bottom"),
        Ticket(image: "panther", title: "Black Panther", subtitle: "Wakanda Forever", top: "panther-top", bottom: "panther-bottom"),
        Ticket(image: "scarlet", title: "Doctor Strange", subtitle: "in the Multiverse of Madness", top: "scarlet-top", bottom: "scarlet-bottom")
    ]
}
