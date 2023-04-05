//
//  RoundedFilledView.swift
//  Bullseye
//
//  Created by Renato Oliveira Fraga on 3/20/23.
//

import SwiftUI

struct RoundedFilledView: View {
    var systemName: String
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("ButtonFilledTextColor"))
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
            .background(
                Circle()
                    .fill(Color("ButtonFilledBackgroundColor"))
            )
    }
}

struct RoundedFilledView_Previews: PreviewProvider {
    static var previews: some View {
        RoundedFilledView(systemName: "list.dash")
    }
}
