
//
//  main.swift
//  UnitConverter
//
//  Created by 조재흥 on 2018. 9. 11..
//  Copyright © 2018년 hngfu. All rights reserved.
//

import Foundation

//기본단위(m)를 특정단위로 바꿔주는 함수입니다.
func convertCentimeterToUnit(m: Double, to unitValue: Double) -> Double {
    return m * unitValue
}

//MARK: 인치 길이 변환과 예외 처리
func unitConverter(_ willConvertData: String) -> String {
    let convertingData = willConvertData.split(separator: " ").map({String($0)})
    let rangeOfNumber = ["0","1","2","3","4","5","6","7","8","9","."]
    var numberOfData = ""
    var unitBefore = ""
    for i in convertingData[0] {
        if rangeOfNumber.contains(String(i)) {
            numberOfData += String(i)
        } else {
            unitBefore += String(i)
        }
    }
    var unitAfter = "doNotInput"
    if convertingData.count == 2 {
        unitAfter = convertingData[1]
    }
    let unitInfo = ["cm":100, "m":1, "inch":39.370079]
    
    
    //예외처리 부분
    let unitKey = ["cm","m","inch"]
    if (!unitKey.contains(unitAfter) || !unitKey.contains(unitBefore)) && unitAfter != "doNotInput" {
        return "지원하지 않는 단위입니다. 단위를 확인해 주세요."
    }
    
    let defaultNumber = Double(numberOfData)! / unitInfo[unitBefore]!
    
    //m와 cm는 변환할 단위 입력 안해되게 구현
    if unitBefore == "m" && unitAfter == "doNotInput" {
        return "\(convertCentimeterToUnit(m: defaultNumber, to: unitInfo["cm"]!))cm"
    } else if unitBefore == "cm" && unitAfter == "doNotInput" {
        return "\(convertCentimeterToUnit(m: defaultNumber, to: unitInfo["m"]!))m"
    } else {
        return "\(convertCentimeterToUnit(m: defaultNumber, to: unitInfo[unitAfter]!))\(unitAfter)"
    }
    
}

if let data = readLine() {
    print(unitConverter(data))
} else {
    print("입력하신 값을 확인해주세요.")
}







