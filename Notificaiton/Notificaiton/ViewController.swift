//
//  ViewController.swift
//  Notificaiton
//
//  Created by Pushparaj Selvam on 21/11/20.
//

import UIKit

class ViewController: UIViewController {
    
    var badge = UIApplication.shared.applicationIconBadgeNumber
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func sendNotify(_ sender: Any) {
        let title = "Reminder"
        let subTitle = "go ahead"
        let body = "U are Notified"
        badge += 1
        Notify(title, subTitle, body, badge)
        
    }
    
    func Notify(_ title: String, _ subTitle: String, _ body: String, _ badge: Int)
    {
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let content = UNMutableNotificationContent()
        content.title = title
        content.subtitle = subTitle
        content.body = body
        content.badge = NSNumber(integerLiteral: badge)
        
        let uuid = UUID().uuidString
        
        let request = UNNotificationRequest(identifier: uuid, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
}

