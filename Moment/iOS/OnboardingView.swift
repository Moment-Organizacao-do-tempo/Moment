//
//  OnboardingView.swift
//  Moment (iOS)
//
//  Created by Nathalia Cardoso on 25/05/21.
//

import SwiftUI

struct OnboardingView: View {
    @State var phase: CGFloat = 0.0
    @State var getStart = false
    var body: some View {
        ZStack {
            RadialGradient(
                gradient: Gradient(stops: [
                                    .init(color: Color(#colorLiteral(red: 0.9725490212440491, green: 0.9803921580314636, blue: 0.9960784316062927, alpha: 1)), location: 0),
                                    .init(color: Color(#colorLiteral(red: 0.5607843399047852, green: 0.6117647290229797, blue: 0.7490196228027344, alpha: 1)), location: 1)]),
                center: UnitPoint(x: 0.5, y: 0.49999999999999994),
                startRadius: 1,
                endRadius: 500
            ).ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 19, content: {
                Spacer()
                Text("Bem vindo ao Moment\n")
                    .font(Font.custom("Montserrat-Bold", size: 36)).foregroundColor(Color.init("TextColor-1"))
                
                Label {
                    VStack(alignment: .leading) {
                        Text("Gerencie seu tempo\n").font(Font.custom("Montserrat-SemiBold", size: 16)).foregroundColor(Color.init("TextColor-1"))
                        Text("Utilize da técnica pomodoro para estudo, respeitando o tempo de foco e pausa.").font(Font.custom("Montserrat-Regular", size: 16)).foregroundColor(Color.init("TextColor-1"))
                    }
                    
                } icon: {
                    Image("clock")
                        .frame(width: 60, height: 60).padding()
                } .labelStyle(CenteredLabelStyle())
                
                Label {
                    VStack(alignment: .leading) {
                        Text("Você no controle\n").font(Font.custom("Montserrat-SemiBold", size: 16)).foregroundColor(Color.init("TextColor-1"))
                        Text("Sete um objetivo e um tempo dedicado a cada atividade.").font(Font.custom("Montserrat-Regular", size: 16)).foregroundColor(Color.init("TextColor-1"))
                    }
                    
                } icon: {
                    Image("heart")
                        .frame(width: 60, height: 60).padding()
                } .labelStyle(CenteredLabelStyle())
                
                Label {
                    VStack(alignment: .leading) {
                        Text("Seja produtivo\n").font(Font.custom("Montserrat-SemiBold", size: 16)).foregroundColor(Color.init("TextColor-1"))
                        Text("Tenha melhor desempenho e foco em suas atividades.").font(Font.custom("Montserrat-Regular", size: 16)).foregroundColor(Color.init("TextColor-1"))
                    }
                    
                } icon: {
                    Image("graph")
                        .frame(width: 60, height: 60).padding()
                } .labelStyle(CenteredLabelStyle())
                Spacer()
                HStack {
                    Spacer()
                    Button(action: { goHome() }) {
                        Text("Comece já!")
                            .bold()
                            .font(Font.custom("Montserrat-Regular", size: 18.0))
                            .padding(20)
                            .foregroundColor(Color.white)
                            .background(Color.init("FillWaterWave"))
                            .cornerRadius(20)
                    }
                    Spacer()
                }
                Spacer()
            }).frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, minHeight: 0, idealHeight: 100, maxHeight: .infinity, alignment: .leading).padding(20)
            .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
        }
    }
    
    func goHome() {
        if let window = UIApplication.shared.windows.first {
            window.rootViewController = UIHostingController(rootView: ContentViewIOS())
            window.makeKeyAndVisible()
        }
    }
}

struct CenteredLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.icon
            configuration.title
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
