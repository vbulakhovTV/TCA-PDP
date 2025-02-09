//
//  AppFeature.swift
//  composable
//
//  Created by vbulakhov on 24.11.2024.
//
import ComposableArchitecture

@Reducer
struct AppFeature {
	
	struct State {
		
		var tab1 = CounterFeature.State()
		var tab2 = CounterFeature.State()
		
	}
	
	enum Action {
		
		case tab1(CounterFeature.Action)
		case tab2(CounterFeature.Action)
		
	}
	
	var body: some ReducerOf<Self> {
		Scope(state: \.tab1, action: \.tab1) {
			CounterFeature()
		}
		Scope(state: \.tab2, action: \.tab2) {
			CounterFeature()
		}
		Reduce { state, action in
			return .none
		}
	}
	
}
