//
//  Modal.swift
//  Outfit7TakeHomeTest
//
//  Created by Aleksandar Milidrag on 15. 11. 2024..
//

import SwiftUI

struct Modal: View {
    
    @Binding var isShowingStats: Bool
    
    let title: String = "Stats:"
    let age: String
    let percentage: String
    let buttonTitle: String
    @State private var offset: CGFloat = 1000
    
    var body: some View {
        ZStack {
            Color(.black)
                .opacity(0.1)
                .onTapGesture {
                    close()
                }
            
            VStack {
                Text(title)
                    .font(.title2)
                    .bold()
                    .padding()
                
                VStack(alignment: .leading) {
                    Text(age)
                        .font(.body)
                    
                    Text(percentage)
                }
                Button {
                    close()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.blue)
                        
                        Text(buttonTitle)
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.white)
                            .padding()
                    }
                    .padding()
                }
            }
            .fixedSize(horizontal: false, vertical: true)
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(radius: 20)
            .padding(30)
            .offset(x: 0, y: offset)
            .onAppear {
                withAnimation(.spring(duration: 0.5)) {
                    offset = 0
                }
            }
        }
        .ignoresSafeArea()
    }
    
    func close() {
        withAnimation(.spring(duration: 0.5)) {
            offset = 1000
        }
        isShowingStats = false
    }
}

#Preview {
    Modal(isShowingStats: .constant(true), age: "\(10)", percentage: "\(11.0)", buttonTitle: "OK")
}

