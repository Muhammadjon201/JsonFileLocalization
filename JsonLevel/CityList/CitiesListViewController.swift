//
//  CitiesListViewController.swift
//  JsonLevel
//
//  Created by ericzero on 11/25/22.
//

import UIKit
import SnapKit

class CitiesListViewController: UIViewController {
    
    let tableView2 = UITableView()
    
    var state: State?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        setUpNavItem()
    }
    
    func setUp() {
        view.backgroundColor = .white
        
        tableView2.delegate = self
        tableView2.dataSource = self
        tableView2.register(StateTableViewCell.self, forCellReuseIdentifier: "CitiesListTableViewCell")
        
        view.addSubview(tableView2)
        
        tableView2.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.right.bottom.equalTo(0)
        }
    }
    
    func setUpNavItem() {
           let myTitleLabel = UILabel()
            let attributedStr = NSAttributedString(string: "\(state?.name ?? "")", attributes: [.font: UIFont.systemFont(ofSize: 25, weight: .medium), .foregroundColor: UIColor.white])
           myTitleLabel.attributedText = attributedStr
           navigationItem.titleView = myTitleLabel
    }
 
}
extension CitiesListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return state?.cities.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView2.dequeueReusableCell(withIdentifier: "CitiesListTableViewCell", for: indexPath) as! StateTableViewCell
        cell.regionLbl.text = state?.cities[indexPath.row].name ?? ""
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(state?.cities[indexPath.row].name ?? "")
    }
    
    
}
