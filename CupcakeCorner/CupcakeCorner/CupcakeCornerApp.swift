//
//  CupcakeCornerApp.swift
//  CupcakeCorner
//
//  Created by Leo Mogiano on 7/12/24.
//

import SwiftUI

@main
struct CupcakeCornerApp: App {
    @State private var navigator = NavigatorManager()
    var body: some Scene {
        WindowGroup {
            ContentView(navigation: $navigator)
                .environment(navigator)
        }
    }
}
