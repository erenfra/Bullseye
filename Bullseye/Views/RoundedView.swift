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
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
            .overlay(
                Circle()
                    .strokeBorder(Color("ButtonStrokeColor"), lineWidth: Constants.General.strokeWidth)
            )
    }
}

struct RoundedView_Previews: PreviewProvider {
    static var previews: some View {
        RoundedView(systemName: "list.dash")
    }
}
