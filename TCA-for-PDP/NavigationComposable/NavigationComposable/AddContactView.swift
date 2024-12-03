//
//  AddContactView.swift
//  NavigationComposable
//
//  Created by vbulakhov on 25.11.2024.
//

import SwiftUI
import ComposableArchitecture

struct AddContactView: View {
	@Bindable var store: StoreOf<AddContactFeature>
	
	var body: some View {
		Form {
			TextField("Name", text: $store.contact.name.sending(\.setName))
			Button("Save") {
				store.send(.saveButtonTapped)
			}
		}
		.toolbar {
			ToolbarItem {
				Button("Cancel") {
					store.send(.cancelButtonTapped)
				}
			}
		}
	}
}
