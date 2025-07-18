//
//  InfiniteRotation.swift
//  Animations
//
//  Created by user272495 on 7/10/25.
//

import SwiftUI

struct InfiniteRotation: View {
    
    @State var rotate = false
    var body: some View {
        VStack {
            Image(systemName: "arrow.2.circlepath")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .rotationEffect(.degrees( rotate ? 360 : 0))
                .animation(.linear(duration: 2).repeatForever(autoreverses: false), value: rotate)
                .onAppear{
                    rotate.toggle()
                }
        }
    }
}

#Preview {
    InfiniteRotation()
}
