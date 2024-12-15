//
//  ImageView.swift
//  CupcakeCorner
//
//  Created by Leo Mogiano on 8/12/24.
//

import SwiftUI

struct ImageView: View {
    let url: String
    let errorMessage: String
    let loadingView: AnyView
    let frameWidth: CGFloat
    let frameHeight: CGFloat
    let contentMode: ContentMode
    
    init(
        url: String, errorMessage: String = "There was an error loading the image.",
        loadingView: AnyView = AnyView(ProgressView()),
        frameWidth: CGFloat = 200, frameHeight: CGFloat = 200,
        contentMode: ContentMode = .fit
    ) {
        self.url = url
        self.errorMessage = errorMessage
        self.loadingView = loadingView
        self.frameWidth = frameWidth
        self.frameHeight = frameHeight
        self.contentMode = contentMode
    }

    var body: some View {
        AsyncImage(url: URL(string: url)) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFitOrFill(contentMode)
            } else if phase.error != nil {
                Text(errorMessage)
            } else {
                AnyView(loadingView)
            }
        }
        .frame(width: frameWidth, height: frameHeight)
    }
}


extension View {
    // Extensión para elegir entre fit o fill basado en el ContentMode
     func scaledToFitOrFill(_ contentMode: ContentMode) -> some View {
        switch contentMode {
        case .fit:
            return self.scaledToFit()
        case .fill:
            return self.scaledToFill()
        }
    }
}
