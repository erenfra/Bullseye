//
//  RoundedView.swift
//  Bullseye
//
//  Created by Renato Oliveira Fraga on 3/16/23.
//

import SwiftUI

struct RoundedView: View {
    var systemName: String
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .frame(width: 56, height: 56)
            .overlay(
                Circle()
                    .strokeBorder(Color("ButtonStrokeColor"), lineWidth: 2)
            )
    }
}

struct RoundedView_Previews: PreviewProvider {
    static var previews: some View {
        RoundedView(systemName: "list.dash")
    }
}