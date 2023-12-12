//
//  NationalityViewModel.swift
//  Globner_Task
//
//  Created by apple on 12/12/23.
//

import Foundation
import RxSwift

final class NationalityViewModel {
    
    private let disposeBag: DisposeBag = DisposeBag()
    public let nationaliry: PublishSubject<Nationality> = .init()


    private final let nationalityUseCase: NationalityUseCase

    
    init(nationalityUseCase: NationalityUseCase) {
        self.nationalityUseCase = nationalityUseCase
    }
    
    func getNationalities() {
        nationalityUseCase.getNationalities()
            .subscribe(onNext: {
                print($0.data?.count ?? 0)
            }, onError: {
                print($0.localizedDescription)
            }
        ).disposed(by: disposeBag)
    }
}
