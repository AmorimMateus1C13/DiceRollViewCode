//
//  ViewConfiguration.swift
//  DiceViewCode
//
//  Created by Mateus Amorim on 08/08/22.
//

import Foundation

protocol ViewConfiguration {
    func setupViewConfiguration()
    func buildViewHierarchy()
    func setupConstraints()
}

extension ViewConfiguration {
    func setupViewConfiguration() {
        buildViewHierarchy()
        setupConstraints()
    }
}
