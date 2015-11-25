//
// Created by Maxim Rovkin on 25.11.15.
// Copyright (c) 2015 Maxim Rovkin. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire

class Api {
    private static let DOMEN = "http://adme.ru"
    static func loadRss() -> Observable<String> {
        return create {
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
        }
    }
}