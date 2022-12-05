//
//  ProfileHost.swift
//  PlantsPlanner
//
//  Created by Volha Ivanova on 29.11.22.
//

import SwiftUI
import Combine

struct ProfileHost: View {
    @Environment(\.editMode) var editMode
    @EnvironmentObject var modelData: ModelData
    @State private var draftProfile = Profile.default
    
    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    @State private var isDarkModeOn = false
    
    func setAppTheme(){
      isDarkModeOn = UserDefaultsUtils.shared.getDarkMode()
      changeDarkMode(state: isDarkModeOn)
    }
    func changeDarkMode(state: Bool){
        (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first!.overrideUserInterfaceStyle = state ? .dark : .light
              UserDefaultsUtils.shared.setDarkMode(enable: state)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            HStack {
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                    Spacer()
                    EditButton()
                }
            }
         
            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: modelData.profile)
            } else {
                ProfileEditor(profile: $draftProfile)
                    .onAppear {
                        draftProfile = modelData.profile
                    }
                    .onDisappear {
                        modelData.profile = draftProfile
                    }
            }
            
           
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
            .environmentObject(ModelData())
    }
}
