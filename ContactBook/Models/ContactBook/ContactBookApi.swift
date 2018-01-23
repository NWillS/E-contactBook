//
//  ContactBookApi.swift
//  ContactBook
//
//  Created by S N on 2018/01/18.
//  Copyright © 2018年 Seidi Nakamura. All rights reserved.
//

import Foundation

protocol ContactBookApiDelegate {
    func received(contactBookList:[ContacBookItem])
}

final class ContactBookApi{
    var delegate:ContactBookApiDelegate!
    let contactBookResponse = ContactBookResponse()
    func fetch(id:Int,offset: Int = 0){
        let router = Router.contactBookGet(ContactBookParamsBuilder.create(id: id,offset:offset))
        APIClient().request(router: router){ [weak self] (response) in
            switch response {
            case .success(let result):
                let ret = self?.contactBookResponse.map(json: result)
                self?.delegate.received(contactBookList: ret!)
            case .failure(let error):
                print(error)
            }
        }
    }
}
