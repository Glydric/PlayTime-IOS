//
//  SocialView.swift
//  PlayTime
//
//  Created by Leonardo Migliorelli on 04/04/23.
//

import SwiftUI

struct SocialView: View {
	@State private var searchString: String = ""
	
	@State var showError: Bool = false
	@State var error: Response.Error? {
		didSet {
			showError = true
		}
	}
	@State private var isSearchable: Bool = false
	@State private var isLoading: Bool = StorageManager.allGames.isEmpty
	
	@State var data: [Response.Success.Game] = StorageManager.allGames
	
	var searchResult: [Response.Success.Game] {
		guard searchString != "" else { return data }
		APIClient.getGame(
			searchString,
			completion: { data in
				self.data = data
			},
			completionError: { err in
				self.error = err
			}
		)
		return data
	}
	
	var body: some View {
		NavigationStack {
			ScrollView { LazyVStack {
				ForEach(searchResult.limit(by: 10), id: \.self){ s in
					AsyncImage(url: URL(string: s.pic))
						.searchCompletion(s.title)
				}}
			}
			.searchable(text: $searchString)
			
			ProgressView()
				.progressViewStyle(.circular)
				.hidden(!isLoading)
		}
		.alert(
			error?.message ?? "",
			isPresented: $showError,
			actions: {},
			message: {
				Text("Potrebbe essere necessario controllare la connessione o aggiornare l'app")
			}
		)
	}
}

struct SocialView_Previews: PreviewProvider {
	static var previews: some View {
		SocialView()
	}
}
struct OptionalSearchableView: ViewModifier {
	let isSearchable: Bool
	@Binding var searchString: String
	
	func body(content: Content) -> some View {
		if isSearchable {
			content
				.searchable(text: $searchString)
		} else {
			content
		}
	}
}
