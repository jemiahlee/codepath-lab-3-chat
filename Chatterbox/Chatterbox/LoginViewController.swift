//
//  ViewController.swift
//  Chatterbox
//
//  Created by Jeremiah Lee on 2/17/16.
//  Copyright © 2016 Codepath. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
       override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onLogin(sender: AnyObject) {
        
        var username = usernameTextField.text
        var password = passwordTextField.text
        
        PFUser.logInWithUsernameInBackground( username!, password: password!) {
            (user: PFUser?, error: NSError?) -> Void in
            if user != nil {
                print("After login")
            } else {
                let errorString = error!.userInfo["error"] as? NSString
                
                let alertController = UIAlertController(title: "Error", message: errorString! as String, preferredStyle: .Alert)
                print ("Inside Error block")
                
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
    
    @IBAction func onSignup(sender: AnyObject) {
    
        var user = PFUser()
        user.username = usernameTextField.text
        user.password = passwordTextField.text
        user.email = emailTextField.text
        
        // other fields can be set just like with PFObject
      //  user["phone"] = "415-392-0202"
        
        user.signUpInBackgroundWithBlock {
            (succeeded: Bool, error: NSError?) -> Void in
            if let error = error {
                let errorString = error.userInfo["error"] as? NSString
                
                let alertController = UIAlertController(title: "Error", message: errorString! as String, preferredStyle: .Alert)
                    print ("Inside Error block")
                
                // create an OK action
                let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                    // handle response here.
                }
                // add the OK action to the alert controller
                alertController.addAction(OKAction)
                
                self.presentViewController(alertController, animated: true) {
                    // optional code for what happens after the alert controller has finished presenting
                }
                
                  } else {
                // Hooray! Let them use the app now.
            }
        }
    }


}

