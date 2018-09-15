
//
//  main.swift
//  UnitConverter
//
//  Created by 조재흥 on 2018. 9. 11..
//  Copyright © 2018년 hngfu. All rights reserved.
//

import Foundation

func convertUnit(valueToConvert:String) -> String{
    let seperatedValueFromSpace = seperate(blankValue: valueToConvert)
    let completelySeperatedValue = seperateInto(numberAndUnit: seperatedValueFromSpace[0])
    
    guard let numberPart = Double(completelySeperatedValue[0]) else {return "입력하신 값을 확인해주세요."}
    let beforeConvert = completelySeperatedValue[1]
    var AfterConvert = ""
    
    if !supports(unit: beforeConvert) {return "지원하지 않는 단위입니다. 확인해주세요."}
    if seperatedValueFromSpace.count == 1{
        AfterConvert = addDefaultUnit(unitBeforeConvert: beforeConvert)
    } else {
        AfterConvert = seperatedValueFromSpace[1]
    }
    if !supports(unit: AfterConvert) {return "지원하지 않는 단위입니다. 확인해주세요."}
    
    return convertingUnit(numberPart, beforeConvert, AfterConvert)
}

//ex) 입력: "12cm m" -> 출력: ["12cm","m"], 입력: "12cm" -> 출력: ["12cm"]
func seperate(blankValue:String) -> [String]{
    return blankValue.split(separator: " ").map({String($0)})
}

//ex) 입력: "12cm" -> 출력: ["12","cm"]
func seperateInto(numberAndUnit:String) -> [String]{
    var numberPart = ""
    var unitPart = ""
    
    for i in numberAndUnit {
        switch i {
        case "0","1","2","3","4","5","6","7","8","9",".":
            numberPart.append(i)
        default:
            unitPart.append(i)
        }
    }
    
    return [numberPart,unitPart]
}

//MARK: 단위 추가 (1/2)
//ex) 입력: "cm" -> 출력: true, 입력: "hngfu" -> false
func supports(unit:String) -> Bool{
    let supportedUnits = ["cm","m","inch","yard","kg","g","oz","lb"]
    return supportedUnits.contains(unit)
}

//ex) 입력: "cm"(바뀌기 전 단위 입력하면) -> 출력: "m"(바꿀 단위 변수로 return 됩니다.)
func addDefaultUnit(unitBeforeConvert:String) -> String{
    switch unitBeforeConvert {
    case "cm":
        return "m"
    case "m":
        return "cm"
    case "yard":
        return "m"
    default:
        return unitBeforeConvert
    }
}

//MARK: 단위 추가 (2/2) 단위값 추가시 '길이'는 'm'가 중심값, '무게'는 'kg'가 중심값
//ex) 입력: (12,"cm","m") -> 출력: "0.12m", 입력: (12,"m","yard") -> 출력: "13.1233yard"
func convertingUnit(_ numberPart:Double, _ beforeConvert:String, _ AfterConvert:String) -> String{
    let unitInfo = ["cm" : 100,
                    "m" : 1.0,
                    "inch" : 39.370079,
                    "yard" : 1.093613,
                    "kg" : 1,
                    "g" : 1000,
                    "oz" : 35.273962,
                    "lb" : 2.204623]
    
    guard let nonOptionalBeforeConvert = unitInfo[beforeConvert], let nonOptionalAfterConvert = unitInfo[AfterConvert] else {
        return "입력하신 값을 확인해 주세요."
    }
    
    let convertedUnitValue = (numberPart / nonOptionalBeforeConvert) * nonOptionalAfterConvert
    
    return "\(convertedUnitValue)\(AfterConvert)"
}

while true {
    if let willConvertUnitValue = readLine() {
        if willConvertUnitValue == "quit" || willConvertUnitValue == "q" {
            print("종료했습니다.")
            break
        } else {
            print(convertUnit(valueToConvert: willConvertUnitValue))
        }
    } else {
        print("입력하신 값을 확인해주세요.")
    }
}
