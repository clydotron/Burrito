//
//  TideDataViewController.swift
//  Burrito
//
//  Created by Brian Green on 9/6/19.
//  Copyright © 2019 Brian Green. All rights reserved.
//

import UIKit
import Alamofire

class TideDataViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

private let reuseIdentifier = "TideInfoCell"
    
    let noaaUrl = "https://tidesandcurrents.noaa.gov/api/datagetter"
    
    // more to it than this
    var tideStations = [TideStation]()
    var stationRepo: TideStationRepo?
    var tideInfo: TideInfo? {
        didSet {
            //refresh the UI
            if tideTableView != nil {
                tideTableView.reloadData()
            }
        }
    }
    
    var requestedStation : String
    
    
    @IBOutlet weak var stationNameLabel: UILabel!
    @IBOutlet weak var date: UILabel!

    @IBOutlet weak var tideStationPicker: UIPickerView!
    @IBOutlet weak var tideTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if stationRepo == nil {
            stationRepo = TideStationRepo.loadFromJSONFile(fileName: "TideStations.json")
            if let repo = stationRepo {
                tideStations = repo.stations
            }
        }
        
        tideStationPicker.delegate = self
        tideStationPicker.dataSource = self
        
        tideTableView.dataSource = self
        tideTableView.delegate = self
    }

//completion: @escaping ([RemoteRoom]?) -> Void
    func getTideStationData(station: String ) { //, completion: @escaping (TideInfo?) -> Void) {
        
        // request
        let urlX = "https://tidesandcurrents.noaa.gov/api/datagetter?date=today&station=\(station)&units=english&time_zone=lst_ldt&format=json&product=predictions&datum=STND&interval=hilo"

        var parameters = [String:String]();
        parameters["date"] = "today" //everntually this will be configurable
        parameters["station"] = station
        parameters["units"] = "english" //make configurable
        parameters["time_zone"] = "lst_ldt"
        parameters["format"] = "json"
        parameters["product"] = "predictions"
        parameters["datum"] = "NAVD"
        parameters["interval"] = "hilo"

        // switch to a date range:
        //current date + 2 extra
        
//is there a reasonable way we can keep track of the station?
 
        //@todo need a progress indicator
        
        Alamofire.request( noaaUrl, method:.get, parameters:parameters)
            .validate()
            .responseJSON { response in
                guard response.result.isSuccess else {
                    print("Error while fetching tide data: \(String(describing: response.result.error))")
                    return
                }
  
                guard let jsonData = response.data else {
                    print("something wrong with the json format")
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let predictions = try decoder.decode(TideInfo.self, from: jsonData)
    
                    DispatchQueue.main.async {
                        self.updateTideData(predictions);
                    }
    
                } catch let error {
                    print("error: \(error.localizedDescription)")
                    return
                }
            }
    }

    // MARK:
    func updateTideData( _ tideInfo: TideInfo? ) {

        // reenable the picker
        //tideStationPicker
        //???
        self.tideInfo = tideInfo;
    }


    // MARK:
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return tideStations[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return tideStations.count
    }
    
    // MARK: - UIPicker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("Getting data for: \(tideStations[row].name)")
        getTideStationData( station:tideStations[row].station_id )
    }
     
}

// MARK: UITableViewDataSource
extension TideDataViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1 //( tideInfo?.predictions.count ?? 0 ) > 0 ? 1 : 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let result = tideInfo?.predictions.count ?? 0
        return result
        //return tideInfo?.predictions.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)

        //format the cell
        if let tdata = tideInfo?.predictions[indexPath.row] {
            
            var output = String()
            output += ( tdata.type == "H" ) ? "High " : "Low "
            
            output += tdata.v + " "
            output += tdata.t
            cell.textLabel?.text = output
            
            
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            dateFormatter.dateFormat = "yyyy-MM-dd' 'HH:mm"
            dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
            
            if let date = dateFormatter.date(from:tdata.t) {
             print(date)
            }
            
            //al
        }

        return cell
    }
}

extension TideDataViewController : UITableViewDelegate {
    
}
