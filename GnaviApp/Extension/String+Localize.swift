//
//  String+Localize.swift
//  GnaviApp
//
//  Created by 入江真礼 on 2020/04/13.
//  Copyright © 2020 入江真礼. All rights reserved.
//

import Foundation

extension String {

    func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }

    func localized(value: String) -> String {
        return String(format: NSLocalizedString(self, comment: ""), value)
    }

    func localized(value: Int) -> String {
        return String(format: NSLocalizedString(self, comment: ""), value)
    }

    func localized(date: Date? = nil, dateStr: String? = nil, value: String) -> String {
        var formatDate = ""
        if let date = date {
            formatDate = date.dateAndTimeToString()
        } else if let dateStr = dateStr {
            formatDate = dateStr
        }
        return String(format: NSLocalizedString(self, comment: ""), formatDate, value)
    }
}
