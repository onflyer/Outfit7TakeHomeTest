//
//  Modal.swift
//  Outfit7TakeHomeTest
//
//  Created by Aleksandar Milidrag on 15. 11. 2024..
//

import SwiftUI

struct ModalView: View {
    
    @Binding var isShowingStats: Bool
    @State private var transitionOffset: CGFloat = 1000
    
    let title: String = "Stats:"
    let age: String
    let percentage: String
    let buttonTitle: String
    
    
    var body: some View {
        ZStack {
            backgroundMaterial
            modalCard
                .onAppear {
                    withAnimation(.spring(duration: 0.5)) {
                        transitionOffset = 0
                    }
                }
        }
        .ignoresSafeArea()
    }
}

extension ModalView {
    
    var backgroundMaterial: some View {
        Color(.black)
            .opacity(0.1)
            .onTapGesture {
                dissmisModal()
            }
    }
    
    var statsTitle: some View {
        Text(title)
            .font(.title2)
            .bold()
            .padding()
    }
    
    var statsText: some View {
        VStack(alignment: .leading) {
            Text(age)
                .font(.body)
            
            Text(percentage)
        }
    }
    
    var dismissButton: some View {
        Button {
            dissmisModal()
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
    
    var modalCard: some View {
        VStack {
            statsTitle
            statsText
            dismissButton
        }
        .fixedSize(horizontal: false, vertical: true)
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(radius: 20)
        .padding(30)
        .offset(x: 0, y: transitionOffset)
    }
    
    func dissmisModal() {
        withAnimation(.spring(duration: 0.5)) {
            transitionOffset = 1000
        }
        isShowingStats = false
    }
}

#Preview {
    ModalView(isShowingStats: .constant(true), age: "\(10)", percentage: "\(11.0)", buttonTitle: "OK")
}

