//
//  LoginPresenter.swift
//  UITestLogin
//
//  Created by 永瀬拓也 on 2021/04/15.
//

import Foundation
import RxSwift
import RxCocoa

class LoginPresenter {
    typealias State = UserState
    typealias Event = UserEvent
    
    enum UserState: Equatable {
        case failed
        case initial
    }
    
    enum UserEvent: Equatable {
        case login
    }
    
    let viewReflecter = BehaviorSubject<State>(value: .initial)
    let eventReceiver = PublishSubject<Event>()
    
    private let useCase: LoginUseCase
    private let disposeBag = DisposeBag()
    
    init(useCase: LoginUseCase) {
        print("init LoginPresenter")
        self.useCase = useCase
        
        eventReceiver
            .flatMap { [weak self] event -> Observable<State> in
                guard let weakSelf = self else {
                    return Observable<State>.just(.failed)
                }
                switch event {
                case .login:
                    return Observable<State>.just(.initial)
                }
            }
            .bind(to: viewReflecter)
            .disposed(by: disposeBag)
    }
}
