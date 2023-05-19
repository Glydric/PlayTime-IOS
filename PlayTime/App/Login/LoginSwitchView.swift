//
//  LoginView.swift
//  PlayTime
//
//  Created by Leonardo Migliorelli on 08/05/23.
//

import SwiftUI
import FirebaseAuth

struct LoginSwitchView: View {
	@State var loginStatus = 0
	let segments = ["Login", "Registrazione"]
	
	@State var email: String = ""
	@State var password: String = ""
	
	var body: some View {
		VStack {
			Image(uiImage: UIImage(named: "AppIcon")!)
				.resizable()
				.aspectRatio(contentMode: .fit)
				.frame(height: 196)
				.cornerRadius(32)
				.padding(.vertical, 32)
			
			Picker("", selection: $loginStatus) {
				ForEach(0 ..< 2) { index in
					Text(segments[index]).tag(index)
				}
			}
			.pickerStyle(.segmented)
			.padding(16)
			
			Grid(horizontalSpacing: 16, verticalSpacing: 16){
				GridRow{
					DividerTextField(
						title: "Email",
						text: $email,
						dividerColor: true ? .gray.opacity(0.2) : .red
					)
				}
				GridRow{
					DividerTextField(
						title: "Password",
						text: $password,
						dividerColor: true ? .gray.opacity(0.2) : .red
					)
				}
			}.padding(16)
			
			(loginStatus == 0
			 ? Button("Login") {
				Auth.auth().signIn(withEmail: email, password: password) { (result, err) in
					if let err {
						print("Error signing in: \(err.localizedDescription)")
					} else {
						print("User signed in successfully!")
					}
				}
			}
			 : Button("Registrati"){
				Auth.auth().createUser(withEmail: email, password: password){ res, err in
					if let err {
						print("Error signing in: \(err.localizedDescription)")
					} else {
						print("User signed in successfully!")
					}
				}
			})
			.frame(maxWidth: .infinity)
			.padding(.vertical, 12)
			.foregroundColor(.white)
			.background(.green)
			.font(.headline)
			.cornerRadius(10)
		}
		.frame(
			minWidth: 0,
			maxWidth: .infinity,
			minHeight: 0,
			maxHeight: .infinity,
			alignment: .topLeading
		)
		.padding(16)
		
	}
}

struct LoginSwitch_Previews: PreviewProvider {
	static var previews: some View {
		LoginSwitchView()
	}
}
