//
//  SectionHeaderView.swift
//  Adam_20210303_SNP
//
//  Created by Adam on 2021/3/3.
//

import Foundation
import SnapKit


typealias HeaderClosure = () -> Void

class SectionHeaderView: UITableViewHeaderFooterView {
    var closure: HeaderClosure?
    
    // 标题
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        backView.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.left.top.equalTo(15)
//            make.width.equalTo(150)
//            make.height.equalTo(30)
            make.bottom.equalTo(-15)
        }
        return label
    }()
    // 子标题
    private lazy var subLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.lightGray
        label.textAlignment = NSTextAlignment.right
        backView.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.left.equalTo(titleLabel.snp.right)
            make.height.top.equalTo(titleLabel)
//            make.right.equalToSuperview().offset(-100)
        }
        return label
    }()
    private lazy var moreBtn:UIButton = {
        let button = UIButton.init(type: .custom)
        button.setTitle("查看全部", for: .normal)
        button.setImage(UIImage(named: "show_all_icon"), for: .normal)
//        button.semanticContentAttribute = .forceRightToLeft
        button.setTitleColor(UIColor.gray, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.addTarget(self, action: #selector(moreBtn(button:)), for: .touchUpInside)
        backView.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.right.equalTo(-15)
            make.top.equalTo(15)
            make.height.equalTo(30)
        }
        return button
    }()
    /// 下划线
    private lazy var line: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor.lightGray
        backView.addSubview(line)
        line.snp.makeConstraints { (make) in
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.bottom.equalTo(-2)
            make.height.equalTo(1)
        }
        return line
    }()
    
    
    private lazy var backView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        self.addSubview(view)
        view.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalTo(UIScreen.main.bounds.size.width)
            make.height.greaterThanOrEqualTo(30)
        }
        return view
    }()
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        let _ = backView
        let _ = titleLabel
        
        let _ = subLabel
        
        
        let _ = moreBtn
        let _ = line
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var titleString: String? {
        didSet {
            titleLabel.text = titleString
            subLabel.text = (titleString ?? "")+" 详细阅读"
        }
    }
    
}

extension SectionHeaderView {
    @objc func moreBtn(button: UIButton) -> Void {
        guard let closure = closure else { return }
        closure()
    }
}
