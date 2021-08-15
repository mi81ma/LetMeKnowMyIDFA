//
//  ContentView.swift
//  LetMeKnowMyIDFA
//
//  Created by masato on 5/12/2020.
//

import AdSupport
import AppTrackingTransparency
import SwiftUI

struct ContentView: View {
    @State var actionViewMode = ActionViewMode.authorized
    @State var isShowIDFASheet = false
    @EnvironmentObject var getPermissionClass: GetPermissionClass


    var body: some View {


        VStack {
            Button(action: {
                self.getPermissionClass.requestPermission()
                self.isShowIDFASheet.toggle()

            }, label: {
                Text("Show IDFA")
                    .frame(width: 200, height: 25, alignment: .center)

            })
            .buttonStyle(ButtonStyleShowIDFA())
            .shadow(color: .gray, radius: 5.0, x: 0.0, y: 2)
        }
        .sheet(isPresented: $isShowIDFASheet) {
            self.actionViewMode.view
        }

    }
}

enum ActionViewMode {
    case authorized
    case denied
    case notDetermined
    case restricted
}

extension ActionViewMode {
    var view: some View {
        switch self {
            case .authorized: return SheetView(userChoose: "Authorized")
            case .denied: return SheetView(userChoose: "Denied")
            case .notDetermined: return SheetView(userChoose: "Not Determined")
            case .restricted: return SheetView(userChoose: "Restricted")
        }
    }
}

struct SheetView: View {
    @EnvironmentObject var getPermissionClass: GetPermissionClass

    // Get Level Name which user choose
    var userChoose: String

    var body: some View {
        ZStack {
            Rectangle().edgesIgnoringSafeArea(.all).foregroundColor(Color.backGroundColor).opacity(0.3)

            VStack {
                Text(getPermissionClass.deviceIDFA)
            }

        }

    } //End: var body
} //End: View struct

class GetPermissionClass: ObservableObject {
    @Published var getAuthorizationDependsUserChoice = "Not Determined"
    @Published var deviceIDFA = "Unknown"

    func requestPermission() {
        ATTrackingManager.requestTrackingAuthorization { status in
            switch status {
                case .authorized:
                    // Tracking authorization dialog was shown
                    // and we are authorized
                    self.getAuthorizationDependsUserChoice = "Authorized"
                    print(self.getAuthorizationDependsUserChoice)

                    // Now that we are authorized we can get the IDFA
                    self.deviceIDFA = ASIdentifierManager.shared().advertisingIdentifier.uuidString
                    print("self.deviceIDFA: ", self.deviceIDFA)

                case .denied:
                    // Tracking authorization dialog was
                    // shown and permission is denied
                    self.getAuthorizationDependsUserChoice = "Denied"
                    print(self.getAuthorizationDependsUserChoice)

                case .notDetermined:
                    // Tracking authorization dialog has not been shown
                    self.getAuthorizationDependsUserChoice = "Not Determined"
                    print(self.getAuthorizationDependsUserChoice)

                case .restricted:
                    self.getAuthorizationDependsUserChoice = "Restricted"
                    print(self.getAuthorizationDependsUserChoice)

                @unknown default:
                    print("Unknown")
            }
        }
    }

}

struct ButtonStyleShowIDFA: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(Color.white)
            .padding(.vertical, 10)
            .background(configuration.isPressed ? LinearGradient(gradient: Gradient(colors: [Color.newGameButtonPressed01, Color.newGameButtonPressed02]), startPoint: .leading, endPoint: .trailing) :  LinearGradient(gradient: Gradient(colors: [Color.newGameButtonNotPressed01, Color.newGameButtonNotPressed02]), startPoint: .leading, endPoint: .trailing)
            )
            .cornerRadius(30.0)
            .scaleEffect(configuration.isPressed ? 1.3 : 1.0)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
