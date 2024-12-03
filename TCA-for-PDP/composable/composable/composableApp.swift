//
//  composableApp.swift
//  composable
//
//  Created by vbulakhov on 24.11.2024.
//

import SwiftUI
import ComposableArchitecture

@main
struct composableApp: App {
	static let store = Store(initialState: AppFeature.State()) {
		AppFeature()
	}
	
	var body: some Scene {
		WindowGroup {
			AppView(store: composableApp.store)
		}
	}
}
