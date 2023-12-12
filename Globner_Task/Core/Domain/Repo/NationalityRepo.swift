//
//  NationalityRepo.swift
//  Globner_Task
//
//  Created by apple on 12/12/23.
//

import Foundation
import RxSwift

protocol NationalityRepo {
    func getNationalities() -> Observable<NationalityAPI>
}
