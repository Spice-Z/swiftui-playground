//
//  LinkMemoWidgetBundle.swift
//  LinkMemoWidget
//
//  Created by Yugo Ogura on 2024-09-15.
//

import WidgetKit
import SwiftUI

@main
struct LinkMemoWidgetBundle: WidgetBundle {
    var body: some Widget {
        LinkMemoWidget()
        LinkMemoWidgetLiveActivity()
    }
}
