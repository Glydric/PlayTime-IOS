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
	
	@State var isEmailValid = true
	@State var isPasswordValid = true
	
	@State var isLoginError: Bool = false
	@State var error: FirebaseErrorCodes? {
		didSet {
			isLoginError = error != nil
			
			isEmailValid = error != .ERROR_MISSING_EMAIL && error != .ERROR_INVALID_EMAIL
			
			isPasswordValid = error != .ERROR_WEAK_PASSWORD && error != .ERROR_WRONG_PASSWORD
		}
	}
	
	var body: some View {
		VStack(spacing: 16) {
			Image(uiImage: UIImage(named: "AppIcon")!)
				.resizable()
				.aspectRatio(contentMode: .fit)
				.frame(height: 196)
				.cornerRadius(32)
			
			Picker("", selection: $loginStatus) {
				ForEach(0 ..< 2) { index in
					Text(segments[index]).tag(index)
				}
			}
			.pickerStyle(.segmented)
			.padding(.vertical, 32)
			
			VStack(spacing: 16){
				DividerTextField(
					title: "Email",
					text: $email,
					textCase: .never,
					dividerColor: isEmailValid ? .gray.opacity(0.2) : .red
				)
				DividerTextField(
					title: "Password",
					text: $password,
					textCase: .never,
					secure: true,
					dividerColor: isPasswordValid ? .gray.opacity(0.2) : .red
				)
			}
			Spacer()
			
			Button(actualButton.0, action: actualButton.1)
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
		.padding(24)
		.alert(
			error?.describe ?? "Errore Generico",
			isPresented: $isLoginError,
			actions: {
//
//				Button("Ok", role: .destructive) {}
			},
			message: {
			}
		)
		
	}
	var actualButton: (String, () -> Void) {
		loginStatus == 0
		? ("Login", {
			
			Auth.auth().signIn(withEmail: email, password: password) { res, err in
				error = FirebaseErrorCodes(err?.type)
				
				if let err {
					
					print("Error signing in: \(err.localizedDescription)")
				} else {
					print("User signed in successfully!")
				}
			}
		})
		: ("Registrati", {
			Auth.auth().createUser(withEmail: email, password: password) { res, err in
				error = FirebaseErrorCodes(err?.type)
				
				if let err {
					print("Error signing in: \(err.localizedDescription)")
				} else {
					print("User signed in successfully!")
				}
			}
		})
	}
}

struct LoginSwitch_Previews: PreviewProvider {
	static var previews: some View {
		LoginSwitchView()
	}
}

fileprivate extension Error {
	var type: String? {
		_userInfo?["FIRAuthErrorUserInfoNameKey"] as? String
	}
}
