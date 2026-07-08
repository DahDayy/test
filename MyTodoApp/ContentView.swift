import SwiftUI

struct TodoItem: Identifiable, Codable {
    let id: UUID
    var title: String
    var isDone: Bool

    init(id: UUID = UUID(), title: String, isDone: Bool = false) {
        self.id = id
        self.title = title
        self.isDone = isDone
    }
}

struct ContentView: View {
    @State private var newTodo = ""
    @State private var items: [TodoItem] = [
        TodoItem(title: "Write a plan"),
        TodoItem(title: "Ship the first build", isDone: true)
    ]

    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                HStack {
                    TextField("What needs doing?", text: $newTodo)
                        .textFieldStyle(.roundedBorder)

                    Button("Add") {
                        guard !newTodo.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return }
                        items.append(TodoItem(title: newTodo.trimmingCharacters(in: .whitespacesAndNewlines)))
                        newTodo = ""
                    }
                    .buttonStyle(.borderedProminent)
                }

                List {
                    ForEach($items) { $item in
                        HStack {
                            Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                                .foregroundStyle(item.isDone ? .green : .secondary)
                            TextField("Todo", text: $item.title)
                                .strikethrough(item.isDone)
                            Spacer()
                            Toggle("", isOn: $item.isDone)
                                .labelsHidden()
                        }
                    }
                    .onDelete { indexSet in
                        items.remove(atOffsets: indexSet)
                    }
                }
                .listStyle(.insetGrouped)
            }
            .padding()
            .navigationTitle("Todos")
        }
    }
}

#Preview {
    ContentView()
}
