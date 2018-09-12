//
//  main.swift
//  UnitConverter
//
//  Created by 조재흥 on 2018. 9. 11..
//  Copyright © 2018년 hngfu. All rights reserved.
//

import Foundation

//센치미터(cm)단위를 미터(m)단위로 바꿔주는 함수입니다.
func centimeterToMeter(cm: Int) -> Float {
    return Float(cm)/100
}

//미터(m)단위를 센치미터(cm)단위로 바꿔주는 함수입니다.
func meterToCentimeter(m: Float) -> Int {
    return Int(m*100)
}

//MARK: 길이 단위 변환 함수
//변환할 값을 집어넣으면 변환된 값이 나오게 만들었습니다.
func unitConverter(_ willConvertData: String) -> String {
    let data = willConvertData
    let startPointOfUnit = data.index(of: "c") ?? data.index(of: "m")
    let numberOfData = String(data.prefix(upTo: startPointOfUnit!))
    let unitOfData = String(data.suffix(from: startPointOfUnit!))

    switch unitOfData {
    case "cm":
        return "\(centimeterToMeter(cm: Int(numberOfData)!))m"
    case "m":
        return "\(meterToCentimeter(m: Float(numberOfData)!))cm"
    default:
        return "m와 cm만 단위 변환 가능합니다."
    }
}

if let data = readLine() {
    print(unitConverter(data))
} else {
    print("입력하신 값을 확인해주세요.")
}

