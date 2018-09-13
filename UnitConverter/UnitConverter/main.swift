
//
//  main.swift
//  UnitConverter
//
//  Created by 조재흥 on 2018. 9. 11..
//  Copyright © 2018년 hngfu. All rights reserved.
//

import Foundation

//센치미터(cm)단위를 특정단위로 바꿔주는 함수입니다.
func convertCentimeterToUnit(m: Double, to unitValue: Double) -> Double {
    return m * unitValue
}

//MARK: 길이 단위 변환 함수
//변환할 값을 집어넣으면 변환된 값이 나오게 만들었습니다.
func unitConverter(_ willConvertData: String) -> String {
    let convertingData = willConvertData.split(separator: " ").map({String($0)})
    let startPointOfUnit = convertingData[0].index(of: "i") ?? convertingData[0].index(of: "m") ?? convertingData[0].index(of: "c")
    let numberOfData = Double(convertingData[0].prefix(upTo: startPointOfUnit!))!
    let unitBefore = String(convertingData[0].suffix(from: startPointOfUnit!))
    var unitAfter = "doNotInput"
    if convertingData.count == 2 {
        unitAfter = convertingData[1]
    }
    let unitInfo = ["cm":100, "m":1, "inch":39.370079]
    
//    let unitKey = ["cm","m","inch"]
//    if unitKey.contains(unitAfter) && unitKey.contains(unitBefore) {
//        return "지원하지 않는 단위입니다. 단위를 확인해 주세요."
//    }
    
    let defaultNumber = numberOfData / unitInfo[unitBefore]!
    
    return "\(convertCentimeterToUnit(m: defaultNumber, to: unitInfo[unitAfter]!))\(unitAfter)"
    
}

if let data = readLine() {
    print(unitConverter(data))
} else {
    print("입력하신 값을 확인해주세요.")
}







