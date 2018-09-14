
//
//  main.swift
//  UnitConverter
//
//  Created by 조재흥 on 2018. 9. 11..
//  Copyright © 2018년 hngfu. All rights reserved.
//

import Foundation

//기본단위(m)를 특정단위로 바꿔주는 함수입니다.
func converting(what preparedValue: [String]) -> String {
    //단위의 정보가 담겨있는 곳 입니다.
    let unitInfo = ["cm" : 100, "m" : 1.0, "inch" : 39.370079, "yard" : 1.093613]
    //어떤 값이든 들오면 미터(m)단위로 환산해주고 이제 거기서 다른 단위로 환산해 줍니다.
    if let preparedNumber = Double(preparedValue[0]), let verifiedUnitBeforeConvert = unitInfo[preparedValue[1]], let verifiedUnitAfterConvert = unitInfo[preparedValue[2]]{
        let defaultUnitNumber = preparedNumber / verifiedUnitBeforeConvert
        return "\(defaultUnitNumber * verifiedUnitAfterConvert)\(preparedValue[2])"
    }
    return "값을 확인해 주세요."
}

//예외처리 부분 함수입니다.
func supportsUnit(_ unitBeforeConvert:String, _ unitAfterConvert:String) -> Bool {
    let unitKey = ["cm","m","inch","yard"]
    if !(unitKey.contains(unitAfterConvert) && unitKey.contains(unitBeforeConvert)){
        return false
    }
    return true
}

//숫자부분과 단위부분을 분리시켜주는 함수입니다.
func separateSection(of willSeparateValue:String) -> [String] {
    let separatedValue = willSeparateValue.split(separator: " ").map({String($0)})
    let rangeOfNumber = ["0","1","2","3","4","5","6","7","8","9","."]
    var numberSection = ""
    var unitBeforeConvert = ""
    for i in separatedValue[0] {
        if rangeOfNumber.contains(String(i)) {
            numberSection += String(i)
        } else {
            unitBeforeConvert += String(i)
        }
    }
    
    if separatedValue.count == 2 {
        return [numberSection,unitBeforeConvert,separatedValue[1]]
    }
    return [numberSection,unitBeforeConvert]
}

//변환할 단위를 입력하지 않은 경우의 처리
func processWithoutUnitsToConvert(valueWithoutUnitsToConvert:[String]) -> [String] {
    var valueToProcess = valueWithoutUnitsToConvert
    if valueToProcess[1] == "cm" {
        valueToProcess.append("m")
    } else if valueToProcess[1] == "m" {
        valueToProcess.append("cm")
    } else if valueToProcess[1] == "yard" {
        valueToProcess.append("m")
    }
    return valueToProcess
}


//MARK: 인치 길이 변환과 예외 처리
func convertUnit(_ willConvertValue: String) -> String {
    //숫자부분 단위부분을 분리시켜 줍니다.
    let seperatedValues = separateSection(of: willConvertValue)
    
    //m와 cm는 변환할 단위가 없어도 변환 가능하게 만들어 줬습니다.
    let preparedValue = processWithoutUnitsToConvert(valueWithoutUnitsToConvert: seperatedValues)
    
    //예외처리해주고 알맞은 값은 단위를 변환시켜줍니다.
    if supportsUnit(preparedValue[1], preparedValue[2]) {
        return converting(what: preparedValue)
    } else {
        return "지원하지 않는 단위입니다. 단위를 확인해 주세요."
    }
}


while true {
    if let valueAndUnit = readLine() {
        if valueAndUnit == "quit" || valueAndUnit == "q" {
            print("종료했습니다.")
            break
        } else {
            print(convertUnit(valueAndUnit))
        }
    } else {
        print("입력하신 값을 확인해주세요.")
    }
}














