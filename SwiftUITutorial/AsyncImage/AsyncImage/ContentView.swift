
//  ContentView.swift
//  AsyncImage
//
//  Created by Thrace on 5/2/22.
//

import SwiftUI

extension Image {
  func imageModifier() -> some View {
    self
      .resizable()
      .scaledToFit()
  }
  
  func iconModifier() -> some View {
    self
      .imageModifier()
      .frame(maxWidth: 128)
      .foregroundColor(.teal)
      .opacity(0.5)
  }
}

struct ContentView: View {
    private let imageURL: String = "https://credo.academy/credo-academy@3x.png"
//    private let imageURL: String = "https://source.unsplash.com/random"
    
    var body: some View {
        // MARK: - 1. Basic
//        AsyncImage(url: URL(string: imageURL))
        
        // MARK: - 2. SCALE
//        AsyncImage(url: URL(string: imageURL), scale: CGFloat(3.0))
        
        // MARK: - 3. Placeholder
//        AsyncImage(url: URL(string: imageURL)) { image in
//            image
//                .resizable()
//                .scaledToFit()
//        } placeholder: {
//                Image(systemName: "photo.circle.fill")
//                .resizable()
//                .scaledToFit()
//                .frame(maxWidth: 128)
//                .foregroundColor(.purple)
//                .opacity(0.5)
//        }
//        .padding(40)
        
        // MARK: - 4 PHASE
//        AsyncImage(url: URL(string: imageURL)) { phase in
//
//            // SUCCESS: The image was loaded successfully
//            // FAILURE:  The image failed to load with an error.
//            // EMPTYY:  No image is loaded
//
//            if let image = phase.image {
//                image.imageModifier()
//            } else if phase.error != nil {
//                Image(systemName: "logo.playstation").iconModifier()
//
//            } else {
//                Image(systemName: "photo.gamecontroller.fill").iconModifier()
//            }
//
//        }
//        .padding(40)
        
        // MARK: - 5. Animation
        AsyncImage(url: URL(string: imageURL), transaction: Transaction(animation:
            .spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.25))) {
            phase in

            switch phase {
            case .empty:
                Image(systemName: "logo.playstation").iconModifier()
            case .failure(_):
                Image(systemName: "logo.playstation").iconModifier()
            case .success(let image):
                image.imageModifier()
                    .transition(.move(edge: .bottom))
            @unknown default:
                ProgressView()
            }


        }
        .padding(40)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
