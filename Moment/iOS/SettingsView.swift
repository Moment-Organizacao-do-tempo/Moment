//
//  SettingsView.swift
//  Moment
//
//  Created by Lucas Fernandes on 21/05/21.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage(Settings.notificationsEnabled) private var notificationsEnabled = false
    
    @AppStorage(Settings.pomodoro) var focusTime: Int = 20
    @AppStorage(Settings.breakPause) var breakPause: Int = 300
    @AppStorage(Settings.longPause) var longPause: Int = 1500
    @AppStorage(Settings.cycles) private var cycles = 2
    
    var focusOptions = [900, 1200, 1500, 1800, 2100, 2400]
    var shortPauseOptions = [300, 600, 900, 1200]
    var longPauseOptions = [1200, 1500, 1800, 2100, 2400]
    var cyclesOptions = ["1", "2", "3", "4", "5"]
    
    init() {
        UITableView.appearance().backgroundColor = .clear
    }
    
    // method formats time to string.
    private func formatTime(_ time: Int) -> String {
        let minutes = Int(time) / 60 % 60
       
        return String(format: "%02i min", minutes)
    }
    
    var body: some View {
        form
            .background(Color("BackgroundColor").ignoresSafeArea())
            .font(Font.custom("Montserrat-Regular", size: 15))
            .foregroundColor(Color("TextColor"))
        
            .navigationBarTitle("Configurações")
            .navigationBarHidden(false)

//            .onChange(of: focusTimeIndex) {
//                UserDefaults.standard.set(self.focusOptions[$0], forKey: Settings.pomodoro)
//            }
    }
    
    fileprivate var form: some View {
        Form {

            Section(header: Text("Timer").font(Font.custom("Montserrat-Regular", size: 12))) {
//                HStack {
//                    Picker(selection: $focusTimeIndex, label: Text("Objetivo")) {
//                    }
//                }

                HStack {
                    Picker(selection: $focusTime, label: Text("Tempo de foco")) {
                        ForEach(focusOptions, id: \.self) {
                            Text(formatTime($0))
                        }
                    }
                }
                
                HStack {
                    Picker(selection: $breakPause, label: Text("Pausa curta")) {
                        ForEach(shortPauseOptions, id: \.self) {
                            Text(formatTime($0))
                        }
                    }
                }
                
//                HStack {
//                    Picker(selection: $longPause, label: Text("Pausa longa")) {
//                        ForEach(longPauseOptions, id: \.self) {
//                            Text(formatTime($0))
//                        }
//                    }
//                }
                
//                HStack() {
//                    Picker(selection: $cycles, label: Text("Ciclos")) {
//                        ForEach(0..<cyclesOptions.count) {
//                            Text(self.cyclesOptions[$0])
//                        }
//                    }
//                }
            }
            .listRowBackground(Color("SectionColor"))
                    
//            Section(header: Text("Notifications").font(Font.custom("Montserrat-Regular", size: 12))) {
////                HStack {
////                    Picker(selection: $focusTimeIndex, label: Text("Sobre nós").font(Font.custom("Montserrat-Regular", size: 15))) {
////                    }
////                    .foregroundColor(Color("ActionColor"))
////                }
//                Toggle(isOn: $notificationsEnabled) {
//                    Text("Notificações").font(Font.custom("Montserrat-Regular", size: 15))
//                }
//                .foregroundColor(Color("ActionColor"))
//            }
            
//            Section {
//                Button(action: {
//                    print("Button clicked")
//                }, label: {
//                    Text("Resetar todas as configurações").font(Font.custom("Montserrat-Regular", size: 15))
//                        .foregroundColor(Color("ActionColor"))
//                })
//            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
