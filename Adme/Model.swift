//
//  Model.swift
//  Adme
//
//  Created by Maxim Rovkin on 24.11.15.
//  Copyright © 2015 Maxim Rovkin. All rights reserved.
//

import Foundation
import EVReflection

struct RssItem {
    var guid: String = ""
    var title: String = ""
    var image: String = ""
    var link: String = ""
    var saved: Bool = false
}