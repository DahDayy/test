import SwiftUI

@main
struct MyTodoApp: App {
    @StateObject private var store = TodoStore()

    var body: some Scene {
        WindowGroup {
            TodoListView()
                .environmentObject(store)
        }
    }
}
