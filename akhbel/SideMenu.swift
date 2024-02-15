//
//  SideMenu.swift
//  akhbel
//
//  Created by Ezgi on 15.02.2024.
//

import Foundation
import UIKit
protocol MenuControllerDelegate{
    func didSelectMenuItem(named: SideMenuItem)
}

enum SideMenuItem: String, CaseIterable {
    case home = "Ana Sayfa"
    case info = "Bilgiler"
    case setting = "Ayarlar"
    case newsp = "Haberler"
    
}

class MenuController: UITableViewController {

    public var delegate: MenuControllerDelegate?
    private let menuItems: [SideMenuItem]
    init(with menuItems: [SideMenuItem]) {
        self.menuItems = menuItems
        super.init(nibName: nil, bundle: nil)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .darkGray
        view.backgroundColor = .darkGray
        tableView.backgroundColor = .darkGray
            view.backgroundColor = .darkGray
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return menuItems.count
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = menuItems[indexPath.row].rawValue
        
        //cell içindeki textlerin rengi
           if #available(iOS 13.0, *) {
               // iOS 13 ve sonrası için, sistem temasına göre metin rengini belirle
               let dynamicColor = UIColor { traitCollection in
                   // Sistem temasını kontrol et (koyu ya da açık mod)
                   return traitCollection.userInterfaceStyle == .dark ? .white : .black
               }
               // Menü öğelerinin metin rengini belirle
               cell.textLabel?.textColor = dynamicColor
           } else {
               // iOS 12 ve önceki sürümler için, varsayılan olarak beyaz metin rengini kullan
               cell.textLabel?.textColor = .white
           }
       //backcolor (hücrenin)
        if #available(iOS 13.0, *) {
                    // iOS 13 ve sonrası için, sistem temasına göre arka plan rengini belirle
                    let dynamicBackgroundColor = UIColor { traitCollection in
                        // Sistem temasını kontrol et (koyu ya da açık mod)
                        if traitCollection.userInterfaceStyle == .dark {
                            // Koyu modda beige rengi yerine açık gri bir renk kullan
                            return .lightGray
                        } else {
                            // Açık modda beige rengi kullan
                            return UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0)

                        }
                    }
                    // Arka plan rengini belirle
                    cell.backgroundColor = dynamicBackgroundColor.withAlphaComponent(0.3)
                } else {
                    // iOS 12 ve önceki sürümler için, varsayılan olarak siyah arka plan rengini kullan
                    cell.backgroundColor = UIColor.clear.withAlphaComponent(0.3)
                }
        return cell
        
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
            super.viewDidLoad()
            tableView.backgroundColor = .darkGray
            view.backgroundColor = .darkGray
            // TableView'in altındaki ayırıcı çizgileri etkinleştir
            tableView.separatorStyle = .singleLine
            tableView.separatorColor = .lightGray
            tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0) // Opsiyonel: çizgi girintisini ayarlar

            // Hücreler arasında separator (ayırıcı) çizgi eklemek için
            tableView.separatorStyle = .singleLine
            tableView.separatorColor = .lightGray
        let selectedItem = menuItems[indexPath.row]
        delegate?.didSelectMenuItem(named: selectedItem) //17.03
        
        }

    }


