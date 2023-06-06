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
	@State var toBePresented = false
	@State var error = Response.Error(){
		didSet {
			toBePresented = true
		}
	}
	
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
		.alert(
			error.message,
			isPresented: $toBePresented,
			actions: {},
			message: {
				Text("Potrebbe essere necessario controllare la connessione o aggiornare l'app")
			}
		)
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
