//
//  DetailVC.swift
//  JsonLevel
//
//  Created by ericzero on 11/16/22.
//

import UIKit
import SnapKit

class StateListViewController: UIViewController {
    
    let tableView2 = UITableView()
    
    var country: Country?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        setUpNavItem()
    }
    
    func setUp() {
        view.backgroundColor = .white
        
        tableView2.delegate = self
        tableView2.dataSource = self
        tableView2.register(StateTableViewCell.self, forCellReuseIdentifier: "StateTableViewCell")
        self.tableView2.separatorStyle = UITableViewCell.SeparatorStyle.none

        
        view.addSubview(tableView2)
        
        tableView2.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.right.bottom.equalTo(0)
        }
    }
    
    func setUpNavItem() {
           let myTitleLabel = UILabel()
            let attributedStr = NSAttributedString(string: " States of \(country?.name ?? "")", attributes: [.font: UIFont.systemFont(ofSize: 20, weight: .medium), .foregroundColor: UIColor.white])
           myTitleLabel.attributedText = attributedStr
           navigationItem.titleView = myTitleLabel
    }
 
}
extension StateListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return country?.states.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView2.dequeueReusableCell(withIdentifier: "StateTableViewCell", for: indexPath) as! StateTableViewCell
        cell.regionLbl.text = country?.states[indexPath.row].name ?? ""
        cell.idLabel.text = country?.states[indexPath.row].state_code ?? ""
            //cell.updateCell(data: (Country[indexPath.row]))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = CitiesListViewController()
        vc.state = country?.states[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
