//
//  AboutView.swift
//  PlatinumCars
//
//  Created by Mantas Simanauskas on 2021-11-05.
//

import SwiftUI

struct AboutView: View {
    
   @State var isShowing = true
    
    var body: some View {
        ZStack {
            Color(hex: "181619")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image("whiteFerrari")
                    .resizable()
                    .frame(width: .infinity)
                    .scaledToFit()
                
                VStack(alignment: .leading, spacing: 20) {
                    Image("logo")
                        .resizable()
                        .frame(width: .infinity)
                        .scaledToFit()
                        .colorInvert()
                    
                    Text("Sveriges största och ledande leverantörer av exklusiva bilar.")
                        .foregroundColor(.white.opacity(0.75))
                        .lineSpacing(5)
                    
                    Button(action: { self.isShowing.toggle()}, label: {
                        RoundedRectangle(cornerRadius: 60)
                            .overlay (
                                Text("THE COLLECTION")
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color(hex: "181619"))
                            )
                            .foregroundColor(.white)
                            .frame(width: .infinity, height: 70)

                    })                    .padding(.top, 20)
                }
                .padding(.horizontal, 30)
                
            }
            .disabled(!isShowing)
            .opacity(isShowing ? 1 : 0)
            
            ContentView()
                .disabled(isShowing)
                .opacity(isShowing ? 0 : 1)
        }
        .animation(.spring(), value: isShowing)
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
