//
//  MyModel.swift
//  JsonLevel
//
//  Created by ericzero on 11/16/22.
//

import UIKit

class MyLocalData {
    
    var countriesArr = [Country]()
    var statesArr = [State]()
    var citiesArr = [Cities]()
    init() {
        parse()
    }
    
    func parse(){
        
        guard let path = Bundle.main.path(forResource: "countries+states+cities", ofType: "json") else { return }
        let myURL = URL(fileURLWithPath: path)
        
        if let data = try? Data(contentsOf: myURL){
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: AnyObject]] {
                    for item in json {
                        countriesArr.append(Country(item))
                    }
                }
            }
            catch let error as NSError {
                print(error)
            }
        }
    }
}


class Country {
    
    var id: Int?
    var name: String?
    var iso3: String?
    var iso2: String?
    var numeric_code: String?
    var phone_code: String?
    var capital: String?
    var currency: String?
    var currency_name: String?
    var currency_symbol: String?
    var tld: String?
    var native: String?
    var region: String?
    var subregion: String?
    var latitude: String?
    var longitude: String?
    var emoji: String?
    var emojiU: String?
    
    var translations: Translations?
    var timezones = [Timezone]()
    var states = [State]()
    
    init(_ json: [String: AnyObject])  {
        self.id = json["id"] as? Int
        self.name = json["name"] as? String
        self.iso3 = json["iso3"] as? String
        self.iso2 = json["iso2"] as? String
        self.numeric_code = json["numeric_code"] as? String
        self.phone_code = json["phone_code"] as? String
        self.capital = json["capital"] as? String
        self.currency = json["currency"] as? String
        self.currency_name = json["currency_name"] as? String
        self.currency_symbol = json["currency_symbol"] as? String
        self.tld = json["tld"] as? String
        self.native = json["native"] as? String
        self.region = json["region"] as? String
        self.subregion = json["subregion"] as? String
        self.latitude = json["latitude"] as? String
        self.longitude = json["longitude"] as? String
        self.emoji = json["emoji"] as? String
        self.emojiU = json["emojiU"] as? String
        
        if let dict = json["translations"] as? [String: AnyObject] {
            self.translations = Translations(dict)
        }
        if let arr = json["timezones"] as? [[String: AnyObject]] {
            for item in arr{
                self.timezones.append(Timezone(item))
            }
        }
        if let arr = json["states"] as? [[String: AnyObject]] {
            for item in arr{
                self.states.append(State(item))
            }
        }
        
    }
}

class Translations {
    var kr: String?
    var br: String?
    var pt: String?
    var nl: String?
    var hr: String?
    var fa: String?
    var de: String?
    var es: String?
    
    init(_ json: [String: AnyObject]) {
        self.kr = json["kr"] as? String
        self.br = json["br"] as? String
        self.pt = json["pt"] as? String
        self.nl = json["nl"] as? String
        self.hr = json["hr"] as? String
        self.fa = json["fa"] as? String
        self.de = json["de"] as? String
        self.es = json["es"] as? String
        
    }
}
class Timezone {
    var zoneName: String?
    var gmtOffset: String?
    var gmtOffsetName: String?
    var abbreviation: String?
    var tzName: String?
   
    init(_ json: [String: AnyObject]) {
        self.zoneName = json["zoneName"] as? String
        self.gmtOffset = json["gmtOffset"] as? String
        self.gmtOffsetName = json["gmtOffsetName"] as? String
        self.abbreviation = json["abbreviation"] as? String
        self.tzName = json["tzName"] as? String
       
    }
}
class State {
    var id: Int?
    var name: String?
    var state_code: String?
    var cities = [Cities]()
    
    init(_ json: [String: AnyObject]) {
        self.id = json["id"] as? Int
        self.name = json["name"] as? String
        self.state_code = json["state_code"] as? String
        if let arr = json["cities"] as? [[String: AnyObject]] {
            for item in arr{
                self.cities.append(Cities(item))
            }
        }
    }
}
class Cities {
    var id: Int?
    var name: String?
     
    init(_ json: [String: AnyObject]) {
        self.id = json["id"] as? Int
        self.name = json["name"] as? String
    }
}

//"cities": [
//    {
//        "id": 52,
//        "name": "Ashkāsham",
//        "latitude": "36.68333000",
//        "longitude": "71.53333000"
//    },
