import UIKit

// x.isMultiple(of: 15) 检测x是否为15的倍数
// switch 语句case高级使用使用

// 变量匹配
(0...100).forEach { (num) in
    switch num {
    case let x  where x.isMultiple(of: 15):
        print("\(num) fizzbuzz")
    case let x  where x.isMultiple(of: 3):
        print("\(num) fizz")
    case let x where x.isMultiple(of: 5):
        print("\(num) buzz")
    default:
        print(num)
    }
}


// 元组匹配
(0...100).forEach { (num) in
    switch (num.isMultiple(of: 5),num.isMultiple(of: 3)) {
    case (true,true):
        print("\(num) fizzbuzz")
    case (false,true):
        print("\(num) fizz")
    case (true,false):
        print("\(num) buzz")
    default:
        print(num)
    }
}



