//
//  ViewController.swift
//  Adam_20210303_SNP
//
//  Created by Adam on 2021/3/3.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let SectionHeaderViewID = "SectionHeaderView_ID"
    let UITableViewCellID = "UITableViewCell_ID"
    var dataArray: [String] = ["常用", "公告", "足迹"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCellID)
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

    var tableView:UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .plain)
        tableView.estimatedRowHeight = 60.0
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        return tableView
    }()
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataArray.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCellID, for: indexPath)
        cell.textLabel?.text = String(indexPath.section)+String(indexPath.row)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header: SectionHeaderView = (tableView.dequeueReusableHeaderFooterView(withIdentifier: SectionHeaderViewID) as? SectionHeaderView)!
        let titleString = dataArray[section]
        header.titleString = titleString
        header.closure = {
            let vc = SubViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        return header
    }
}
