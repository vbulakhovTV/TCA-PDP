//
//  ContactDetailView.swift
//  NavigationComposable
//
//  Created by vbulakhov on 25.11.2024.
//

import ComposableArchitecture
import SwiftUI

struct ContactDetailView: View {
	@Bindable var store: StoreOf<ContactDetailFeature>
	
	var body: some View {
		Form {
			Button("Delete") {
				store.send(.deleteButtonTapped)
			}
		}
		.navigationTitle(Text(store.contact.name))
		.alert($store.scope(state: \.alert, action: \.alert))
	}
}
