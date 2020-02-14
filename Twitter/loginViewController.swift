//
//  loginViewController.swift
//  Twitter
//
//  Created by Matthew Daniele on 2/13/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class loginViewController: UIViewController {

    @IBAction func onLoginButton(_ sender: Any) {
        let myUrl = "https://api.twitter.com/oauth/request_token"
        TwitterAPICaller.client?.login(url: myUrl, success: {
                
                UserDefaults.standard.set(true, forKey: "userLoggedIn")
                
                self.performSegue(withIdentifier: "loginToHome", sender: self)
            }, failure: { (Error) in
                print("could not login")
            })
        }

    override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: "userLoggedIn") {
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
