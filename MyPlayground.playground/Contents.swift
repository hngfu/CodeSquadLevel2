//: Playground - noun: a place where people can play

import Cocoa


//////MARK: - 2, 3단 구현 - 계산과 출력
//var str = "Hello, IOS World"
////2단
//print("\(2*1)")
//print("\(2*2)")
//print("\(2*3)")
//print("\(2*4)")
//print("\(2*5)")
//print("\(2*6)")
//print("\(2*7)")
//print("\(2*8)")
//print("\(2*9)")
////3단
//print("\(3*1)")
//print("\(3*2)")
//print("\(3*3)")
//print("\(3*4)")
//print("\(3*5)")
//print("\(3*6)")
//print("\(3*7)")
//print("\(3*8)")
//print("\(3*9)")
//
//////MARK: 4, 5단 구현 - 변수
////4단
//var num = 4
//var i = num*1
//print(i)
//i = num*2
//print(i)
//i = num*3
//print(i)
//i = num*4
//print(i)
//i = num*5
//print(i)
//i = num*6
//print(i)
//i = num*7
//print(i)
//i = num*8
//print(i)
//i = num*9
//print(i)
////5단
//num = 5
//i = num*1
//print(i)
//i = num*2
//print(i)
//i = num*3
//print(i)
//i = num*4
//print(i)
//i = num*5
//print(i)
//i = num*6
//print(i)
//i = num*7
//print(i)
//i = num*8
//print(i)
//i = num*9
//print(i)
//
//////MARK: 6,7단 구현 - 반복문
////6단
//var number1 = 6
//var m = 1
//while m < 10 {
//    print(number1 * i)
//    i = i + 1
//}
//
////7단
//num = 7
//for i in 1...9 {
//    print(num*i)
//}
//
//////MARK: 8,9단 구현 - 조건문과 2중반복문
//for i in 1...9 {
//    if i % 2 == 1 {
//        for j in 1...9 {
//            print("\(i) * \(j) = \(i*j)")
//        }
//    }
//}

//MARK: 마무리하기 - 배열과 서브루틴
//
//var numbers = Array(1...9)
//
//
//for i in numbers {
//    numbers[i - 1] = numbers[i - 1] * 2
//}
//for i in numbers {
//    print(i)
//}

func gugu(dan: Int) -> [Int]{
    var numbers = Array(1...9)
    
    for i in numbers {
        numbers[i - 1] = numbers[i - 1] * dan
    }
    
    return numbers
}

gugu(dan: 5)


