//
//  DiceViewController.swift
//  DiceViewCode
//
//  Created by Mateus Amorim on 08/08/22.
//

import UIKit
import SnapKit

class DiceViewController: UIViewController {
    
    let diceView = DiceView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        view.addSubview(diceView)
        makeConstrants()
    }
    
    func makeConstrants() {
        
        diceView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}
