//
//  ViewController.swift
//  pricegetter
//
//  Created by Nikhil Patel on 5/8/18.
//  Copyright © 2018 Nikhil Patel. All rights reserved.
//
import UIKit

struct Stats : Decodable {
    let percent_change_24h : Double
}
struct Currency : Decodable{
    let USD : Stats
}
struct Crypto : Decodable{
    let quotes : Currency
}
struct initialdata : Decodable{
    let data : Crypto
}
struct Entry1 : Decodable{
    let time : Double
    let close : Double
}
struct firstdata : Decodable{
    let Data : [Entry1]
}
class ViewController: UIViewController {
    
    @IBOutlet weak var etcpctbox: UIView!
    @IBOutlet weak var trxpctbox: UIView!
    @IBOutlet weak var ltcpctbox: UIView!
    @IBOutlet weak var btcpctbox: UIView!
    @IBOutlet weak var trxpctlabel: UILabel!
    @IBOutlet weak var ltcptclabel: UILabel!
    @IBOutlet weak var etcpctlabel: UILabel!
    @IBOutlet weak var btcptclabel: UILabel!
    @IBOutlet weak var TRXpricelabel: UILabel!
    @IBOutlet weak var ltcpricelabel: UILabel!
    @IBOutlet weak var btcpricelabel: UILabel!
    @IBOutlet weak var ethpricelabel: UILabel!
    @IBAction func button(_ sender: UIButton) {
        let curBTCpriceURL = "https://min-api.cryptocompare.com/data/price?fsym=BTC&tsyms=USD"
        let btcurl = URL(string: curBTCpriceURL)
        URLSession.shared.dataTask(with: btcurl!) { ( databtc, response, error) in
            do{
                struct CurrentPrice : Decodable{
                    let USD : Double
                }
                let btccurrentdata1 = try JSONDecoder().decode(CurrentPrice.self, from: databtc!)
                print("Bitcoin current price is: $",btccurrentdata1.USD)
                DispatchQueue.main.async {
                    self.btcpricelabel.text = String(btccurrentdata1.USD)
                }
            }
            catch{
                print("Error")
                }
        }.resume()
        let curETHpriceURL = "https://min-api.cryptocompare.com/data/price?fsym=ETH&tsyms=USD"
        let ethurl = URL(string: curETHpriceURL)
        URLSession.shared.dataTask(with: ethurl!) { ( dataeth, response, error) in
            do{
                struct CurrentPrice : Decodable{
                    let USD : Double
                }
                let ethcurrentdata1 = try JSONDecoder().decode(CurrentPrice.self, from: dataeth!)
                print("Ethereum current price is: $",ethcurrentdata1.USD)
                DispatchQueue.main.async {
                    self.ethpricelabel.text = String(ethcurrentdata1.USD)
                }
            }
            catch{
                print("Error")
            }
            }
            .resume()
        let curLTCpriceURL = "https://min-api.cryptocompare.com/data/price?fsym=LTC&tsyms=USD"
        let ltcurl = URL(string: curLTCpriceURL)
        URLSession.shared.dataTask(with: ltcurl!) { ( dataltc, response, error) in
            do{
                struct CurrentPrice : Decodable{
                    let USD : Double
                }
                let ltccurrentdata1 = try JSONDecoder().decode(CurrentPrice.self, from: dataltc!)
                print("Litecoin current price is: $",ltccurrentdata1.USD)
                DispatchQueue.main.async {
                    self.ltcpricelabel.text = String(ltccurrentdata1.USD)
                }
            }
            catch{
                print("Error")
            }
            }
            .resume()
        let curTRXpriceURL = "https://min-api.cryptocompare.com/data/price?fsym=TRX&tsyms=USD"
        let TRXurl = URL(string: curTRXpriceURL)
        URLSession.shared.dataTask(with: TRXurl!) { ( dataTRX, response, error) in
            do{
                struct CurrentPrice : Decodable{
                    let USD : Double
                }
                let TRXcurrentdata1 = try JSONDecoder().decode(CurrentPrice.self, from: dataTRX!)
                print("TRON current price is: $",TRXcurrentdata1.USD)
                DispatchQueue.main.async {
                    self.TRXpricelabel.text = String(TRXcurrentdata1.USD)
                }
            }
            catch{
                print("Error")
            }
            }
            .resume()
        let btcpcturl1 = "https://api.coinmarketcap.com/v2/ticker/1/"
        let btcpcturl = URL(string: btcpcturl1)
        URLSession.shared.dataTask(with: btcpcturl!) { ( databtcpct, response, error) in
            do{

                let btcpctchange1 = try JSONDecoder().decode(initialdata.self, from: databtcpct!)
                DispatchQueue.main.async {
                    self.btcptclabel.text = String(btcpctchange1.data.quotes.USD.percent_change_24h)
                    if btcpctchange1.data.quotes.USD.percent_change_24h > 0{
                        self.btcpctbox.backgroundColor = UIColor.green
                    }
                    else if btcpctchange1.data.quotes.USD.percent_change_24h < 0{
                        self.btcpctbox.backgroundColor = UIColor.red
                }
            }
            }
            catch{
                print("Error")
            }
            }
            .resume()
        let etcpcturl1 = "https://api.coinmarketcap.com/v2/ticker/1027/"
        let etcpcturl = URL(string: etcpcturl1)
        URLSession.shared.dataTask(with: etcpcturl!) { ( dataetcpct, response, error) in
            do{
                let etcpctchange1 = try JSONDecoder().decode(initialdata.self, from: dataetcpct!)
                DispatchQueue.main.async {
                    self.etcpctlabel.text = String(etcpctchange1.data.quotes.USD.percent_change_24h)
                    if etcpctchange1.data.quotes.USD.percent_change_24h > 0{
                        self.etcpctbox.backgroundColor = UIColor.green
                    }
                    else if etcpctchange1.data.quotes.USD.percent_change_24h < 0{
                        self.etcpctbox.backgroundColor = UIColor.red
                    }
                }
            }
            catch{
                print("Error")
            }
            }
            .resume()
        let ltcpcturl1 = "https://api.coinmarketcap.com/v2/ticker/2/"
        let ltcpcturl = URL(string: ltcpcturl1)
        URLSession.shared.dataTask(with: ltcpcturl!) { ( dataltcpct, response, error) in
            do{
                let ltcpctchange1 = try JSONDecoder().decode(initialdata.self, from: dataltcpct!)
                DispatchQueue.main.async {
                    self.ltcptclabel.text = String(ltcpctchange1.data.quotes.USD.percent_change_24h)
                    if ltcpctchange1.data.quotes.USD.percent_change_24h > 0{
                        self.ltcpctbox.backgroundColor = UIColor.green
                    }
                    else if ltcpctchange1.data.quotes.USD.percent_change_24h < 0{
                        self.ltcpctbox.backgroundColor = UIColor.red
                    }
                }
            }
            catch{
                print("Error")
            }
            }
            .resume()
        let trxpcturl1 = "https://api.coinmarketcap.com/v2/ticker/1958/"
        let trxpcturl = URL(string: trxpcturl1)
        URLSession.shared.dataTask(with: trxpcturl!) { ( datatrxpct, response, error) in
            do{
                let trxpctchange1 = try JSONDecoder().decode(initialdata.self, from: datatrxpct!)
                DispatchQueue.main.async {
                    self.trxpctlabel.text = String(trxpctchange1.data.quotes.USD.percent_change_24h)
                    if trxpctchange1.data.quotes.USD.percent_change_24h > 0{
                        self.trxpctbox.backgroundColor = UIColor.green
                    }
                    else if trxpctchange1.data.quotes.USD.percent_change_24h < 0{
                        self.trxpctbox.backgroundColor = UIColor.red
                    }
                }
            }
            catch{
                print("Error")
            }
            }
            .resume()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
    let historyURL = "https://min-api.cryptocompare.com/data/histoday?fsym=BTC&tsym=USD&limit=60&aggregate=1&e=CCCAGG"
    let url2 = URL(string: historyURL)
    URLSession.shared.dataTask(with: url2!) { (data2, response2,error2) in
        do{
            let initialdata = try JSONDecoder().decode(firstdata.self, from: data2!)
            //let date = Date(timeIntervalSince1970: initialdata.Data[0].time)
            //print("Bitcoin's price on:",initialdata.Data[0].time, "was: $", initialdata.Data[0].close)
            for eachEntry in initialdata.Data{
                let date = [Date(timeIntervalSince1970: eachEntry.time)]
                print(date,eachEntry.close)
                }
            }
        catch{
            print("Error")
            }
        }.resume()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
