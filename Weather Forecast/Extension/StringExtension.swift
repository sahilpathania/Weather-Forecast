//
//  StringExtension.swift
//  Weather Forecast
//
//  Created by sahil pathania on 11/08/20.
//  Copyright © 2020 sahil pathania. All rights reserved.
//

import Foundation
extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
