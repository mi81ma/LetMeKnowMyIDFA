//
//  Color.swift
//  LetMeKnowMyIDFA
//
//  Created by masato on 5/12/2020.
//

import SwiftUI

extension Color {
    static func rgb(r: Double, g: Double, b: Double) -> Color {

        return Color(red: r / 255, green: g / 255, blue: b / 255)
    }

    // static let backgroundColor = Color.rgb(r: 21, g: 22, b: 33)
    static let buttonColor = Color.rgb(r: 15, g: 175, b: 220)

    // Original Temporal Green
    static let tGreen = Color.rgb(r: 222, g: 255, b: 136)

    // Original Temporal Orange
    static let tOrange = Color.rgb(r: 255, g: 211, b: 140)

    // Original Temporal Pink
    static let tPink = Color.rgb(r: 255, g: 150, b: 163)

    // Original Temporal Pink
    static let tPurple = Color.rgb(r: 161, g: 140, b: 232)

    // Original Temporal Blue
    static let tBlue = Color.rgb(r: 156, g: 254, b: 255)

    // Original light gray
    static let tLightGray = Color.rgb(r: 217, g: 217, b: 217)

    // Title Text Color
    static let titleTextColor = Color.rgb(r: 70, g: 85, b: 108)

    // Title Background Color
    static let backGroundColor = Color.rgb(r: 208, g: 208, b: 208)

    //MARK: -------- New Game Button Color -------------
    // New Game Button Not Pressed 01
    static let newGameButtonNotPressed01 = Color.rgb(r: 29, g: 181, b: 132)

    // New Game Button Not Pressed 02
    static let newGameButtonNotPressed02 = Color.rgb(r: 149, g: 240, b: 166)

    // New Game Button Pressed 01
    static let newGameButtonPressed01 = Color.rgb(r: 149, g: 240, b: 166)

    // New Game Button Pressed 02
    static let newGameButtonPressed02 = Color.rgb(r: 149, g: 240, b: 166)

    //MARK: -------- Continue Game Button Color -------------
    // Continue Game Button Not Pressed 01
    static let continueGameButtonNotPressed01 = Color.rgb(r: 96, g: 120, b: 234)

    // Continue Game Button Not Pressed 02
    static let continueGameButtonNotPressed02 = Color.rgb(r: 23, g: 234, b: 217)

    // Continue Game Button Pressed 01
    static let continueGameButtonPressed01 = Color.rgb(r: 96, g: 120, b: 234)

    // Continue Game Button Pressed 02
    static let continueGameButtonPressed02 = Color.rgb(r: 96, g: 120, b: 234)

    //MARK: -------- Stage Level Base Gradient Color -------------
    static let easyStageBaseColor = LinearGradient(gradient: Gradient(colors: [Color.rgb(r: 106, g: 117, b: 254), Color.rgb(r: 40, g: 208, b: 221)]), startPoint: .bottomLeading, endPoint: .topTrailing)

    static let easyStageBaseColor_buttonActive = LinearGradient(gradient: Gradient(colors: [Color.rgb(r: 96, g: 120, b: 234), Color.rgb(r: 96, g: 120, b: 234)]), startPoint: .leading, endPoint: .trailing)

}
