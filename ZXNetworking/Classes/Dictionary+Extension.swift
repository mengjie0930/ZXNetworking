//
//  Dictionary+Extension.swift
//  Live
//
//  Created by yue on 2018/12/14.
//  Copyright © 2018 lx. All rights reserved.
//

import Foundation

extension Dictionary {
    // MARK: 字典转字符串
    func jsonString() -> String? {
        let data = try? JSONSerialization.data(withJSONObject: self, options: [])
        let str = String(data: data!, encoding: String.Encoding.utf8)
        return str
    }
    
    
    
    
    
    // MARK: 字符串转字典
    func stringValueDic(_ str: String) -> [String : Any]?{
        let data = str.data(using: String.Encoding.utf8)
        if let dict = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any] {
            return dict
        }
        return nil
    }
}

