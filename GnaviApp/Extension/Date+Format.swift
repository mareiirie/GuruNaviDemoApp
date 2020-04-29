//
//  Date+Format.swift
//  GnaviApp
//
//  Created by 入江真礼 on 2020/04/13.
//  Copyright © 2020 入江真礼. All rights reserved.
//

import UIKit

extension UIViewController {

    func componentString(dateStringFromAPI: String) -> String {
        let dateStringArr = dateStringFromAPI.components(separatedBy: " ")
        let dsDate = dateStringArr[0]
        let dsTime = dateStringArr[2]
        let dsDateTime = dsDate + " " + dsTime
        let formatter: DateFormatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        guard let requiredDate = formatter.date(from: dsDateTime) else {
            fatalError("")
        }
        return dateFromString(date: requiredDate)
    }

    func stringToRequiredTimeString(dateStringFromAPI: String) -> String {
        let dateStringArr = dateStringFromAPI.components(separatedBy: " ")
        return dateStringArr[2]
    }

    func dateFromString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let dateStr = formatter.string(from: date as Date)
        formatter.locale = NSLocale(localeIdentifier: "ja_JP") as Locale?
        formatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "EEEEE", options: 0, locale:  Locale.current)
        let weekStr = formatter.string(from:  date as Date)
        return  dateStr + " (" + weekStr + ")"
    }

    func stringToRequiredDate(dateStringFromAPI: String) -> Date {
        let dateStringArr = dateStringFromAPI.components(separatedBy: " ")
        let dsDate = dateStringArr[0]
        let dsTime = dateStringArr[2]
        let dsDateTime = dsDate + " " + dsTime
        let formatter: DateFormatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        guard let requiredDate = formatter.date(from: dsDateTime) else {
            fatalError("")
        }
        return requiredDate
    }

    func stringToRequiredDateNoWeekday(dateStringFromAPI: String) -> Date {
        let dateStringArr = dateStringFromAPI.components(separatedBy: " ")
        let dsDate = dateStringArr[0]
        let dsTime = dateStringArr[1]
        let dsDateTime = dsDate + " " + dsTime
        let formatter: DateFormatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        guard let requiredDate = formatter.date(from: dsDateTime) else {
            fatalError("")
        }
        return requiredDate
    }

    func stringWithHyphenToDate(dateStringFromAPI: String) -> Date {
        let dateStringArr = dateStringFromAPI.components(separatedBy: " ")
        let dsDate = dateStringArr[0]
        let formatter: DateFormatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.dateFormat = "yyyy'-'MM'-'dd'"
        guard let requiredDate = formatter.date(from: dsDate) else {
            fatalError("")
        }
        return requiredDate
    }

    func stringToRequiredDateOnlyDate(dateStringFromAPI: String) -> Date {
        let dateStringArr = dateStringFromAPI.components(separatedBy: " ")
        let dsDate = dateStringArr[0]
        let formatter: DateFormatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.dateFormat = "yyyy/MM/dd"
        guard let requiredDate = formatter.date(from: dsDate) else {
            fatalError("")
        }
        return requiredDate
    }
}

extension Date {
    func dateAndTimeToString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        formatter.locale = NSLocale(localeIdentifier: "ja_JP") as Locale?
        let dateStr = formatter.string(from: self as Date)
        return  dateStr
    }

    var byString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        formatter.locale = NSLocale(localeIdentifier: "ja_JP") as Locale?
        let dateStr = formatter.string(from: self as Date)
        return  dateStr
    }
}

extension String {
    var onlyDate: String {
        let dateStringArr = self.components(separatedBy: " ")
        return dateStringArr[0]
    }
}
