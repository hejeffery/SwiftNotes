//: Playground - noun: a place where people can play

import UIKit

// 模式匹配

// 1.通配符模式：_表示忽略某个值
let point = (x: 0.0, y: 20.0, z: 30.0)

// if case ...
if case (_, 20.0, 30.0) = point {
    print("if case 在y和z的平面上")
}

// guard case ... else
guard case (_, 20.0, 30.0) = point else {
    fatalError("guard case 不在y和z的平面上")
}
print("guard case 在y和z的平面上")

// for case
// 打印出数组中不是nil的值
let strings: [String?] = ["1", "2", nil, "3", "4", nil, "5"]
for case let str? in strings {
    print(str)
}








