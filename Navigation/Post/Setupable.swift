//
//  Setupable.swift
//  Navigation
//
//  Created by Екатерина Александренко on 26.05.2022.
//

import Foundation

protocol ViewModelProtocol {}

protocol Setupable {
    func setup(with viewModel: ViewModelProtocol)
}
