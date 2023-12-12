//
//  ViewController.swift
//  Globner_Task
//
//  Created by apple on 12/12/23.
//

import UIKit
import LBTATools
import RxSwift
import Kingfisher


class MyCell: UITableViewCell {
    
    @IBOutlet weak var cellImg: UIImageView!
    @IBOutlet weak var cellLbl: UILabel!
}

final class ViewController: UIViewController,UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    private final let disposeBag: DisposeBag = DisposeBag()
    private var nationalityViewModel: NationalityViewModel!
    lazy var containerView: UIView = UIView()
    
    lazy var nationalityNameLabel: UILabel = UILabel(text: "Globner_Task", font: .systemFont(ofSize: 24), textColor: .systemBlue, textAlignment: .center, numberOfLines: 1)
    
    lazy var fetchProfileButton: UIButton = {
        let button = UIButton(title: "Fetch Globner", titleColor: .white, font: .boldSystemFont(ofSize: 16), backgroundColor: .blue, target: self, action: #selector(fetchProfileButtonTapped))
        button.layer.cornerRadius = 12
        button.constrainHeight(45)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nationalityViewModel = container.resolve(NationalityViewModel.self)!
        
        view.addSubview(containerView)
        containerView.fillSuperviewSafeAreaLayoutGuide()
        
        containerView.stack(
            UIView(),
            fetchProfileButton
        ).padLeft(20).padRight(20).padBottom(20)
        
        containerView.addSubview(nationalityNameLabel)
        nationalityNameLabel.centerInSuperview()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as? MyCell
        cell?.cellLbl.text = "Globner"
        
     /*   nationalityViewModel.nationaliry
            .asDriverOnErrorJustComplete()
            .drive(onNext: {
                print("title :\($0.title ?? "")")
                print("description :\($0.description ?? "")")
                print("imageURL :\($0.imageHref ?? "")")
//                cell?.cellImg.kf.setImage(with: \($0.imageHref))

                // self.nationalityNameLabel.text = $0.imageHref ?? ""
            }).disposed(by: disposeBag)*/

//        let url = URL(string: "")
//        cell?.cellImg.kf.setImage(with: url)

        return cell!
     }
    
    @objc
    func fetchProfileButtonTapped() {
        nationalityViewModel.nationaliry
            .asDriverOnErrorJustComplete()
            .drive(onNext: {
                print("title :\($0.title ?? "")")
                print("description :\($0.description ?? "")")
                print("imageURL :\($0.imageHref ?? "")")
                
                // self.nationalityNameLabel.text = $0.imageHref ?? ""
            }).disposed(by: disposeBag)
    }
}
