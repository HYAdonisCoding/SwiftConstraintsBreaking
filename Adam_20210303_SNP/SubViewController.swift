//
//  SubViewController.swift
//  Adam_20210303_SNP
//
//  Created by Adam on 2021/3/4.
//

import Foundation
import UIKit

class SubViewController: ViewController {
    let SubTableViewCellID = "SubTableViewCell_ID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "详情TableHeaderView"
        dataArray = ["人员详情", "打卡记录"]
        tableView.register(SubTableViewCell.self, forCellReuseIdentifier: SubTableViewCellID)
        tableView.register(SectionHeaderView.self, forHeaderFooterViewReuseIdentifier: SectionHeaderViewID)
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
            make.left.equalTo(0)
            make.right.equalTo(0)
        }
    }
}

extension SubViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return dataArray.count
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SubTableViewCell = tableView.dequeueReusableCell(withIdentifier: SubTableViewCellID, for: indexPath) as! SubTableViewCell
//        cell.textLabel?.text = String(indexPath.section)+String(indexPath.row)
        cell.dataArray = dataArray
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let header: SectionHeaderView = (tableView.dequeueReusableHeaderFooterView(withIdentifier: SectionHeaderViewID) as? SectionHeaderView)!
//        let titleString = dataArray[section]
//        header.titleString = titleString
        return UIView()
    }
}
