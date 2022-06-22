//
//  TestView.swift
//  AsyncImage
//
//  Created by Thrace on 5/2/22.
//

import Foundation
import SwiftUI

struct TestView: View {
    
    private let imageURL: String = "https://source.unsplash.com/random"
    
    
    var body: some View {        
        
        VStack {
            HStack {
                AsyncImage(url: URL(string: imageURL), scale: 10.0)
                AsyncImage(url: URL(string: imageURL), scale: 10.0)
                AsyncImage(url: URL(string: imageURL), scale: 10.0)
            }
            
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
