//
//  RxSampleTableViewController.swift
//  RxSwiftTutorial
//
//  Created by 1002237 on 2018. 3. 5..
//  Copyright © 2018년 1002237. All rights reserved.
//

import UIKit
var navi:UINavigationController? = nil
class RxSampleTableViewController : UITableViewController{
    override func viewDidLoad() {
        navi = self.navigationController
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "rxcell", for: indexPath) as UITableViewCell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
}

class RxCell : UITableViewCell{
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var detailButton: UIButton!
    @IBAction func onButton(_ sender: Any) {
        let v = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController")
        navi?.pushViewController(v, animated: true)
    }
}
