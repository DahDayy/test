# Simple Todo iOS App (SwiftUI)

This folder contains a minimal SwiftUI todo app you can open in Xcode.

How to use:

1. On a Mac with Xcode, create a new Xcode project (App) using SwiftUI.
2. In Finder, drag the `TodoApp` folder into the project navigator, or copy the `.swift` files into the new project's group.
3. Set the app's `@main` type to `MyTodoApp` if Xcode created a different app struct.
4. Build and run on the iOS simulator.

Files added:
- `TodoApp.swift` — app entry point.
- `Models/TodoItem.swift` — model for a todo.
- `Stores/TodoStore.swift` — observable store with simple file persistence.
- `Services/FileStorage.swift` — lightweight JSON file storage.
- `Views/TodoListView.swift` — main list UI.
- `Views/TodoRowView.swift` — row view.

Notes:
- Persistence uses the app sandbox `Documents` directory via JSON encoding.
- This is intended as a simple starter; you can replace persistence with Core Data later.
