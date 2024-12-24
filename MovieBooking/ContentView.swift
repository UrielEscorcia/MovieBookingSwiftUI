//
//  ContentView.swift
//  MovieBooking
//
//  Created by Uriel  on 11/12/24.
//

import SwiftUI

struct ContentView: View {
    @State var currentTab: TabData = .home
    
    init() {
        UITabBar.appearance().isHidden = true
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                TabView(selection: $currentTab) {
                    HomeView()
                    
                    Text("Location")
                        .tag(TabData.location)
                    
                    TicketView()
                        .tag(TabData.ticket)
                    
                    Text("Category")
                        .tag(TabData.category)
                    
                    Text("Profile")
                        .tag(TabData.profile)
                }
                CustomTabBar(currentTab: $currentTab)
            }
            .ignoresSafeArea(.keyboard)
        }
    }
}

#Preview {
    ContentView()
}
