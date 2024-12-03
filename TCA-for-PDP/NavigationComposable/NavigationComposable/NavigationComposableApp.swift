//
//  NavigationComposableApp.swift
//  NavigationComposable
//
//  Created by vbulakhov on 25.11.2024.
//

import SwiftUI
import ComposableArchitecture

@main
struct NavigationComposableApp: App {
	
	static let store = Store(initialState: ContactsFeature.State()) {
		ContactsFeature()
	}
	
    var body: some Scene {
        WindowGroup {
			ContactsView(store: Self.store)
        }
    }
}
