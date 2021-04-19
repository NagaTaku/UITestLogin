//
//  LoginUseCase.swift
//  UITestLogin
//
//  Created by 永瀬拓也 on 2021/04/15.
//

import Foundation
import RxSwift

protocol LoginUseCase {
    func login() -> Observable<Void?>
}

struct LoginUseCaseImpl: LoginUseCase {
    
    func login() -> Observable<Void?> {
        return Observable.just(nil)
    }
}
