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
    
    func hasEnded() -> Bool {
        return self.timeIntervalSinceNow.sign == .minus

    }
    func hasNotStarted() -> Bool {
         return self.timeIntervalSinceNow.sign == .plus

     }
}
extension String {
    func getDateDayAsNumberAndMonthAsString() -> String{
        let date = DateFormatter.getDateFormatterYYYY_MM_DD().date(from:self)!
        let component = date.get(.month,.day)
        var str=""
        str.append("\(component.day ?? 0) ")
        str.append(component.month?.convertIntMonthNumberIntoStringApprivation() ?? "")
        return str
    }
    
    func getDateFromString(dateFormatter:DateFormatter) -> Date {
        return  dateFormatter.date(from:self)!
    }
   
}
extension DateFormatter{
    static func getDateFormatterYYYY_MM_DD() -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter
    }
}

extension Int{
    func convertIntMonthNumberIntoStringApprivation() -> String{
           switch self{
            case 1:
                return "JAN"
            case 2:
                return "FEB"
            case 3:
                return "MAR"
            case 4:
                return "APR"
            case 5:
                return "MAY"
            case 6:
                return "JUN"
            case 7:
                return "JUL"
            case 8:
                return "AUG"
            case 9:
                return "SEP"
            case 10:
                return "OCT"
            case 11:
                return "NOV"
            case 12:
                return "DEC"
            default:
                return ""
            }
       }
}
