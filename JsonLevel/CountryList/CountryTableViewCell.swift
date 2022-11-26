//
//  ListTVC.swift
//  JsonLevel
//
//  Created by ericzero on 11/16/22.
//

import UIKit
import SnapKit

class CountryTableViewCell: UITableViewCell {
    
    let containerView = UIView()
    let iconLabel = UILabel()
    let countryName = UILabel()
    let containerColor = UIColor(red: 151/255, green: 92/255, blue: 141/255, alpha: 1)
    let iconLabelColor = UIColor(red: 101/255, green: 100/255, blue: 124/255, alpha: 1)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initData() {
        initSubviews()
        addedSubviews()
        constSubviews()
    }
    
    func initSubviews() {
        containerView.clipsToBounds = true
//        containerView.layer.borderColor = UIColor.systemGray2.cgColor
//        containerView.layer.borderWidth = 0.5
        containerView.backgroundColor = containerColor
        containerView.layer.cornerRadius = 7
        containerView.layer.shadowRadius = 5
        containerView.layer.shadowColor = UIColor.gray.cgColor
        containerView.layer.shadowOpacity = 0.5
        containerView.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        iconLabel.numberOfLines = 1
        iconLabel.backgroundColor = iconLabelColor
        iconLabel.clipsToBounds = true
        iconLabel.layer.cornerRadius = 7
        iconLabel.textAlignment = .center
        iconLabel.font = .systemFont(ofSize: 40, weight: .semibold)
        
        countryName.numberOfLines = 0
        countryName.textColor = .systemGray4
        countryName.textAlignment = .left
        countryName.font = .systemFont(ofSize: 15, weight: .medium)
        
    }
    
    func addedSubviews() {
        contentView.addSubview(containerView)
        containerView.addSubview(iconLabel)
        containerView.addSubview(countryName)
    }
    
    func constSubviews() {
        containerView.snp.makeConstraints { make in
            make.top.equalTo(5)
            make.left.equalTo(5)
            make.right.equalTo(-5)
            make.bottom.equalTo(-5)

        }
        
        iconLabel.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.left.equalTo(10)
            make.bottom.equalTo(-10)
            make.height.equalTo(100)
            make.width.equalTo(iconLabel.snp.height)
        }
        
        countryName.snp.makeConstraints { make in
            //make.centerY.equalTo(iconLabel.snp.centerY)
            make.top.equalTo(10)
            make.left.equalTo(iconLabel.snp.right).offset(10)
            make.right.equalTo(-10)
            make.bottom.equalTo(-10)
        }
    }
    
    func updateCell(data: Country) {
        iconLabel.text = "\(data.emoji ?? "")"
        countryName.text = " Country name: \(data.name ?? "")\n Capital: \(data.capital ?? "")\n Phone code: \(data.phone_code ?? "") \n Name in Korean: \(data.translations?.kr ?? "") \n Name in Portugese: \(data.translations?.br ?? "")"
    }
    
  
    
}
