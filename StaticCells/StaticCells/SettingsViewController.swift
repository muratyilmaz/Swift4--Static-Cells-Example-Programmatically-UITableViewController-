//
//  SettingsViewController.swift
//  StaticCells
//
//  Created by test on 19/12/2017.
//  Copyright © 2017 Grey. All rights reserved.
//

import UIKit

class SettingsViewController: UITableViewController {
    
    lazy var userLoginCell: UITableViewCell = {
        return self.makeCell("Kullanıcı Girişi")
    }()
    
    lazy var myTeamCell: UITableViewCell = {
        return self.makeCell("Takımım", detailText: "Galatasaray")
    }()
    
    lazy var autoUpdateCell: UITableViewCell = {
        return self.makeCell("Otomatik Güncelleme", detailText: "30 sn")
    }()
    
    lazy var contactUsCell: UITableViewCell = {
        return self.makeCell("Bize Ulaşın")
    }()
    
    lazy var termsCell: UITableViewCell = {
        return self.makeCell("Kullanım Koşulları")
    }()
    
    lazy var privacyCell: UITableViewCell = {
        return self.makeCell("Gizlilik Politikası")
    }()
    
    lazy var versionCell: UITableViewCell = {
        return self.makeCell("Version", detailText: "1.182 b160", accessoryType: .none)
    }()
    
    override func loadView() {
        super.loadView()
        self.title = "Settings"
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
        // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0,1: return 3
        case 2: return 1
        default:
            fatalError("Unknown number of sections")
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            
            switch indexPath.row {
            case 0: return userLoginCell
            case 1: return myTeamCell
            case 2: return autoUpdateCell
            default: fatalError("Unknown row in section 0")
            }
            
        case 1:
            switch indexPath.row {
            case 0: return contactUsCell
            case 1: return termsCell
            case 2: return privacyCell
            default: fatalError("Unknown row in section 0")
            }
            
        case 2:
            return versionCell
            
        default:
            fatalError("unknown section")
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 2 && indexPath.row == 0 {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let space = section == 0 ? CGFloat.leastNormalMagnitude : 16
        return space
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView(frame: .zero)
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView(frame: .zero)
    }
    
}

extension SettingsViewController {
    private func makeCell(_ text: String, detailText: String? = nil, accessoryType: UITableViewCellAccessoryType = .disclosureIndicator) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: nil)
        cell.accessoryType = accessoryType
        cell.textLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        cell.textLabel?.text = text
        if let dtext = detailText {
            cell.detailTextLabel?.text = dtext
        }
        return cell
    }
}

