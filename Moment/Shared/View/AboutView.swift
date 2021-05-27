//
//  AboutView.swift
//  Moment
//
//  Created by Gustavo Lemos on 25/05/21.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        
        NavigationView {
            VStack(spacing:0) {
                nameIcon
                version
                followButtons
                descriptionText
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .navigationBarHidden(true)
            .background(Color("BackgroundColor").ignoresSafeArea())
            .foregroundColor(Color.white)
            
            
            
        }
    }
    
    fileprivate var about: some View {
        Form {
            
        }
        
    }
    
    private var nameIcon: some View {
        VStack(spacing: 30) {
            
            Image("circleIcon")
                .resizable()
                .frame(width: 120, height: 120, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .scaledToFill()
                .aspectRatio(contentMode: .fill)
                .padding(.top, 50)
            
            
            Text("Moment")
                .foregroundColor(Color("TextColor"))
                .multilineTextAlignment(.center)
                .font(.custom("Montserrat-SemiBold", size: 28))
                .padding(.bottom,50)
            
            
        }
    }
    
    private var version: some View {
        HStack(spacing: 250){
            Text("Version")
                .foregroundColor(Color("TextColor"))
                .multilineTextAlignment(.center)
                .font(.custom("Montserrat-SemiBold", size: 14))
            
            Text("0.1")
                .foregroundColor(Color("TextColor"))
                .multilineTextAlignment(.center)
                .font(.custom("Montserrat-Regular", size: 14))
        }
    }
    
    private var followButtons: some View {
        HStack(spacing:0){
            Text("Follow us")
                .foregroundColor(Color("TextColor"))
                .multilineTextAlignment(.center)
                .font(.custom("Montserrat-SemiBold", size: 14))
                .padding(.trailing,85)
            
            
            //Instagram
            Button(action: {
                print("Instagram")
            }) {
                Image("instagramIcon").renderingMode(.template)
                    .resizable()
                    .foregroundColor(Color("ActionColor"))
                    .frame(width: 24, height: 24, alignment: .center)
            }.padding()
            
            //Twitter
            Button(action: {
                print("Twitter")
            }) {
                Image("twitterIcon").renderingMode(.template)
                    .resizable()
                    .foregroundColor(Color("ActionColor"))
                    .frame(width: 24, height: 24, alignment: .center)
            }.padding()
            
            //Facebook
            Button(action: {
                print("Facebook")
            }) {
                Image("facebookIcon").renderingMode(.template)
                    .resizable()
                    .foregroundColor(Color("ActionColor"))
                    .frame(width: 24, height: 24, alignment: .center)
            }.padding()
            
            
        }
        
        
    }
    
    private var descriptionText: some View{
        VStack{
            Text("Moment é um timer feito e inspirado na técnica de estudos pomodoro. Desenvolvido para auxiliar no seu foco, melhorar sua produtividade em qualquer tarefa e diminuir o stress.")
                .foregroundColor(Color("TextColor"))
                .multilineTextAlignment(.leading)
                .font(.custom("Montserrat-Regular", size: 14))
                .frame(maxWidth: 330, maxHeight: 100, alignment: .top)
            
            Text("Disponível nas plataformas macOS e iOS.")
                .foregroundColor(Color("TextColor"))
                .multilineTextAlignment(.leading)
                .font(.custom("Montserrat-Regular", size: 14))
                .frame(maxWidth: 330, maxHeight: 100, alignment: .top)
                .padding(.leading, -40)
        }
    }
    
    
    
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
