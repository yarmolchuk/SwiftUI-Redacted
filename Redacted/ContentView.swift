//
//  ContentView.swift
//  Redacted
//
//  Created by Dima Yarmolchuk on 13.03.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var isLoading = false
    
    var body: some View {
        VStack {
            VStack {
                Image("rossi")
                    .resizable()
                    .frame(width: 140, height: 140, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .clipShape(Circle())
                    
                
                Text("Valentino Rossi")
                    .font(.title)
                    .bold()
            }
            
            Spacer().frame(height: 30)
            
            VStack(alignment: .leading, spacing: 12) {
                HStack{
                    Image(systemName: "envelope")
                        .unredacted()
                    Text("ValentinoRossi@gmail.com")
                }

                HStack{
                    Image(systemName: "phone")
                        .unredacted()
                    Text("+39 0721 901119")
                }
                
                HStack{
                    Image(systemName: "network")
                        .unredacted()
                    Text("https://www.fanclubvalentinorossi.net")
                }
            }
            
            Spacer().frame(height: 30)
            
            Button {
                print("Button tapped")
            } label: {
                Text("Update profile")
                    .bold()
                    .frame(width: 260, height: 50, alignment: .center)
                    .background(Color.red)
                    .foregroundColor(Color.white)
                    .cornerRadius(12)
            }
            .disabled(isLoading)
        }
        .onAppear { startNetworkCall() }
        .redacted(reason: isLoading ? .placeholder : [])
    }
    
    func startNetworkCall() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            isLoading = false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
