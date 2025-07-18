//
//  UIState.swift
//  SuperHero
//
//  Created by Jorge Mayta on 17/07/25.
//

enum UIState<T> {
    case initialState
    case loadingState
    case successState(T)
    case failureState(String)
}
