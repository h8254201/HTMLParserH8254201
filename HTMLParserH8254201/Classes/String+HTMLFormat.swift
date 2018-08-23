//
//  String+HTMLFormat.swift
//  HTMLFormatTextView
//
//  Created by 謝佳瑋 on 2018/8/23.
//  Copyright © 2018年 secure. All rights reserved.
//

import Foundation

class HTMLParserH8254201{
  func testFun() {
    print("aaa")
  }
}

extension String {
    static func htmlFormat(from html: String?) -> NSMutableAttributedString {
        let htmlData = NSString(string: html ?? "").data(using: String.Encoding.utf8.rawValue)
        let options = [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html]
        
        let attributedString = try! NSMutableAttributedString(data: htmlData!, options: options, documentAttributes: nil)
        while attributedString.mutableString.contains("\t•\t") {
            let range = attributedString.mutableString.range(of: "\t•\t")
            attributedString.replaceCharacters(in: range, with: "•  ")
        }
        return attributedString
    }
    
    static func htmlTagValue(_ value: String, tag: String, attributes: [String: String]?=nil) -> String {
        if let attrs = attributes {
            var attrStr = ""
            for (k, v) in attrs {
                attrStr += "\(k)='\(v)' "
            }
            return "<\(tag) \(attrStr)>\(value)</\(tag)>"
        }
        
        return "<\(tag)>\(value)</\(tag)>"
    }
    
    func htmlRender(_ data: [String: String],
                    symbol: (left: String, right: String) = ("{{", "}}")) -> String {
        var s = self
        for (key, value) in data {
            let sp = "\(symbol.left)\(key)\(symbol.right)"
            s = s.replacingOccurrences(of: sp, with: "\(value)")
        }
        
        return s
    }
}
