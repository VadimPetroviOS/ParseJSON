//
//  SecondViewController.swift
//  DimkaDZ
//
//  Created by Вадим on 24.05.2022.
//

import UIKit

final class SecondViewController: UIViewController {

    private let relatedItems: String
    
    let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = -1
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        configureLabel()
    }
    
    init(relatedItems: String) {
        self.relatedItems = relatedItems
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureLabel() {
        self.label.frame = self.view.bounds
        self.view.addSubview(self.label)
        label.text = self.relatedItems
    }
}
