//
//  ContentView.swift
//  proto
//
//  Created by 玉川悠真 on 2023/01/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    enum bottomtab {
        case home
        case map
        //case report
        case setting
    }
    @State private var isShowingView: bottomtab = .home
    
    var body: some View {
        NavigationView {
            VStack(spacing: .zero) {
                switch isShowingView {
                    case .home: Homeview()
                    case .map: Mapview()
                    //case .report: Reportview()
                    case .setting: Settingview()
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Button(action: {isShowingView = .home}) {
                        Text("Home")
                            .bold()
                            .padding()
                            .frame(width: 80, height: 70)
                            .foregroundColor(Color.black)
                            .overlay(
                                Circle()
                                .stroke(Color.yellow, lineWidth: 3)
                            )
                    }
                    Spacer()
                    Button(action: {isShowingView = .map}) {
                        Text("Map")
                            .bold()
                            .padding()
                            .frame(width: 70, height: 70)
                            .foregroundColor(Color.black)
                            .overlay(
                                Circle()
                                .stroke(Color.yellow, lineWidth: 3)
                            )
                    }
                    Spacer()
                    //Button("report"){isShowingView = .report}
                    //Spacer()
                    Button(action: {isShowingView = .setting}) {
                        Text("Set")
                            .bold()
                            .padding()
                            .frame(width: 70, height: 70)
                            .foregroundColor(Color.black)
                            .overlay(
                                Circle()
                                .stroke(Color.yellow, lineWidth: 3)
                            )
                    }
                }
            }
        }
    }
    /*@Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>

    var body: some View {
        NavigationView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        Text("Item at \(item.timestamp!, formatter: itemFormatter)")
                    } label: {
                        Text(item.timestamp!, formatter: itemFormatter)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }*/
}/*

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()
*/
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()//.environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
