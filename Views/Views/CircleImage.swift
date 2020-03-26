//
//  CircleImage.swift
//  Views
//
//  Created by Yunior Lopez on 3/26/20.
//  Copyright © 2020 Yunior Lopez. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        
        VStack {
            Image("turtlerock")
            .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 2))
            .shadow(radius: 10)
        }
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
