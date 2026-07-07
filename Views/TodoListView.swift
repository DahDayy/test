import SwiftUI

struct TodoListView: View {
    @EnvironmentObject var store: TodoStore
    @State private var newTitle: String = ""

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("New todo", text: $newTitle)
                        .textFieldStyle(.roundedBorder)
                    Button("Add") {
                        store.add(newTitle)
                        newTitle = ""
                    }
                    .disabled(newTitle.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                }
                .padding()

                List {
                    ForEach(store.items) { item in
                        TodoRowView(item: item)
                    }
                    .onDelete(perform: store.remove)
                    .onMove(perform: store.move)
                }
                .listStyle(.insetGrouped)
            }
            .navigationTitle("Todos")
            .toolbar {
                EditButton()
            }
        }
    }
}
