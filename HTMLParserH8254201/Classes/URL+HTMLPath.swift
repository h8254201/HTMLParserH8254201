//
//  URL+HTMLPath.swift
//  HTMLFormatTextView
//
//  Created by 謝佳瑋 on 2018/8/23.
//  Copyright © 2018年 secure. All rights reserved.
//

import Foundation


extension URL {
    static func htmlPath(fileName name: String) -> URL? {
        return Bundle.main.url(
            forResource: name,
            withExtension: "html",
            subdirectory: "HTMLTemplates")
    }
}
