//
//  ViewController.swift
//  22_01_24_TableViewDemo4
//
//  Created by Vishal Jagtap on 29/02/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var menuTableView: UITableView!
    private var menuTableViewCellIdentifier = "MenuTableViewCell"
    var uiNib : UINib?
    var menuTableViewCell : MenuTableViewCell?
    var menuItems : [Menu] = [
        Menu(foodItemImage: UIImage(named: "smaosaImage")!, foodItemTitle: "Samosa", foodItemDescription: "Delicious", foodItemPrice: 20.0),
        Menu(foodItemImage: UIImage(named: "pulavImage")!, foodItemTitle: "Pulav", foodItemDescription: "Spicy", foodItemPrice: 70.0),
        Menu(foodItemImage: UIImage(named: "smaosaImage")!, foodItemTitle: "VadaPav", foodItemDescription: "Tasty", foodItemPrice: 20.0),
        Menu(foodItemImage: UIImage(named: "pulavImage")!, foodItemTitle: "Pohe", foodItemDescription: "Breakfast", foodItemPrice: 25.0)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializationOfTableView()
        registerXIBWithTableView()
    }
    
    func initializationOfTableView(){
        menuTableView.dataSource = self
        menuTableView.delegate = self
    }
    
    func registerXIBWithTableView(){
        uiNib = UINib(nibName: menuTableViewCellIdentifier, bundle: nil)
        self.menuTableView.register(uiNib, forCellReuseIdentifier: menuTableViewCellIdentifier)
    }    
}

//MARK : UITableViewDataSource
extension ViewController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        menuTableViewCell = (self.menuTableView.dequeueReusableCell(withIdentifier: menuTableViewCellIdentifier, for: indexPath) as! MenuTableViewCell)
        menuTableViewCell?.backgroundColor = .systemPink
        menuTableViewCell?.menuItemImage.image = menuItems[indexPath.row].foodItemImage
        menuTableViewCell?.menuItemTitleLabel.text = menuItems[indexPath.row].foodItemTitle
        menuTableViewCell?.menuItemDescriptionLabel.text = menuItems[indexPath.row].foodItemDescription
        menuTableViewCell?.menuItemPriceLabel.text = String(menuItems[indexPath.row].foodItemPrice)
    
        return menuTableViewCell!
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        //check for editing Style
        if editingStyle == .delete{
            menuTableView.beginUpdates()             //to start updating tableview
            menuTableView.deleteRows(at: [indexPath], with: .fade)
            self.menuItems.remove(at: indexPath.row)
            menuTableView.endUpdates()               //to end updating tableview
        }
    }
}

//MARK : UITableViewDelegate
extension ViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 135.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        print(indexPath.row)
    }
}
