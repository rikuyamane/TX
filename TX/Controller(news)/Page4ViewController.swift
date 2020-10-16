//
//  Page1ViewController.swift
//  News
//
//  Created by 高杉恒寛 on 2020/09/07.
//  Copyright © 2020 tsunehiro takasugi. All rights reserved.
//

import UIKit
import SegementSlide

class Page4ViewController: UITableViewController,SegementSlideContentScrollViewDelegate,XMLParserDelegate {
    
    //xmlparserのインスタンスを作成する
    
    var parser = XMLParser()
    
    var newsItems = [Newsitems]()
    
    
    //RSSのパース中の現在の要素名
    var currentElmentname:String!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = .systemGray2
        
        //画像を貼る
        let image = UIImage(named: "")
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.tableView.frame.size.width, height: self.tableView.frame.size.height))
        imageView.image = image
        self.tableView.backgroundView = imageView
        
        let urlString:String = "https://news.yahoo.co.jp/rss/topics/entertainment.xml"
        let url:URL = URL(string: urlString)!
        parser = XMLParser(contentsOf: url)!
        parser.delegate = self
        
        //解析がスタート（デリゲートメソッドが呼ばれる）
        parser.parse()

    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.size.height/5
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        cell.backgroundColor = .clear
        let newsItem = self.newsItems[indexPath.row]
        
        cell.textLabel?.text = newsItem.title
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize:15.0)
        cell.textLabel?.textColor = .white
        
        cell.detailTextLabel?.text = newsItem.url
        cell.detailTextLabel?.textColor = .white
        
        return cell
     
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        currentElmentname = nil
        if elementName == "item"{
            self.newsItems.append(Newsitems())
        }else{
            currentElmentname = elementName
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        if self.newsItems.count > 0{
            
            let lastItem = self.newsItems[self.newsItems.count - 1]
            
            switch self.currentElmentname{
            case "title" :
                lastItem.title = string
            case "link" :
                lastItem.url = string
            case "pubDate":
                lastItem.pubDate = string
                print(lastItem.pubDate as Any)
            default:break
            }
            
        }
    }
    
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        self.currentElmentname = nil
    }
    
    
    func parserDidEndDocument(_ parser: XMLParser) {
        self.tableView.reloadData()
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //webViewに取得したURLを表示したい（画面遷移したさきで）
        
        let webviewController:UIViewController = WebViewController()
        
        webviewController.modalTransitionStyle = .crossDissolve
        let newsItem = newsItems[indexPath.row]
        UserDefaults.standard.set(newsItem.url, forKey: "url")
        
        self.present(webviewController, animated: true, completion: nil)
        
    }
    
}


