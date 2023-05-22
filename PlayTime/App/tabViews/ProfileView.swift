//
//  ProfileView.swift
//  PlayTime
//
//  Created by Leonardo Migliorelli on 04/04/23.
//

import SwiftUI
import FirebaseAuth

struct ProfileView: View {
	var settings: [Setting] = [
		Setting("Esci")
	]
	
	@State var selectedOption: UUID?
	@State var showAlert: Bool = false
	
	var body: some View {
		List(settings, selection: $selectedOption) { s in
			Button(s.title){
				showAlert = s.title == "Esci"
				print("ciaoTap")
				
			}
			.frame(maxWidth: .infinity)
			.tint(.red)
			
		}
		.alert(
				"Vuoi veramente uscire?",
				isPresented: $showAlert,
				actions: {
					Button("Si", role: .destructive, action: {
						do{
							try Auth.auth().signOut()
							NavigationLink(destination: LoginSwitchView()){
								EmptyView()
							}
						} catch {
							Alert(title: Text("Errore"))
						}
					}
					)
			}
		)
	}
	
	struct Switcher: View {
		
		
		var body: some View {
			Text("ciao")
		}
	}
}

struct ProfileView_Previews: PreviewProvider {
	static var previews: some View {
		ProfileView()
	}
}

struct Setting: Identifiable{
	var id = UUID()
	
	var title: String
	
	init(_ title: String) {
		self.title = title
	}
}
