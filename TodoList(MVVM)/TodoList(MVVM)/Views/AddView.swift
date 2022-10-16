//
//  AddView.swift
//  TodoList(MVVM)
//
//  Created by Aykut ATABAY on 10.10.2022.
//

import SwiftUI

struct AddView: View {    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    @State var textfieldText: String = ""
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here...", text: $textfieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(.gray.opacity(0.2))
                    .cornerRadius(10)
                
                Button(action: {
                    saveButtonPressed()
                }, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(15)
                })
            }
            .padding(14)
        }
        .navigationTitle("Add an Item 🖋")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    func saveButtonPressed() {
        if textIsAppropriate() {
            listViewModel.addItem(title: textfieldText)
            presentationMode.wrappedValue.dismiss()
        } else {
        }
    }
    func textIsAppropriate() ->Bool {
        if textfieldText.count < 3 {
            alertTitle = "YOUR NEW İTEM MUST BE AT LEAT THREE CHARACRER LONG !!"
            showAlert.toggle()
            return false
        }
        return true
    }
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .environmentObject(ListViewModel())
        
    }
}
