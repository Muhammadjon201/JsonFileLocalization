//
//  MainVC.swift
//  JsonLevel
//
//  Created by ericzero on 11/16/22.
//

import UIKit
import SnapKit

class CountryListViewController: UIViewController {
    
    let countrySearch = UISearchBar()
    let tableV = UITableView()
    
    var searching = false
    var filteredData = MyLocalData()
    let model = MyLocalData()
    lazy var countryArr = model.countriesArr
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initViews()
        setUpNavItem()
    }
    
    func initViews() {

        view.backgroundColor = .white
        filteredData = model
        countrySearch.delegate = self
        
        tableV.delegate = self
        tableV.dataSource = self
        tableV.register(CountryTableViewCell.self, forCellReuseIdentifier: "CountryTableViewCell")
        self.tableV.separatorStyle = UITableViewCell.SeparatorStyle.none

        
        view.addSubview(tableV)
        
        tableV.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.right.bottom.equalTo(0)
        }
    }
    
    func setUpNavItem() {
           let myTitleLabel = UILabel()
           let attributedStr = NSAttributedString(string: "Countries", attributes: [.font: UIFont.systemFont(ofSize: 20, weight: .medium), .foregroundColor: UIColor.white])
           myTitleLabel.attributedText = attributedStr
           navigationItem.titleView = myTitleLabel
    }
}
// MARK: - TableView datasource

extension CountryListViewController: UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return filteredData.countriesArr.count
        }else{
            return countryArr.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableV.dequeueReusableCell(withIdentifier: "CountryTableViewCell", for: indexPath) as! CountryTableViewCell
        if searching {
            cell.updateCell(data: filteredData.countriesArr[indexPath.row])
        }else{
            cell.updateCell(data: countryArr[indexPath.row])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = StateListViewController()
        vc.country = countryArr[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - Searchbar Config
//    
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//    
//        filteredData = filteredData.countriesArr.filter({$0.contains(searchText)})
//        searching = true
//        tableV.reloadData()
//    }
}

