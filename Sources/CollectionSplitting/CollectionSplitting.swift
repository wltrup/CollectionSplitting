import Foundation

public extension Collection {
    
    // splits self into an array of sub-sequences of self, each of count maxSize,
    // except possibly for the last sub-sequence, which may be shorter.
    func split(maxSize size: Int) -> [SubSequence] {
        return split(indices, maxSize: size).map {
            self[$0.startIndex ..< $0.endIndex]
        }
    }
    
}

extension Collection {
    
    func split(_ indices: Indices, maxSize size: Int) -> [Indices] {
        
        guard size > 0 else { return [] }
        guard indices.count > size else { return [indices] }
        
        let startIdx = indices.startIndex
        let endIdx = indices.endIndex
        
        var sizeIdx = startIdx
        _ = formIndex(&sizeIdx, offsetBy: size, limitedBy: endIdx)
        let head = indices[startIdx ..< sizeIdx]
        
        var countIdx = sizeIdx
        _ = formIndex(&countIdx, offsetBy: count, limitedBy: endIdx)
        let tail = indices[sizeIdx ..< countIdx]
        
        return [head] + split(tail, maxSize: size)
        
    }
    
}
