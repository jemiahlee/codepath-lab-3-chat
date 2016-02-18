//
//  ChatViewController.swift
//  Chatterbox
//
//  Created by Jeremiah Lee on 2/17/16.
//  Copyright © 2016 Codepath. All rights reserved.
//

import Parse
import UIKit

class ChatViewController: UIViewController {

    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var messageField: UITextField!
    
    @IBAction func sendMessage(sender: AnyObject) {
        let text = messageField.text
        
        print("Will send message of \(text) here")
        let message = PFObject(className:"Message_iOSFeb2016")
        message["text"] = text
        message.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            if (success) {
                NSLog("successful send of the message \(text)")
            } else {
                let errorString = error!.description as? NSString
                
                let alertController = UIAlertController(title: "Error", message: errorString! as String, preferredStyle: .Alert)
                
                // create an OK action
                let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                    // handle response here.
                }
                // add the OK action to the alert controller
                alertController.addAction(OKAction)
                
                self.presentViewController(alertController, animated: true) {
                    // optional code for what happens after the alert controller has finished presenting
                }
            }
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
