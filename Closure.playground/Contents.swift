//: Playground - noun: a place where people can play

import UIKit

// 定义一个closure: { (params) -> retureType in statement }
let multiplyClosure = { (number1: Int, number2: Int) -> Int in
    return number1 * number2
}

let addClosure = { (number1: Int, number2: Int) -> Int in
    return number1 + number2
}

let subClosure = { (number1: Int, number2: Int) -> Int in
    return number1 - number2
}

let divClosure = { (number1: Int, number2: Int) -> Int in
    return number1 / number2
}

let result = multiplyClosure(9, 90)

// 方法在swift中是一种类型，可以赋值给变量或者是常量，也可以是方法的返回值，也可以是方法的参数
func mathOperate(_ number1: Int, _ number2: Int, operate: (Int, Int) -> Int) -> Int {
    return operate(number1, number2)
}

let multipyResult = mathOperate(10, 10, operate: multiplyClosure)
let addResult = mathOperate(100, 100, operate: addClosure)
let subResult = mathOperate(90, 9, operate: subClosure)
let divResult = mathOperate(20, 2, operate: divClosure)

// 闭包中的隐藏参数，从$0开始
let closureResult = mathOperate(100, 88, operate: {$0 - $1})
print("closureResult = \(closureResult)")

let closureResult1 = mathOperate(88, 77, operate: *)
print("closureResult1 = \(closureResult1)")

// 尾随闭包：方法的最后一个参数是比闭包，可以写成如下形式
let tailClosureResult = mathOperate(90, 1) {
    return $0 - $1
}

