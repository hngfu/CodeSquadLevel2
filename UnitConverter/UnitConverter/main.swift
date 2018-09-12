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
    let convertedCm = Float(cm)/100
    return convertedCm
}

//미터(m)단위를 센치미터(cm)단위로 바꿔주는 함수입니다.
func meterToCentimeter(m: Float) -> Int {
    return Int(m*100)
}

//MARK: 길이 단위 변환 함수
//변환할 값을 집어넣으면 변환된 값이 나오게 만들었습니다.
func unitConverter(_ willConvertData: String) -> String {
    let rangeOfNumber = ["0","1","2","3","4","5","6","7","8","9","."]
    var numberOfData = ""
    var unitOfData = ""

    for i in willConvertData {
        if rangeOfNumber.contains(String(i)) {
            numberOfData += String(i)
        } else {
            unitOfData += String(i)
        }
    }
    
    switch unitOfData {
    case "cm":
        return "\(centimeterToMeter(cm: Int(numberOfData)!))m"
    case "m":
        return "\(meterToCentimeter(m: Float(numberOfData)!))cm"
    default:
        return "m와 cm만 단위 변환 가능합니다."
    }
}


print(unitConverter("183cm"))
//1.83cm
print(unitConverter("3.14m"))
//314cm
