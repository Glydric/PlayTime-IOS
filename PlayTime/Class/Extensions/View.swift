//
//  View.swift
//  PlayTime
//
//  Created by Leonardo Migliorelli on 22/05/23.
//

import SwiftUI

extension View {
	/// Hide or show the view based on a boolean value.
	///
	/// Example for visibility:
	///
	///     Text("Label")
	///         .isHidden(true)
	///
	/// Example for complete removal:
	///
	///     Text("Label")
	///         .isHidden(true, remove: true)
	///
	/// - Parameters:
	///   - hidden: Set to `false` to show the view. Set to `true` to hide the view.
	///   - remove: Boolean value indicating whether or not to remove the view.
	@ViewBuilder func hidden(_ hidden: Bool, remove: Bool = false) -> some View {
		if hidden {
			if !remove {
				self.hidden()
			}
		} else {
			self
		}
	}
//	TODO make macro
//	func alert(_ error: Response.Error) -> some SwiftUI.View {
//		return alert(
//			error.message,
//			isPresented: error.$toBePresented,
//			actions: {},
//			message: {
//				Text("Potrebbe essere necessario controllare la connessione o aggiornare l'app")
//			}
//		)
//	}
}

