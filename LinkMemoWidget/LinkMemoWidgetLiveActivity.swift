//
//  LinkMemoWidgetLiveActivity.swift
//  LinkMemoWidget
//
//  Created by Yugo Ogura on 2024-09-15.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct LinkMemoWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct LinkMemoWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: LinkMemoWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension LinkMemoWidgetAttributes {
    fileprivate static var preview: LinkMemoWidgetAttributes {
        LinkMemoWidgetAttributes(name: "World")
    }
}

extension LinkMemoWidgetAttributes.ContentState {
    fileprivate static var smiley: LinkMemoWidgetAttributes.ContentState {
        LinkMemoWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: LinkMemoWidgetAttributes.ContentState {
         LinkMemoWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: LinkMemoWidgetAttributes.preview) {
   LinkMemoWidgetLiveActivity()
} contentStates: {
    LinkMemoWidgetAttributes.ContentState.smiley
    LinkMemoWidgetAttributes.ContentState.starEyes
}
