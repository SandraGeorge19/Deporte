//
//  StringExtensions.swift
//  Deporte
//
//  Created by Abdo on 2/6/22.
//  Copyright © 2022 sandra. All rights reserved.
//

import Foundation

extension Date {
    func get(_ components: Calendar.Component..., calendar: Calendar = Calendar.current) -> DateComponents {
        return calendar.dateComponents(Set(components), from: self)
    }
    
    func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {
        return calendar.component(component, from: self)
    }
}
extension String {
    func getDateDayAsNumberAndMonthAsString() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from:self)!
        let component = date.get(.month,.day)
        var str=""
        str.append("\(component.day ?? 0)")
        switch component.month ?? 0 {
        case 1:
            str.append("JAN")
            break
        case 2:
            str.append("FEB")
            break
        case 3:
            str.append("MAR")
            break
        case 4:
            str.append("APR")
            break
        case 5:
            str.append("MAY")
            break
        case 6:
            str.append("JUN")
            break
        case 7:
            str.append("JUL")
            break
        case 8:
            str.append("AUG")
            break
        case 9:
            str.append("SEP")
            break
        case 10:
            str.append("OCT")
            break
        case 11:
            str.append("NOV")
            break
        case 12:
            str.append("DEC")
            break
        default: break
        }
        
        return str
    }
}
