//
//  ViewController.swift
//  Notificaiton
//
//  Created by Pushparaj Selvam on 21/11/20.
//

import UIKit

class ViewController: UIViewController {
    
    // getting current badge number from UIApplication
    var badge = UIApplication.shared.applicationIconBadgeNumber
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func sendNotify(_ sender: Any) {
        let title = "Reminder"
        let subTitle = "go ahead"
        let body = "U are Notified"
        badge += 1
        // user build function which configure notification
        Notify(title, subTitle, body, badge)
        
    }
    
    func Notify(_ title: String, _ subTitle: String, _ body: String, _ badge: Int)
    {
        // trigger identifies when and how should notification shown
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        // actual content of the notification
        let content = UNMutableNotificationContent()
        content.title = title
        content.subtitle = subTitle
        content.body = body
        content.badge = NSNumber(integerLiteral: badge)
        
        // unique string id
        let uuid = UUID().uuidString
        
        // request for notification service 
        let request = UNNotificationRequest(identifier: uuid, content: content, trigger: trigger)
        
        // finally add the request to the notification center
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
}

