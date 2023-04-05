//
//  TargetView.swift
//  Bullseye
//
//  Created by Renato Oliveira Fraga on 4/4/23.
//

import SwiftUI

struct TargetView: View {
    var value: Int
    var body: some View {
        Text("\(value)")
            .fontWeight(.black)
            .kerning(-1.0)
            .font(.largeTitle)
    }
}

struct TargetView_Previews: PreviewProvider {
    static var previews: some View {
        TargetView(value: 99)
    }
}
