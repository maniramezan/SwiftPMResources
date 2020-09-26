import XCTest
@testable import SwiftPMResources

final class SwiftPMResourcesTests: XCTestCase {
    func testLoadingFromTestBundle() {
        let testDataBundle = Bundle.module

        let testDataURL = testDataBundle.path(
            forResource: "testData",
            ofType: "json",
            inDirectory: "ThisForTests/SomeFolder")
        let dataLoader = DataLoader(dataPath: testDataURL!)
        let data = dataLoader.readData()
        XCTAssertEqual(data.name, "boo")
    }
    
    func testLoadingFromAppBundle() {
        let dataLoader = DataLoader()
        let data = dataLoader.readData()
        XCTAssertEqual(data.name, "foo")
    }

    static var allTests = [
        ("testLoadingFromTestBundle", testLoadingFromTestBundle),
        ("testLoadingFromAppBundle", testLoadingFromAppBundle)
    ]
}
