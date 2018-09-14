
//
//  main.swift
//  UnitConverter
//
//  Created by 조재흥 on 2018. 9. 11..
//  Copyright © 2018년 hngfu. All rights reserved.
//

import Foundation

//기본단위(m)를 특정단위로 바꿔주는 함수입니다.
func convertMeterToUnit(m: Double, to unitValue: Double) -> Double {
    return m * unitValue
}

//예외처리 부분 함수입니다.
func isSupportable(_ unitBeforeConvert:String, _ unitAfterConvert:String) -> Bool {
    let unitKey = ["cm","m","inch"]
    if !(unitKey.contains(unitAfterConvert) && unitKey.contains(unitBeforeConvert)){
        return false
    }
    return true
}

//MARK: 인치 길이 변환과 예외 처리
func unitConverter(_ willConvertData: String) -> String {
    //숫자부분 단위부분을 분리시켜 줍니다.
    let convertingData = willConvertData.split(separator: " ").map({String($0)})
    let rangeOfNumber = ["0","1","2","3","4","5","6","7","8","9","."]
    var numberOfData = ""
    var unitBeforeConvert = ""
    for i in convertingData[0] {
        if rangeOfNumber.contains(String(i)) {
            numberOfData += String(i)
        } else {
            unitBeforeConvert += String(i)
        }
    }
    
    //m와 cm는 변환할 단위가 없어도 변환 가능하게 만들어 줬습니다.
    var unitAfterConvert = ""
    if convertingData.count == 2 {
        unitAfterConvert = convertingData[1]
    } else if convertingData.count == 1 && unitBeforeConvert == "cm" {
        unitAfterConvert = "m"
    } else if convertingData.count == 1 && unitBeforeConvert == "m" {
        unitAfterConvert = "cm"
    }
    
    //단위의 정보가 담겨있는 곳 입니다.
    let unitInfo = ["cm" : 100, "m" : 1, "inch" : 39.370079]
    
    //예외처리해주고 알맞은 값은 단위를 변환시켜줍니다.
    if isSupportable(unitBeforeConvert, unitAfterConvert) {
        let defaultUnitNumber = Double(numberOfData)! / unitInfo[unitBeforeConvert]!
        return "\(convertMeterToUnit(m: defaultUnitNumber, to: unitInfo[unitAfterConvert]!))\(unitAfterConvert)"
    } else {
        return "지원하지 않는 단위입니다. 단위를 확인해 주세요."
    }
    
}

if let data = readLine() {
    print(unitConverter(data))
} else {
    print("입력하신 값을 확인해주세요.")
}




















