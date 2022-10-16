//
//  TodoList_MVVM_App.swift
//  TodoList(MVVM)
//
//  Created by Aykut ATABAY on 10.10.2022.
//

import SwiftUI
/*
 MVVM Architecture
 
 Model - data point
 View - UI
 ViewModel - manages Models for View
 
 
 
 */
@main
struct TodoList_MVVM_App: App {
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
        }
        
    }
}
