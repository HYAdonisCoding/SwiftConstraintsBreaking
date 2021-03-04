//
//  SubTableViewCell.swift
//  Adam_20210303_SNP
//
//  Created by Adam on 2021/3/4.
//

import Foundation
import UIKit


class SubTableViewCell: UITableViewCell {
    var dataArray: [String]? {
        didSet {
            tableView.snp.updateConstraints { (make) in
                make.height.equalTo((dataArray?.count ?? 0)*50+44)
            }
            tableView.reloadData()
        }
    }
    let UITableViewCellID = "UITabelViewCell_ID"
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .plain)
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCellID)
        self.contentView.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.height.equalTo((dataArray?.count ?? 0)*50+44)
        }
        return tableView
    }()
    private lazy var header: SectionHeaderView = {
        let header = SectionHeaderView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 60))
        header.titleString = "我的详情"
        return header
    }()
    override func layoutSubviews() {
        super.layoutSubviews()
        
        tableView.tableHeaderView = header
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let _ = tableView
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SubTableViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCellID, for: indexPath)
        cell.textLabel?.text = "分区: "+String(indexPath.section)+" 行号: "+String(indexPath.row)
        return cell
    }
}
