//
//  ContentView.swift
//  PlayTime
//
//  Created by Leonardo Migliorelli on 04/04/23.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
	@State var user: User? = Auth.auth().currentUser
	
	var body: some View {
		ZStack {
			if user == nil {
				LoginSwitchView()
			} else {
				ContentSwitcher()
			}
		}
		.animation(.easeInOut, value: user)
			.onAppear {
				Auth.auth().addStateDidChangeListener { _, us in
					user = us
				}
			}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
