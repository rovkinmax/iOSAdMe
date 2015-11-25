//
// Created by Maxim Rovkin on 25.11.15.
// Copyright (c) 2015 Maxim Rovkin. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire
import SWXMLHash

class Api {
    private static let DOMEN = "http://adme.ru"
    static func loadRss() -> Observable<Array<RssItem>> {
        return loadRawRss().map {
            (xmlRaw) -> Array<RssItem> in
            var rssArray = Array<RssItem>()
            let xml = SWXMLHash.parse(xmlRaw)
            let channelItems = xml["rss"]["channel"]["item"].all
            for indexer in channelItems {
                if let element = indexer.element {
                    switch (element.name) {
                    case "item":
                        rssArray.append(indexer.toRssItem())
                    default: break
                    }

                }
            }
            return rssArray
        }
    }

    private static func loadRawRss() -> Observable<String> {
        return create({
            observer in
            Alamofire.request(.GET, "\(DOMEN)/rss")
            .responseString {
                response in
                if (response.result.isSuccess) {
                    observer.onNext(response.result.value!)
                    observer.onCompleted()
                } else {
                    observer.onError(response.result.error!)
                }
            }

            return NopDisposable.instance
        })
    }
}

extension XMLIndexer {
    func toRssItem() -> RssItem {
        var item = RssItem()
        item.guid = toText("guid")!
        item.link = toText("link")!
        item.title = toText("title")!
        item.image = toText("description")!
        return item
    }

    private func getLinkFromString(string: String) {
        /*do {
            let regExp = NSRegularExpression(pattern: "src=\"(.*?)\"", options: .CaseInsensitive)
            regExp.matchesInString(string, options: nil, range: NSMakeRange(0,string.characters.count))
            
        } catch _ {
            
        }*/
    }

    private func toText(tag: String) -> String? {
        return self[tag].element?.text
    }
}