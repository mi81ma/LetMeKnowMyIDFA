//
//  LetMeKnowMyIDFAApp.swift
//  LetMeKnowMyIDFA
//
//  Created by masato on 5/12/2020.
//

import SwiftUI

@main
struct LetMeKnowMyIDFAApp: App {
    let getPermissionClass = GetPermissionClass()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(getPermissionClass)
        }
    }
}
