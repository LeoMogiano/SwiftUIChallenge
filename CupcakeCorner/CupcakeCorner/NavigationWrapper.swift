//
//  NavigationWrapper.swift
//  CupcakeCorner
//
//  Created by Leo Mogiano on 17/12/24.
//


struct NavigationWrapper<T: Hashable>: Hashable {
    let value: T
    let identifier: String
}