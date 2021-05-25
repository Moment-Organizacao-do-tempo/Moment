//
//  SettingsView.swift
//  Moment
//
//  Created by Lucas Fernandes on 21/05/21.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage(Settings.notificationsEnabled) private var notificationsEnabled = false
    @AppStorage(Settings.focusTimeIndex) private var focusTimeIndex = 2
    @AppStorage(Settings.shortPauseIndex) private var shortPauseIndex = 0
    @AppStorage(Settings.longPauseIndex) private var longPauseIndex = 0
    @AppStorage(Settings.cyclesIndex) private var cyclesIndex = 2
    
    init() {
        UITableView.appearance().backgroundColor = .clear
    }
    
    var previewOptions = [900, 1200, 1500, 1800, 2100, 2400]
    var shortPauseOptions = [300, 600, 900, 1200]
    var longPauseOptions = [1200, 1500, 1800, 2100, 2400]
    var cyclesOptions = ["1", "2", "3", "4", "5"]
    
    // method formats time to string.
    private func formatTime(_ time: Int) -> String {
        let minutes = Int(time) / 60 % 60
       
        return String(format: "%02i min", minutes)
    }
    
    var body: some View {
        form
            .background(Color("BackgroundColor").ignoresSafeArea())
            .foregroundColor(Color.black)
            .navigationBarTitle("Configurações")
            .navigationBarHidden(false)
    }
    
    fileprivate var form: some View {
        Form {
            
            Section(header: Text("Timer").font(Font.custom("Montserrat-Regular", size: 12))) {
                HStack {
                    Picker(selection: $focusTimeIndex, label: Text("Objetivo").font(Font.custom("Montserrat-Regular", size: 15))) {
                    }
                    .foregroundColor(Color("ActionColor"))
                }
                
                HStack {
                    Picker(selection: $focusTimeIndex, label: Text("Tempo de foco").font(Font.custom("Montserrat-Regular", size: 15))) {
                        ForEach(0..<previewOptions.count) {
                            Text(formatTime(self.previewOptions[$0])).font(Font.custom("Montserrat-Regular", size: 15))
                        }
                    }
                    .foregroundColor(Color("ActionColor"))
                }
                
                HStack {
                    Picker(selection: $shortPauseIndex, label: Text("Pausa curta").font(Font.custom("Montserrat-Regular", size: 15))) {
                        ForEach(0..<shortPauseOptions.count) {
                            Text(formatTime(self.shortPauseOptions[$0])).font(Font.custom("Montserrat-Regular", size: 15))
                        }
                    }
                    .foregroundColor(Color("ActionColor"))
                }
                
                HStack {
                    Picker(selection: $longPauseIndex, label: Text("Pausa longa").font(Font.custom("Montserrat-Regular", size: 15))) {
                        ForEach(0..<longPauseOptions.count) {
                            Text(formatTime(self.longPauseOptions[$0])).font(Font.custom("Montserrat-Regular", size: 15))
                        }
                    }
                    .foregroundColor(Color("ActionColor"))
                }
                
                HStack {
                    Picker(selection: $cyclesIndex, label: Text("Ciclos").font(Font.custom("Montserrat-Regular", size: 15))) {
                        ForEach(0..<cyclesOptions.count) {
                            Text(self.cyclesOptions[$0]).font(Font.custom("Montserrat-Regular", size: 15))
                        }
                    }
                    .foregroundColor(Color("ActionColor"))
                }
            }
            
            Section(header: Text("Notifications").font(Font.custom("Montserrat-Regular", size: 12))) {
                HStack {
                    Picker(selection: $focusTimeIndex, label: Text("Sobre nós").font(Font.custom("Montserrat-Regular", size: 15))) {
                    }
                    .foregroundColor(Color("ActionColor"))
                }
                Toggle(isOn: $notificationsEnabled) {
                    Text("Notificações").font(Font.custom("Montserrat-Regular", size: 15))
                }
                .foregroundColor(Color("ActionColor"))
            }
            
            Section {
                Button(action: {
                    print("Button clicked")
                }, label: {
                    Text("Resetar todas as configurações").font(Font.custom("Montserrat-Regular", size: 15))
                        .foregroundColor(Color("ActionColor"))
                })
            }
        }
        .border(Color.red)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
