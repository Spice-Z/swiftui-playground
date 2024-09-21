//
//  AppIntent.swift
//  LinkMemoWidget
//
//  Created by Yugo Ogura on 2024-09-15.
//

import WidgetKit
import AppIntents

struct ConfigurationAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Configuration"
    static var description = IntentDescription("This is an example widget.")
    
    @Parameter(title: "url", default: "linkmemo-x.com")
    var url: String
    
  
    @Parameter(title: "Link Title", default: "title")
    var linkTitle: String

}
