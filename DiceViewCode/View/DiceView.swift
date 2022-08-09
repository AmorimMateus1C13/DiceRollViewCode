//
//  DiceView.swift
//  DiceViewCode
//
//  Created by Mateus Amorim on 08/08/22.
//

import UIKit
import SnapKit

class DiceView: UIView {
    
    var dicees = [
        Dices.diceOne,
        Dices.diceTwo,
        Dices.diceThree,
        Dices.diceFour,
        Dices.diceFive,
        Dices.diceSix]
    
    lazy var stackViewVertical: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [topView,middleView,bottonView])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 0
        stackView.contentMode = .scaleToFill
        return stackView
    }()
    
    lazy var bottonView: UIView = {
        let bottonView = UIView()
        return bottonView
    }()
    
    lazy var middleView: UIView = {
        let middleView = UIView()
        return middleView
    }()
    
    lazy var topView: UIView = {
        let topView = UIView()
        return topView
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 50

        return stackView
    }()
    
    var button: UIButton = {
        let button = UIButton()
        button.frame.size.height = 100
        button.frame.size.width = 100
        button.layer.cornerRadius = button.frame.size.height / 10
        button.backgroundColor = Colors.buttonColor
        button.setTitle(buttonText.title, for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
        
    @objc func buttonPressed() {
        dicesRandom(with: diceImageView)
        dicesRandom(with: diceImageView2)
    }
    
    func dicesRandom (with dice: UIImageView) {
        let bundle = Bundle(for: DiceView.self)
        if let random = dicees.randomElement(){
            if let newDice = UIImage(named: random, in: bundle, compatibleWith: nil){
                dice.image = newDice
            }
        }
    }

    lazy var logo: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        let bundle = Bundle(for: DiceView.self)
        if let logoImage = UIImage(named: ImageLogo.logo, in: bundle, compatibleWith: nil){
            image.image = logoImage
        }
        return image
    }()
    
    lazy var diceImageView: UIImageView = {
        
        let dice1 = UIImageView()
        let bundle = Bundle(for: DiceView.self)
        dicesRandom(with: dice1)
        return dice1
    }()
    
    lazy var diceImageView2: UIImageView = {
        
        let dice2 = UIImageView()
        let bundle = Bundle(for: DiceView.self)
        dicesRandom(with: dice2)
        return dice2
    }()
    
    lazy var background: UIImageView = {
        let greenBackground = UIImageView()
        let bundle = Bundle(for: DiceView.self)
        if let bG = UIImage(named: Background.green, in: bundle, compatibleWith: nil){
            greenBackground.image = bG
        }
        return greenBackground
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DiceView: ViewConfiguration{
    
    func buildViewHierarchy() {
        addSubview(background)
        addSubview(stackViewVertical)
        
        topView.addSubview(logo)
        middleView.addSubview(stackView)
        bottonView.addSubview(button)

        stackView.addSubview(diceImageView)
        stackView.addSubview(diceImageView2)
    }
    
    func setupConstraints() {
        
        background.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        stackViewVertical.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        stackView.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
            make.height.equalTo(100)
            make.width.equalTo(300)
        }
        logo.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.height.equalTo(120)
        }

        diceImageView.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(25)
        }

        diceImageView2.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.top.bottom.equalToSuperview()
            make.trailing.equalToSuperview().inset(25)
        }

        button.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(45)
        }
    }
}
