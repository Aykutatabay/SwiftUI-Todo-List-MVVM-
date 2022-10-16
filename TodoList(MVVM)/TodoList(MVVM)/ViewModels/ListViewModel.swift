//
//  ListViewModel.swift
//  TodoList(MVVM)
//
//  Created by Aykut ATABAY on 10.10.2022.
//

import Foundation


class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = [] {
        didSet {
            // items içinde ne zaman bir degisiklik olursa didSet calısıcak
            saveItems()
        }
    }
    let itemsKey: String = "items_list"   
    init() {
        getItems()
    }
    func getItems() {
//        let newItems = [
//            ItemModel(title: "First", isCompleted: false),
//            ItemModel(title: "Second", isCompleted: true),
//            ItemModel(title: "Third", isCompleted: true)
//        ]
//        items.append(contentsOf: newItems)
        
        // data yı userdefaults ile almak için asagıdaki kodu yazıcaz
        
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
                // burada bir data var key ile datayı alıyorsun ondan data kullandık
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data) 
        else { return }
        
        self.items = savedItems
    }
    
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
        
    }
    
    func moveItem(from: IndexSet,to: Int ) {
        items.move(fromOffsets: from, toOffset: to)
        
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
        
    }
    
    func updateItem(item:ItemModel) {
//        if let index = items.firstIndex { (existingItem) -> Bool in
//            return existingItem.id == item.id
//        } {
//
//        }
        if let index = items.firstIndex(where: {$0.id == item.id}) {
            items[index] = item.updateCompletion()
        }
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey) // set edildigi için set kullanılır
            // encode kodla, kaydet anlamına gelir decode ise kaydedilen verileri tekrar acıp getirmek için kullanılır.
        }
    }
}
