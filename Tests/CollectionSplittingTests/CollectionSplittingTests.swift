import XCTest
@testable import CollectionSplitting

final class CollectionSplittingTests: XCTestCase {

    func test_splitting_negativeSize() {
        let a = [Int].random
        let res = a.split(maxSize: Int.random(in: -5 ... -1))
        XCTAssertTrue(res == [])
    }

    func test_splitting_zeroSize() {
        let a = [Int].random
        let res = a.split(maxSize: 0)
        XCTAssertTrue(res == [])
    }

    func test_splitting_empty() {
        let a: ArraySlice<Int> = []
        let res = a.split(maxSize: Int.random(in: 1 ... 5))
        XCTAssertTrue(res == [a])
    }

    func test_splitting_notEnoughEntries() {
        let m = 5
        let a = [Int].random(count: m)
        let b = [ a[0 ..< m] ]
        let n = Int.random(in: 6 ... 10)
        let res = a.split(maxSize: n)
        XCTAssertTrue(res.elementsEqual(b))
    }

    func test_splitting_sameSize() {
        let m = Int.random(in: 1 ... 5)
        let a = [Int].random(count: m)
        let b = [ a[0 ..< m] ]
        let res = a.split(maxSize: m)
        XCTAssertTrue(res.elementsEqual(b))
    }

    func test_splitting() {
        let a = [Int].random(count: Int.random(in: 2 ... 10))
        let n = Int.random(in: 1 ..< a.count)
        let indices = a.indices
        let splitIndices = indices.filter { $0 % n == 0 }
        let maxSplitIndex = splitIndices.max()
        XCTAssertTrue(maxSplitIndex != nil)
        let firstIndexAfterMaxSplitIndex = indices
            .filter { $0 >= maxSplitIndex! }
            .min()
        let z = zip(splitIndices, splitIndices.dropFirst())
            .map { a[$0 ..< $1] }
        let exp: [ArraySlice<Int>]
        if firstIndexAfterMaxSplitIndex == nil {
            exp = z
        } else {
            exp = z + [firstIndexAfterMaxSplitIndex! ... indices.last!].map { a[$0] }
        }
        let res = a.split(maxSize: n)
        XCTAssertTrue(res == exp)
    }

}
