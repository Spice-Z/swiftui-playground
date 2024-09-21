//
//  LinkMemoWidget.swift
//  LinkMemoWidget
//
//  Created by Yugo Ogura on 2024-09-14.
//

import WidgetKit
import SwiftUI

struct Provider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationAppIntent())
    }

    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: configuration)
    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        return Timeline(entries: entries, policy: .atEnd)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationAppIntent
}

struct LinkMemoWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack (alignment: .leading) {
            HStack (alignment: .center) {
            ZStack{
              let frameSize:CGFloat = 20
              let circleSize:CGFloat = 0.45*frameSize
              let borderWidth:CGFloat = 0.075*frameSize
              let centerY:CGFloat = frameSize/2 - circleSize / 2
                      Path { path in
                          path.addEllipse(in: CGRect(x: 0.05*frameSize, y: centerY, width: circleSize, height: circleSize))
                          path.addEllipse(in: CGRect(x: 0.4995*frameSize, y: centerY, width: circleSize, height: circleSize))
                      }
                      .stroke(.gray, lineWidth: borderWidth)
                      .frame(width: frameSize, height: frameSize)
                      
                      Path { path in
                          path.addEllipse(in: CGRect(x: 0.37 * frameSize, y: centerY + 0.14*frameSize, width: 0.4 * circleSize, height: 0.35 * circleSize))
                          path.addEllipse(in: CGRect(x: 0.45 * frameSize, y: centerY + 0.14*frameSize, width: 0.4 * circleSize, height: 0.35 * circleSize))
                                 }
                                 .fill(.gray)
                                 .frame(width: frameSize, height: frameSize)
                      
                  }
                HStack(alignment: .center, content: {
                    Text("LinkMemo").foregroundStyle(.gray).font(.caption).bold()
                    Spacer()
                    Text("24").foregroundStyle(.gray).font(.caption).bold()
                })
              
          }
            Spacer()
            VStack(alignment: .leading){
                
            
                Text(entry.configuration.linkTitle).foregroundStyle(.gray).font(.headline).id(entry.configuration.linkTitle).transition(.push(from: .bottom))
                Text(entry.configuration.url).foregroundStyle(.gray).font(.caption).lineLimit(1)
                    .id(entry.configuration.url).transition(.push(from: .bottom)).padding(.top, 0.02)
            }
        }
    }
}

struct LinkMemoWidget: Widget {
    let kind: String = "LinkMemoWidget"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            LinkMemoWidgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
    }
}

extension ConfigurationAppIntent {
    fileprivate static var first: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.url = "linkmemo-x.pages.dev"
      intent.linkTitle = "Released new indie app!"
        return intent
    }
    
    fileprivate static var second: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.url = "ugocode.com"
      intent.linkTitle = "How to write ios widgets using React Native / Expo?"
        return intent
    }
    
    fileprivate static var third: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.url = "rabspice.hatenablog.com"
      intent.linkTitle = "「強いエンジニアは結局休日に勉強してるじゃん」って思うけど"
        return intent
    }
}

#Preview(as: .systemSmall) {
    LinkMemoWidget()
} timeline: {
    SimpleEntry(date: .now, configuration: .first)
    SimpleEntry(date: .now, configuration: .second)
    SimpleEntry(date: .now, configuration: .third)
}
