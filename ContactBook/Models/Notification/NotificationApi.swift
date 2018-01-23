//
//  NotificationApi.swift
//  ContactBook
//
//  Created by S N on 2018/01/19.
//  Copyright © 2018年 Seidi Nakamura. All rights reserved.
//

import Foundation

protocol NotificationApiDelegate {
    func received(notificationList:[NotificationItem])
}

final class NotificationApi {
    var delegate: NotificationApiDelegate!
    let notificationResponse = NotificationResponse()
    func fetch(grade: Int, offset: Int = 0) {
        let router = Router.notification(NotificationParamsBuilder.create(grade: grade, offset: offset))
        APIClient().request(router: router){ [weak self] (response) in
            switch response {
            case .success(let result):
                let ret = self?.notificationResponse.map(json: result)
                self?.delegate.received(notificationList: ret!)
            case .failure(let error):
                print(error)
            }
        }
    }
}
