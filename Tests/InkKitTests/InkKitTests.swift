import XCTest
@testable import InkKit

final class InkKitTests: XCTestCase {
    func testSameSeedGivesTheSameStroke() {
        var a = RoughGenerator(RoughOptions(seed: 7)), b = RoughGenerator(RoughOptions(seed: 7))
        let line = [CGPoint(x: 0, y: 0), CGPoint(x: 80, y: 30), CGPoint(x: 160, y: 5)]
        XCTAssertEqual(a.curve(line).count, b.curve(line).count)
        var r1 = InkRandom(seed: 3), r2 = InkRandom(seed: 3)
        XCTAssertEqual(r1.next(), r2.next())
    }

    func testPalettesDifferByThemeAndAppearance() {
        XCTAssertFalse(Palette.make(.ink, dark: false).isDark)
        XCTAssertTrue(Palette.make(.ink, dark: true).isDark)
        XCTAssertNotEqual(Palette.make(.ink, dark: false).paper, Palette.make(.ink, dark: true).paper)
        XCTAssertNotEqual(Palette.make(.ink, dark: false).paper, Palette.make(.sketch, dark: false).paper)
    }

    func testCurrentThemeFollowsTheDefaultsKey() {
        let saved = UserDefaults.standard.string(forKey: "theme")
        defer { UserDefaults.standard.set(saved, forKey: "theme") }
        UserDefaults.standard.set("sketch", forKey: "theme")
        XCTAssertEqual(ThemeID.current, .sketch)
        UserDefaults.standard.removeObject(forKey: "theme")
        XCTAssertEqual(ThemeID.current, .ink)
    }
}
