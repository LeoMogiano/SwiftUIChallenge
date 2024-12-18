//
//  NavigationDestination.swift
//  CupcakeCorner
//
//  Created by Leo Mogiano on 17/12/24.
//

enum NavDestination: Hashable {
    case addressView(order: Order)
    case checkoutView(order: Order)
}

