//
//  CitiesListTableViewCell.swift
//  JsonLevel
//
//  Created by ericzero on 11/26/22.
//

import UIKit

class CitiesListTableViewCell: UITableViewCell {

    let container = UIView()
    let idLabel = UILabel()
    let regionLbl = UILabel()
    
    let containerColor = UIColor(red: 151/255, green: 92/255, blue: 141/255, alpha: 1)

    
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
        addedConstraints()
    }
    
    func initSubviews() {
        container.clipsToBounds = true
//        containerView.layer.borderColor = UIColor.systemGray2.cgColor
//        containerView.layer.borderWidth = 0.5
        container.backgroundColor = containerColor
        container.layer.cornerRadius = 7
        container.layer.shadowRadius = 5
        container.layer.shadowColor = UIColor.gray.cgColor
        container.layer.shadowOpacity = 0.5
        container.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        idLabel.numberOfLines = 1
        idLabel.textColor = .systemGray4
        idLabel.font = .systemFont(ofSize: 20, weight: .medium)

        
        regionLbl.font = .systemFont(ofSize: 20, weight: .medium)
        regionLbl.numberOfLines = 1
        
    }
    
    func addedSubviews() {
        contentView.addSubview(container)
        container.addSubview(idLabel)
        container.addSubview(regionLbl)
    }
    
    func addedConstraints() {
        container.snp.makeConstraints { make in
            make.top.equalTo(5)
            make.left.equalTo(5)
            make.right.equalTo(-5)
            make.bottom.equalTo(-5)
        }
        
        idLabel.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.left.equalTo(10)
            make.bottom.equalTo(-10)
            make.height.equalTo(60)
            make.width.equalTo(idLabel.snp.height)
        }
        
        regionLbl.snp.makeConstraints { make in
            make.centerY.equalTo(idLabel.snp.centerY)
            make.left.equalTo(idLabel.snp.right).offset(10)
            make.right.equalTo(-10)
        }
    }
    
    func updateCell(data: State) {
        //regionImg.image = UIImage(named: data.icon)
        //regionLbl.text = "\(data.name ?? ""), \(data.id ?? 0)"
    }
    
    

}
