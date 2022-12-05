//
//  ProfileSummary.swift
//  PlantsPlanner
//
//  Created by Volha Ivanova on 29.11.22.
//

import SwiftUI

struct ProfileSummary: View {
    @EnvironmentObject var modelData: ModelData
    var profile: Profile

    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    @State private var isDarkModeOn = false
    @State private var isNotificationsOn = false

    func setAppTheme(){
        if (colorScheme == .dark)
         {
           isDarkModeOn = true
         }
         else {
           isDarkModeOn = false
         }
        
        changeDarkMode(state: isDarkModeOn)
    }
    func changeDarkMode(state: Bool){
        (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first!.overrideUserInterfaceStyle = state ? .dark : .light
              UserDefaultsUtils.shared.setDarkMode(enable: state)
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    profile.image
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 70, height: 70)
                        .cornerRadius(10)
                        .padding(.trailing, 10)

                    VStack(alignment: .leading) {
                        Text(profile.username + " " + profile.seasonalPhoto.rawValue)
                            .bold()
                            .font(.title)
                        EditButton()
                    }
                }
                
                Spacer()
                
                Text("Goal Date: ") + Text(profile.goalDate, style: .date)

                Text("Personalization")
                    .font(.headline)
                
                GroupBox {
                    if (profile.location != "") {
                        HStack{
                            Text("Location: ")
                            Spacer()
                            Text(profile.location)
                        }
                        Divider()
                    }
                    HStack{
                        Text("Climate: ")
                        Spacer()
                        if (profile.location != "") {
                            Text(profile.climate)
                        } else {
                            Button("Add hardiness zone", action: {})
                        }
                    }
                }
                
                Spacer()
                
                Text("Settings")
                    .font(.headline)
                
                GroupBox {
                    Toggle("Dark theme", isOn: $isDarkModeOn).onChange(of: isDarkModeOn) { (state)  in
                        changeDarkMode(state: state)
                    }
                    Toggle("Enable Notifications", isOn: $isNotificationsOn)
                }
                
            }
            .padding()
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
            .environmentObject(ModelData())
    }
}
