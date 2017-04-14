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

// for case ...
let numArrays = [1, 2, 3, 1, 2, 1]
// 打印数组中值为1的情况
for case 1 in numArrays {
    print("1")
}

// 2.值绑定模式
let point1 = (0.0, 10.0, 0.0)
// 对于值绑定模式，用let来绑定要处理的值
// 绑定一个值，let可以在内部
if case (0.0, let y, 0.0) = point1 {
    print("单值绑定：在y轴上，y = \(y)")

} else {
    print("单值绑定：不在y轴上")
}

// 绑定多个值，let可以在外部
let point2 = (10.0, 10.0, 0.0)
if case let (x, y, 0.0) = point2 {
    print("多值绑定：在x和y的平面上")

} else {
    print("多值绑定：不在x和y的平面上")
}

// 3.枚举匹配
enum GetDataFromServer {
    case success(data: String)
    case fail(code: String, message: String)
}

let dataFromServer = GetDataFromServer.success(data: "获取数据成功")
switch dataFromServer {
case .success(let data):// 绑定枚举的值，单个值的情况，let在内部
    print("data = \(data)")

case let .fail(code, message):// 绑定枚举的值，多个值的情况，let可以在外部如：.fail(let code, let message)
    print("error code= \(code), message = \(message)")
}

// 4.可选匹配
// 打印出数组中不是nil的值
let strings: [String?] = ["1", "2", nil, "3", "4", nil, "5"]
for case let str? in strings {
    print(str)
}

// 5. is类型转换匹配
let strs: [Any] = [1, "1", "one", "2", 2, "two"]
for element in strs {
    switch element {
    case is String:
        print("是String")

    default:
        print("是Int")
    }
}

// 6. as类型转换匹配
// 也是通过值绑定的形式来处理的
for element in strs {
    switch element {
    case let str as String:
        print("是String，值是 = \(str)")

    case let num as Int:
        print("是Int，值是 = \(num)")

    default:
        print("其它类型")
    }
}

// where关键字的使用
for num in 0...10 {
    switch num {
    case let n where n % 2 == 0:
        print("--偶数，num = \(n)")

    default:
        print("-奇数，num = \(num)")
    }
}

enum Direction {
    case North(location: Int)
    case South
    case West
    case East
}

let direction = Direction.North(location: 5)
switch direction {
case .North(let location) where location > 4:
    print("north location = \(location)")
    
case .South:
    print("South")
    
case .West:
    print("West")
    
case .East:
    print("East")
    
default:
    print("default")
}

// 可以两个case组合，用“,”分割
// 第一部分用let location绑定，第二部分用前面绑定的值匹配范围
if case .North(let location) = direction, case 3...6 = location {
    print("two case: north location = \(location)")
}

// 元组的模式匹配
let location = "shanghai"
let areacode = 023
if case ("shanghai", 023) = (location, areacode) {
    print("元组类型的模式匹配")
}

var username: String?
var password: String?
switch (username, password) {
case let (nil, nil):
    print("都为空")
case let (username?, nil):
    print("有用户名，没有密码")
case let (nil, password?):
    print("没有用户名，有密码")
case let (username?, password?):
    print("用户名和密码都有")
}









