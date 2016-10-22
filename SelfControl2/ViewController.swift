//
//  ViewController.swift
//  SelfControl2
//
//  Created by Saltanat Aimakhanova on 10/17/16.
//  Copyright © 2016 saltaim. All rights reserved.
//

import UIKit
import Cartography
import SwiftyJSON
import SafariServices



class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var tableView: UITableView = UITableView()
    var arr = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.view.backgroundColor = UIColor.red;
        //let blockerIdentifier = "com.appsfoundation.ContentBlocker.Blocker"
        //SFContentBlockerManager.
       // print("--------------------")
        //print(FileManager.default.c)
        //Bundle(for: ContentBlockerRequestHandler)
        //print(Bundle.main.path(forResource: "blocker/blockerList", ofType: "json"))
        //print(Bundle.main.path(forResource: "blockerList", ofType: "json"))
        
        //print("--------------------")
        //Bundle.main.url
        //Bundle.main.pa
        //FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: <#T##String#>)
       // print(Bundle.main.url(forResource: "blocker/blockerList", withExtension: "json"))
       // Bundle.init(for: ContentBlockerRequestHandler)
       // print(Bundle.main.paths(forResourcesOfType: "blockerList.json", inDirectory: "blocker"))
        if let path = Bundle.main.path(forResource: "blockerList", ofType: "json"){
            guard let data = NSData(contentsOf: URL(fileURLWithPath: path)) else{
                return
            }
             let jsonObj = JSON(data: data as Data)
            print(jsonObj)
            if jsonObj != JSON.null {
               // print("Hello I do work here \(jsonObj["trigger"])")
                guard let arr1 = jsonObj.array else{
                    return;
                }
                var count = arr1.count;
                for index in 0...count-1{
                    //print("-------")
                   // print(jsonObj[index]["trigger"]["url-filter"].stringValue)
                   arr.append(jsonObj[index]["trigger"]["url-filter"].stringValue);

                    
                }
                //for
                
                        } else {
                            print("Could not get json from file, make sure that file contains valid json.")
                        }
            //
            
            
        }
       // arr.append("Hello")
       // arr.append("my name is ")
        let button = UIButton();
        button.setTitle("+", for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        // button.titleLabel?.text = "+"
        
        self.view.addSubview(tableView)
        self.view.addSubview(button)
        tableView.delegate = self
        tableView.dataSource = self
        constrain(tableView, view, button){
            tableView, view, button in
            tableView.width == view.width
            tableView.height == view.height - 50
            tableView.top == view.top
            tableView.right == view.right
            button.height == 50
            button.width == view.width
            button.top == view.bottom - 50
            button.right == view.right
            
        }
        //arr = Array()
        // Do any additional setup after loading the view, typically from a nib.
        // self.view.backgroundColor = UIColor.redColor();
    }
    func buttonPressed(){
        // print("I was pressed")
        //var alert = UIAlertView();
        //alert.title = "Enter a website";
        // alert.alertViewStyle = UIAlertViewStyle.plainTextInput
        // alert.addB
        //alert.addButton(withTitle: "Done")
        //alert.addButton(withTitle: "Cancel")
        var alert = UIAlertController(title: "Alert", message: "Enter website that you would like to block", preferredStyle: UIAlertControllerStyle.alert)
        alert.addTextField { (text) in
            text.placeholder = "http://";
        }
        let action = UIAlertAction(title: "Done", style: UIAlertActionStyle.default) { (action: UIAlertAction) in
            print("I am working")
        }
        let action2 = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) { (UIAlertAction) in
            self.dismiss(animated: true, completion: nil)
        }
        alert.addAction(action)
        alert.addAction(action2)
        self.present(alert, animated: true, completion: nil)
        //self.viewC
        //presentedViewController(alert)
        //alert.addA
        // alert.show()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arr.count
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        // Code here
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        //cell.t
        //let cell1 = tableView.dequeueReusableCell(withIdentifier: "cell")
        //cell.textLabel?.text = "Hello"
        cell.textLabel?.text = arr[(indexPath as NSIndexPath).item]
        return cell;
    }
    
    
}

