//
//  DateExtension.swift
//  Foodvisor
//
//  Created by Fong Zhou on 20/09/2017.
//  Copyright © 2017 Foodvisor. All rights reserved.
//

import UIKit

extension Date {

    func RFC3339DateFormat(timeZone: TimeZone = TimeZone(secondsFromGMT: 0)!) -> String {
        let RFC3339DateFormatter = DateFormatter()
        RFC3339DateFormatter.locale = Locale(identifier: "en_US_POSIX")
        RFC3339DateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSS"
        RFC3339DateFormatter.timeZone = timeZone

        return RFC3339DateFormatter.string(from: self)
    }

    init(dateString:String) {
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd"
        dateStringFormatter.locale = Locale(identifier: "en_US_POSIX")
        let d = dateStringFormatter.date(from: dateString)!
        self.init(timeInterval:0, since:d)
    }

    init(timeString:String) {
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = "HH:mm:ss"
        let d = dateStringFormatter.date(from: timeString)!
        self.init(timeInterval:0, since:d)
    }

}
