//
//  HourlyTableViewCell.swift
//  Weather Forecast
//
//  Created by sahil pathania on 09/08/20.
//  Copyright © 2020 sahil pathania. All rights reserved.
//

import UIKit

class HourlyTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    var hourlyModel: [Hourly]?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.register(HourlyCollectionViewCell.nib(), forCellWithReuseIdentifier: HourlyCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    static let identifier = "HourlyTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "HourlyTableViewCell", bundle: nil)
    }
}

extension HourlyTableViewCell : UICollectionViewDelegate , UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hourlyModel?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HourlyCollectionViewCell.identifier, for: indexPath) as! HourlyCollectionViewCell
        cell.configure(with: hourlyModel, index: indexPath.row)
        return cell
    }
    
    
}
