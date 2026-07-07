import SwiftUI

struct TodoRowView: View {
    @EnvironmentObject var store: TodoStore
    var item: TodoItem

    var body: some View {
        HStack {
            Button(action: { store.toggle(item) }) {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(item.isDone ? .green : .primary)
            }
            .buttonStyle(.plain)

            Text(item.title)
                .strikethrough(item.isDone)
                .foregroundColor(item.isDone ? .secondary : .primary)

            Spacer()
        }
        .padding(.vertical, 4)
    }
}
