//
//  Utils.swift
//  MovieBooking
//
//  Created by Uriel  on 11/12/24.
//

import SwiftUI

// dashed line
struct DashedLine: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        return path
    }
}


