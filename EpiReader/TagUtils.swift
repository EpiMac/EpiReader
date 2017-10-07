//
//  TagUtils.swift
//  EpiReader
//
//  Created by Alexandre Toubiana on 06/10/2017.
//  Copyright © 2017 Alexandre Toubiana. All rights reserved.
//

import UIKit

func check(tag: String, in tags: [Tag]) -> (Tag, Bool) {
    for t in tags {
        if t.tagName == tag {
            return (t, true)
        }
    }
    let color = getRandomColor()
    let newTag = Tag(tagName: tag, attributedColor: color)
    return (newTag, false)
}
