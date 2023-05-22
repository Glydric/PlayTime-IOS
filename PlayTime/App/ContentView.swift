//
//  ContentView.swift
//  PlayTime
//
//  Created by Leonardo Migliorelli on 04/04/23.
//

import SwiftUI

struct ContentView: View {
	enum Indexes: String {
		case Giochi = "gamecontroller"
		case Home = "house.fill"
		case Profilo = "person.fill"
		
		static var list: [Indexes] = [.Giochi, .Home, .Profilo]
		
		var description: String {
			"\(self)"
		}
	}
	
	@State var selectedIndex: Indexes = .Giochi
	
	var body: some View {
		NavigationView{
			TabView(selection: $selectedIndex) {
				GamesView()
					.tabItem {
						Image(systemName: "gamecontroller")
						Text("Giochi")
					}
					.tag(Indexes.Giochi)
				SocialView()
					.tabItem {
						Image(systemName: "house.fill")
						Text("Home")
					}
					.tag(Indexes.Home)
				ProfileView()
					.tabItem {
						Image(systemName: "person.fill")
						Text("Profilo")
					}
					.tag(Indexes.Profilo)
			}.onAppear() {
				UITabBar.appearance().barTintColor = .white
			}
		}
		
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
