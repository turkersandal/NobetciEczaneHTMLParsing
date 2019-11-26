//
//  ViewController.swift
//  NobetciEczaneHtmlParse
//
//  Created by Türker Sandal on 13.05.2019.
//  Copyright © 2019 Türker Sandal. All rights reserved.
//

import UIKit
import SwiftSoup

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var tableview: UITableView!
    
    
    
    var eczaneAd:[String] = []
    var eczaneIlce:[String] = []
    var eczaneAdres:[String] = []
    var eczaneTelefon:[String] = []
    
    
    public func convert(data:String) -> String
    {
        let newData = data.replacingOccurrences(of: "Ý",with: "İ")
        let lastData = newData.replacingOccurrences(of: "Þ",with: "Ş")
        let latestData = lastData.replacingOccurrences(of: "Ð", with: "Ğ")
        
        
        return latestData
    }
    
    
    public func htmlParse(){
        let myURLString = "https://www.edirneeo.org.tr/kartyazdir"
        guard let myURL = URL(string: myURLString) else {
            print("Error: \(myURLString) doesn't seem to be a valid URL")
            return
        }
        
        do {
            
            let myHTMLString = try String(contentsOf: myURL, encoding: .ascii)
            let swiftsoup = try SwiftSoup.parse(myHTMLString)
            let elements = swiftsoup.body()
            let eczaneler = try elements?.getElementsByClass("eczane")
            
            for eczane in eczaneler!{
                
                let ad = try! eczane.getElementsByClass("adi").text()
                let adres = try! eczane.getElementsByClass("adres").first()!.text()
                let telefon = try! eczane.getElementsByClass("adres2").text()
                let ilce = try! eczane.getElementsByClass("tel").text()
                
             
                eczaneAd.append(convert(data: ad))
                eczaneAdres.append(convert(data: adres))
                eczaneTelefon.append(telefon)
                eczaneIlce.append(convert(data: ilce))
              
             
                
            }
            
        } catch let error {
            print("Error: \(error)")
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        htmlParse()
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       return eczaneAdres.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell:TableViewCell = tableview.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
       
        
        cell.ad.text = eczaneAd[indexPath.row]
        cell.ilce.text = eczaneIlce[indexPath.row]
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let alertController = UIAlertController(title: eczaneAd[indexPath.row], message: eczaneIlce[indexPath.row]+"\n"+eczaneAdres[indexPath.row]+"\n"+eczaneTelefon[indexPath.row] , preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "Kapat", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    

}

