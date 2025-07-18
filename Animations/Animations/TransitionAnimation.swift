//
//  TransitionAnimation.swift
//  Animations
//
//  Created by user272495 on 7/10/25.
//

import SwiftUI

struct TransitionAnimation: View {
    @State var showRectangle = false
    var body: some View {
        VStack {
            Button {
                withAnimation {
                    showRectangle.toggle()
                }
            } label: {
                Text("Animate")
            }
            if showRectangle {
                Rectangle()
                    .fill(.green)
                    .frame(width: 100, height: 100)
                    .transition(.move(edge: .bottom))
            }

        }
    }
}

#Preview {
    TransitionAnimation()
}
