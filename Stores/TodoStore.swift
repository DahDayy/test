import Foundation

final class TodoStore: ObservableObject {
    @Published var items: [TodoItem] = []
    private let filename = "todos.json"

    init() {
        load()
    }

    func add(_ title: String) {
        let trimmed = title.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }
        items.insert(TodoItem(title: trimmed), at: 0)
        save()
    }

    func toggle(_ item: TodoItem) {
        guard let idx = items.firstIndex(of: item) else { return }
        items[idx].isDone.toggle()
        save()
    }

    func remove(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
        save()
    }

    func move(from source: IndexSet, to destination: Int) {
        items.move(fromOffsets: source, toOffset: destination)
        save()
    }

    private func save() {
        do {
            try FileStorage.save(items, to: filename)
        } catch {
            print("Save error:", error)
        }
    }

    private func load() {
        do {
            items = try FileStorage.load(filename, as: [TodoItem].self)
        } catch {
            items = []
        }
    }
}
