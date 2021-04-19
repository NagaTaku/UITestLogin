//
//  LoginViewController.swift
//  UITestLogin
//
//  Created by 永瀬拓也 on 2021/04/15.
//

import Foundation
import RxSwift
import RxCocoa
import UIKit

class LoginViewController: ViewController, UITextFieldDelegate {
    
    typealias Event = LoginPresenter.Event
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var passField: UITextField!
    
    var presenter = LoginPresenter(useCase: LoginUseCaseImpl())
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameField.delegate = self
        passField.delegate = self
        
        setupUIBindings()
        setupEventBindings()
    }
    
    private func setupUIBindings() {
        presenter.viewReflecter
            .asDriver(onErrorDriveWith: .empty())
            .drive (
                onNext: { [weak self] state in
                    switch state {
                    case .initial:
                        break
                    case .failed:
                        print("failed")
                    }
                }
                    
            )
            .disposed(by: disposeBag)

    }
    
    private func setupEventBindings() {
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // キーボードを閉じる
        nameField.resignFirstResponder()
        passField.resignFirstResponder()
        return true
    }

}
