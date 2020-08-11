//
//  ViewController.swift
//  Weather Forecast
//
//  Created by sahil pathania on 09/08/20.
//  Copyright © 2020 sahil pathania. All rights reserved.
//

import UIKit
import CoreLocation


class ViewController: UIViewController {

    @IBOutlet weak var tableView : UITableView!
    let locationManager = CLLocationManager()
    var currentLocation : CLLocation?
    var weatherDataModel : WeatherDataModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Register two cells
        tableView.register(HourlyTableViewCell.nib(), forCellReuseIdentifier: HourlyTableViewCell.identifier)
        tableView.register(WeatherTableViewCell.nib(), forCellReuseIdentifier: WeatherTableViewCell.identifier)
        tableView.register(CurrentTimeTableViewCell.nib(), forCellReuseIdentifier: CurrentTimeTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
//        requestWeatherForLocation()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupLocation()
    }
    
}
extension ViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return models.count
        guard let weatherDataModel = weatherDataModel else {
            return 0
        }
        return (weatherDataModel.daily?.count ?? 0) + 2
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 180
        case 1:
            return 110
        default:
            return 70
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let weatherDataModel = weatherDataModel  else {
            return UITableViewCell()
        }
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: CurrentTimeTableViewCell.identifier, for: indexPath) as! CurrentTimeTableViewCell
            cell.configure(with: weatherDataModel)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: HourlyTableViewCell.identifier, for: indexPath) as! HourlyTableViewCell
            cell.hourlyModel = weatherDataModel.hourly
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.identifier, for: indexPath) as! WeatherTableViewCell
            cell.configure(with: weatherDataModel.daily , index : indexPath.row - 2)
            return cell
        }
    }
    
}


//Location
extension ViewController : CLLocationManagerDelegate{
    func setupLocation() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if !locations.isEmpty , currentLocation == nil {
            currentLocation = locations.first
            locationManager.stopUpdatingLocation()
            requestWeatherForLocation()
        }
    }
    func requestWeatherForLocation() {
        guard let currentLocation = currentLocation else {return}
        let lat = currentLocation.coordinate.latitude
        let long = currentLocation.coordinate.longitude
        ApiManager.sharedInstance.callWeatherApi(lat: lat, long: long, success: { [weak self] (response) in
            guard let weakSelf = self else {return}
            weakSelf.weatherDataModel = response
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }, failure: {_ in
            print("fail")
        })
    }
}


