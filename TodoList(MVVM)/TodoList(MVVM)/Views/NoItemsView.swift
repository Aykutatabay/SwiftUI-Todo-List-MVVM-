//
//  NoItemsView.swift
//  TodoList(MVVM)
//
//  Created by Aykut ATABAY on 10.10.2022.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animate: Bool = false
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("There are no items !")
                    .font(.title)
                    .fontWeight(.semibold)
                
                Text("Click add button to add bunch of todo list !")
                    .padding(.bottom, 20)
                
                
                NavigationLink(destination: AddView(), label: {
                    Text("Add something !")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? .red : .accentColor)
                        .cornerRadius(10)
                })
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(color: animate ? .red : .accentColor,
                        radius: 20, y: 50)
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
            }
            .multilineTextAlignment(.center)
            .padding(50)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation(
                .easeInOut(duration: 2.0)
                .repeatForever()
            
            ) {
                animate.toggle()
            }
        }
    }
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoItemsView()
                .navigationTitle("Title")
        }
        .previewInterfaceOrientation(.portrait)
    }
}
