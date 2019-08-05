//
//  SeparatorViewController.swift
//  DiscordTableViewSample
//
//  Created by Yamada Shunya on 2019/08/05.
//  Copyright © 2019 Yamada Shunya. All rights reserved.
//

import UIKit

final class SeparatorViewController: UIViewController {
    
    // MARK: IBOutlet
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Properties
    
    private struct Item {
        let title: String
    }
    
    private var isShow: Bool = true {
        didSet {
            // セパレーターの表示、非表示を切り替え
            tableView.tableFooterView = isShow ? nil : UIView()
        }
    }
    private var items: [Item] = [
        Item(title: "Swift"),
        Item(title: "RxSwift"),
        Item(title: "ReSwift"),
        Item(title: "SwiftUI"),
        Item(title: "ReactiveSwift"),
        Item(title: "Flutter")
    ]
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Navigation Bar
        self.navigationItem.title = "Separator"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(tapBarButton(_:)))
        
        // TableView
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(SeparatorTableViewCell.nib, forCellReuseIdentifier: SeparatorTableViewCell.reuseIdentifier)
    }
    
    // MARK: Tap event
    
    @objc func tapBarButton(_ sender: UIBarButtonItem) {
        isShow.toggle()
    }
}

// MARK: TableView dataSource delegate

extension SeparatorViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SeparatorTableViewCell.reuseIdentifier, for: indexPath) as! SeparatorTableViewCell
        cell.setupCell(title: items[indexPath.row].title)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
