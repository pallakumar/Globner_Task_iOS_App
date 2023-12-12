//
//  NationalityUseCase.swift
//  Globner_Task
//
//  Created by apple on 12/12/23.
//

import Foundation
import RxSwift

final class NationalityUseCase {
    
    private final let nationalityRepo: NationalityRepo
    
    init(nationalityRepo: NationalityRepo) {
        self.nationalityRepo = nationalityRepo
    }
    
    func getNationalities() -> Observable<NationalityAPI> {
        nationalityRepo.getNationalities()
    }
    
}
