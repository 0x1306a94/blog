---
title: "Swift Substring"
date: 2020-02-25T11:06:35+08:00
# draft: true
---

##### Swift SubString 操作

```Swift
import Foundation

extension String {
    subscript(value: PartialRangeUpTo<Int>) -> Substring {
        get {
            return self[..<index(startIndex, offsetBy: value.upperBound)]
        }
    }
    
    subscript(value: PartialRangeThrough<Int>) -> Substring {
        get {
            return self[...index(startIndex, offsetBy: value.upperBound)]
        }
    }
    
    subscript(value: PartialRangeFrom<Int>) -> Substring {
        get {
            return self[index(startIndex, offsetBy: value.lowerBound)...]
        }
    }
    
    subscript(value: CountableRange<Int>) -> Substring {
        get {
            let start = index(self.startIndex, offsetBy: value.lowerBound)
            let end = index(self.startIndex, offsetBy: value.upperBound)
            return self[start..<end]
        }
    }
    
    subscript(value: ClosedRange<Int>) -> Substring {
        get {
            let start = index(self.startIndex, offsetBy: value.lowerBound)
            let end = index(self.startIndex, offsetBy: value.upperBound)
            return self[start...end]
        }
    }
}

let str = "hello"
// PartialRangeFrom
print(str[1...]) // ello
// PartialRangeThrough
print(str[...3]) //  hell
// PartialRangeUpTo
print(str[..<3]) // hel
// ClosedRange
print(str[1...3]) // ell
// CountableRange
print(str[1..<3]) // el
```

