//
//  Date+Extension.swift
//  BehaviourFinance
//
//  Created by yue on 2017/1/5.
//  Copyright © 2017年 yue. All rights reserved.
//

import Foundation

let shanghaiZone = TimeZone.init(identifier: "Asia/Shangha")

enum GDateFormatter: String {
    case year = "yyyy"
    case month = "yyyy-MM"
    case day = "yyyy-MM-dd"
    case monthDay = "MM-dd"
    case hourMinute = "HH:mm"
    case dayTwo = "yyyy年MM月dd日"
    case hour = "yyyy-MM-dd HH"
    case minute = "yyyy-MM-dd HH:mm"
    case second = "yyyy-MM-dd HH:mm:ss"
    case millisecond = "yyyy-MM-dd HH:mm:ss.SSS"
}

extension Date{
    
    /// Date => String
    /// - format: 当前时间格式
    func toString(_ format: GDateFormatter = .minute) -> String {
        let df = DateFormatter()
        df.locale = Locale(identifier: "zh_CN")
        df.dateFormat = format.rawValue
        let str = df.string(from: self)
        return str
    }
    
    /// Date => 时间戳
    /// - format: 当前时间格式
    func toTimestamp(_ format: GDateFormatter = .minute) -> Double {
        let df = DateFormatter()
        df.dateFormat = format.rawValue
        return timeIntervalSince1970
    }
    
    /// 获取当前Year
    func getYear() -> Int {
        let calendar = NSCalendar.current
        //这里注意 swift要用[,]这样方式写
        let com = calendar.dateComponents([.year,.month,.day], from: self)
        return com.year!
    }
    
    /// 获取当前Month
    func getMonth() -> Int {
        let calendar = NSCalendar.current
        //这里注意 swift要用[,]这样方式写
        let com = calendar.dateComponents([.year,.month,.day], from: self)
        return com.month!
    }
    
    /// 获取当前day
    func getDay() -> Int {
        let calendar = NSCalendar.current
        //这里注意 swift要用[,]这样方式写
        let com = calendar.dateComponents([.year,.month,.day], from: self)
        return com.day!
    }
    
    /// 获取当前hour
    func getHour() -> Int {
        let calendar = NSCalendar.current
        //这里注意 swift要用[,]这样方式写
        let com = calendar.dateComponents([.hour], from: self)
        return com.hour!
    }
    
    /// 获取当前minute
    func getMinute() -> Int {
        let calendar = NSCalendar.current
        //这里注意 swift要用[,]这样方式写
        let com = calendar.dateComponents([.minute], from: self)
        return com.minute!
    }
    
    /// 获取当前second
    func getSecond() -> Int {
        let calendar = NSCalendar.current
        //这里注意 swift要用[,]这样方式写
        let com = calendar.dateComponents([.second], from: self)
        return com.second!
    }
    
    func isToday(date: String) -> Bool {
        //theDate "theDate": "2020-08-27",
        if self.toString(.day) == date {
            return true
        }
        return false
    }
}

extension Double {
    
    /// 时间戳 => 日期 输出字符串
    /// - format: 转出时间格式
    /// - isMillisecond: 是否是毫秒级 时间戳
    func toDate(_ format: GDateFormatter = .minute, isMillisecond: Bool = false) -> String? {
        if self <= 0 { return nil }
        let timeInterval: TimeInterval = isMillisecond == false ? self : self/1000.0
        let date = Date(timeIntervalSince1970: timeInterval)
        return date.toString(format)
    }
}

extension String {
    
    /// 时间戳 => 日期 输出字符串
    /// - format: 转出时间格式
    func timestampToDate(_ format: GDateFormatter = .minute) -> String? {
        guard let timeInterval = Double(self) else { return nil }
        return timeInterval.toDate()
    }
    
    /// 时间戳 => 日期 输出Date
    /// - format: 转出时间格式
    func strToDate(_ format: GDateFormatter = .minute) -> Date? {
        let df = DateFormatter()
        df.dateFormat = format.rawValue
        let date = df.date(from: self)
        return date
    }
    
}


extension Int {
    
    /// 时间戳 => 日期 输出字符串
    /// - format: 转出时间格式
    /// - isMillisecond: 是否是毫秒级 时间戳
    func toDate(_ format: GDateFormatter = .minute, isMillisecond: Bool = false) -> String? {
        return Double(self).toDate(format, isMillisecond: isMillisecond)
    }
    
}

extension Float {
    
    /// 时间戳 => 日期 输出字符串
    /// - format: 转出时间格式
    /// - isMillisecond: 是否是毫秒级 时间戳
    func toDateStr(_ format: GDateFormatter = .minute, isMillisecond: Bool = false) -> String? {
        return Double(self).toDate(format, isMillisecond: isMillisecond)
    }
    
}

