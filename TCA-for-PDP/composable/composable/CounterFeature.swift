//
//  CounterFeature.swift
//  composable
//
//  Created by vbulakhov on 24.11.2024.
//

import ComposableArchitecture
import Foundation

@Reducer
struct CounterFeature {
	
	@ObservableState
	struct State {
		var count = 0
		var fact: String?
		var isLoading = false
		var isTimerRunning = false
	}
	
	enum Action {
		case decrementButtonTapped
		case incrementButtonTapped
		case factButtonTapped
		case factResponse(String)
		case toggleTimerButtonTapped
		case timerTick
	}
	
	enum CancelID { case timer }
	
	var body: some ReducerOf<Self> {
		Reduce { state, action in
			switch action {
			case .decrementButtonTapped:
				state.fact = nil
				state.count -= 1
				return .none
			case .incrementButtonTapped:
				state.fact = nil
				state.count += 1
				return .none
			case .factButtonTapped:
				state.fact = nil
				state.isLoading = true
				return .run { [count = state.count] send in
					let (data, _) = try await URLSession.shared
						.data(from: URL(string: "http://numbersapi.com/\(count)")!)
					let fact = String(decoding: data, as: UTF8.self)
					await send(.factResponse(fact))
				}
			case let .factResponse(fact):
				state.fact = fact
				state.isLoading = false
				return .none
			case .toggleTimerButtonTapped:
				state.isTimerRunning.toggle()
				if state.isTimerRunning {
					return .run { send in
						while true {
							try await Task.sleep(for: .seconds(1))
							await send(.timerTick)
						}
					}
					.cancellable(id: CancelID.timer)
				} else {
					return .cancel(id: CancelID.timer)
				}
			case .timerTick:
				state.count += 1
				state.fact = nil
				return .none
			}
		}
	}
	
}

