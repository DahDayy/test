import Foundation

struct FileStorage {
    static func documentsDirectory() -> URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }

    static func save<T: Encodable>(_ value: T, to filename: String) throws {
        let url = documentsDirectory().appendingPathComponent(filename)
        let data = try JSONEncoder().encode(value)
        try data.write(to: url, options: [.atomicWrite])
    }

    static func load<T: Decodable>(_ filename: String, as type: T.Type) throws -> T {
        let url = documentsDirectory().appendingPathComponent(filename)
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode(type, from: data)
    }
}
