//
//  ContentView.swift
//  CustomisedTabView
//
//  Created by Adam Jemni on 10/7/21.
//

import SwiftUI

struct ContentView: View {
    enum Tab: Int {
        case explore, search, feed, profile, inbox
    }
    
    @State private var selectedTab = Tab.explore
    let screen: CGSize = UIScreen.main.bounds.size

    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                if selectedTab == .explore {
                    ExploreView()
                }
                if selectedTab == .search {
                    NavigationView {
                        VStack(spacing: 0) {
                            SearchView()
                            tabBarView
                        }
                    }
                }
                if selectedTab == .feed {
                    FeedView()
                }
                
                if selectedTab == .profile {
                    ProfileView()
                }
                
                if selectedTab == .inbox {
                    InboxView()
                }
                
            }
            .animation(nil)
            
            if selectedTab != .search {
                tabBarView
            }
        }
    }
    
    var tabBarView: some View {
        VStack(spacing: 0) {
            Divider()
            
            HStack(spacing: 0) {
                tabBarItem(.explore, title: "Explore", icon: "hare", selectedIcon: "hare.fill")
                    .frame(width: screen.width / 5)
                tabBarItem(.search, title: "Search", icon: "tortoise", selectedIcon: "tortoise.fill")
                    .frame(width: screen.width / 5)
                tabBarItem(.feed, title: "Feed", icon: "hare", selectedIcon: "hare.fill")
                    .frame(width: screen.width / 5)
                tabBarItem(.profile, title: "Profile", icon: "hare", selectedIcon: "hare.fill")
                    .frame(width: screen.width / 5)
                tabBarItem(.inbox, title: "Inbox", icon: "hare", selectedIcon: "hare.fill")
                    .frame(width: screen.width / 5)
            }
            .padding(.top, 8)
        }
        .frame(height: 50)
        .background(Color.primary.colorInvert().edgesIgnoringSafeArea(.all))
    }
    
    func tabBarItem(_ tab: Tab, title: String, icon: String, selectedIcon: String) -> some View {
        ZStack(alignment: .topTrailing) {
            VStack(spacing: 3) {
                VStack {
                    Image(systemName: (selectedTab == tab ? selectedIcon : icon))
                        .font(.system(size: 20))
                        .foregroundColor(selectedTab == tab ? .primary : .gray)
                }
                .frame(width: 55, height: 28)
                
                Text(title)
                    .font(.system(size: 11))
                    .foregroundColor(selectedTab == tab ? .primary : .gray)
            }
        }
        .frame(width: 65, height: 42)
        .onTapGesture {
            selectedTab = tab
        }
    }
}

struct ExploreView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("First View")
                    .font(.headline)
            }
            .navigationTitle("First title")
            .navigationBarTitleDisplayMode(.inline)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            .background(Color.yellow)
        }
    }
}

struct SearchView: View {
    var body: some View {
        VStack {
            NavigationLink(destination: ThirdView()) {
                Text("Second View, tap to navigate")
                    .font(.headline)
            }
        }
        .navigationTitle("Second title")
        .navigationBarTitleDisplayMode(.inline)
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .background(Color.orange)
    }
}

struct ThirdView: View {
    var body: some View {
        VStack {
            Text("Third View with tabBar hidden")
                .font(.headline)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .background(Color.red.edgesIgnoringSafeArea(.bottom))
    }
}

struct FeedView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Feed View")
                    .font(.headline)
            }
            .navigationTitle("Feed")
            .navigationBarTitleDisplayMode(.inline)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            .background(Color.yellow)
        }
    }
}


struct ProfileView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Profile View")
                    .font(.headline)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            .background(Color.yellow)
        }
    }
}

struct InboxView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Inbox View")
                    .font(.headline)
            }
            .navigationTitle("Inbox")
            .navigationBarTitleDisplayMode(.inline)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            .background(Color.yellow)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


