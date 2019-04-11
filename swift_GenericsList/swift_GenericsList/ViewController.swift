//
//  ViewController.swift
//  swift_GenericsList
//
//  Created by pm on 2019/4/11.
//  Copyright © 2019 pm. All rights reserved.
//

import UIKit

class BaseTableViewController<T: BaseCell<U>, U>: UITableViewController{
    let cellId = "cellId"
    var items = [U]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(T.self, forCellReuseIdentifier: cellId)
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! BaseCell<U>
        cell.item = items[indexPath.row]
        return cell
    }

}

class BaseCell<U>: UITableViewCell {
    var item  : U!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// 其他单元格
class StringCell: BaseCell<String> {
    
}



// 数据Model
struct Dog {
    var name: String
}


// 视图Cell
class DogCell: BaseCell<Dog> {

    override var item: Dog! {
        didSet{
            textLabel?.text = item.name
        }
    }
}


// 控制器
class ViewController: BaseTableViewController<DogCell, Dog> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        items = [
            Dog(name: "Woof  Woof  Woof"),
            Dog(name: "Wang  Wang  Wang")
        ]
    }
}





