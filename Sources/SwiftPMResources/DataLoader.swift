import Foundation

struct Data: Codable {
    var name: String
}
struct DataLoader {
    let dataPath: String
    
    init(dataPath: String) {
        self.dataPath = dataPath
    }
    
    init() {
        self.dataPath = Bundle.module.path(
            forResource: "data",
            ofType: "json",
            inDirectory: "CopyThis/InnerFolder")!
    }
    
    func readData() -> Data {
        return try! JSONDecoder().decode(Data.self, from: FileManager.default.contents(atPath: dataPath)!)
    }
}
