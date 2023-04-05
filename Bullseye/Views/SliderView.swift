//
//  SliderView.swift
//  Bullseye
//
//  Created by Renato Oliveira Fraga on 4/4/23.
//

import SwiftUI

struct SliderView: View {
    @State private var value: Double = 50.0
    var body: some View {
        HStack {
            Text("1")
                .frame(width: 35)
            Slider(value: $value, in: 1.0...100.0)
                .padding(.horizontal)
            Text("100")
                .frame(width: 35)
        }.font(.headline)
            .padding()
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView()
    }
}
