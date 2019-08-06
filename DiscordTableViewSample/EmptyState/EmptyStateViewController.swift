//
//  EmptyStateViewController.swift
//  DiscordTableViewSample
//
//  Created by Yamada Shunya on 2019/08/06.
//  Copyright © 2019 Yamada Shunya. All rights reserved.
//

import UIKit

final class EmptyStateViewController: UIViewController {
    
    // MARK: IBOutlet
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Properties
    
    private struct Item {
        let image: UIImage?
        let title: String
        let desc: String
        let number: Int
    }
    private let testItems: [Item] = [
        Item(image: UIImage(named: "dish1"), title: "Sample Dish One", desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit XD Morbi ligula lacus.", number: 300),
        Item(image: UIImage(named: "dish2"), title: "Sample Dish Two", desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit :) Morbi ligula lacus.", number: 5300),
        Item(image: UIImage(named: "dish3"), title: "Sample Dish Three", desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit ;) Morbi ligula lacus.", number: 500),
        Item(image: UIImage(named: "dish4"), title: "Sample Dish Four", desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit :( Morbi ligula lacus.", number: 1200)
    ]
    
    private var isEmpty: Bool = true
    private var items: [Item] = [Item]() {
        didSet {
            tableView.setEmptyView(itemCount: items.count,
                                   separatorStyle: .singleLine,
                                   title: "Sorry, Empty ...",
                                   message: "There are no items :(\n Please tap refresh button !")
            tableView.reloadData()
        }
    }
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Navigation Bar
        self.navigationItem.title = "Empty State"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(tapBarButton(_:)))
        
        // TableView
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorInset = .zero
        tableView.tableFooterView = UIView()
        tableView.rowHeight = EmptyStateTableViewCell.rowHeight
        tableView.register(EmptyStateTableViewCell.nib, forCellReuseIdentifier: EmptyStateTableViewCell.reuseIdentifier)
        
        items = []
    }
    
    // MARK: Tap event
    
    @objc func tapBarButton(_ sender: UIBarButtonItem) {
        isEmpty.toggle()
        items = isEmpty ? [] : testItems
    }
}

// MARK: TableView dataSource, delegate

extension EmptyStateViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EmptyStateTableViewCell.reuseIdentifier, for: indexPath) as! EmptyStateTableViewCell
        let item = items[indexPath.row]
        cell.setupCell(image: item.image, title: item.title, desc: item.desc, number: item.number)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
