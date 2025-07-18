//
//  ImplicitAnimation.swift
//  Animations
//
//  Created by user272495 on 7/10/25.
//

import SwiftUI

struct ImplicitAnimation: View {
    @State var hasChanged = false
    
    var body: some View {
        VStack {
           Rectangle()
                .frame(
                    width: hasChanged ? 200 : 100,
                    height: hasChanged ? 200 : 100)
                .foregroundStyle(hasChanged ? .blue: .yellow)
                .animation(.easeInOut(duration: 2), value: hasChanged)
                .onTapGesture {
                    hasChanged.toggle()
                }
        }
    }
}

#Preview {
    ImplicitAnimation()
}
