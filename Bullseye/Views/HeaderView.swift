//
//  HeaderView.swift
//  Bullseye
//
//  Created by Renato Oliveira Fraga on 4/3/23.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        VStack {
            Text("🎯🎯🎯")
                .font(.title)
            Text("PUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
                .kerning(2.0)
                .bold()
                .multilineTextAlignment(.center)
                .lineSpacing(4)
                .font(.footnote)
                .padding(.horizontal, 30)
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
