//
//  DetailView.swift
//  SPACEX
//
//  Created by Javier Hernandez on 06/08/21.
//  
//

import Foundation
import UIKit

/*
 View: displays what it is told to by the Presenter and relays user input back to the Presenter, the View is passive. It waits for the Presenter to give it content to display.
 
 Use the data sent by the presenter, and display it. Can also pass touch events, but will simply notify the presenter of this, where the work to process the touch takes place. In practice the view sets up the presenter (owns it), and sends messages to the same.
 */

class DetailView: UIViewController {
    /*
     Replace UIViewController to UITableViewController or UICollectionViewController if needed
     */
    
    @IBOutlet var tableView: UITableView!

    // MARK: Properties
    var presenter: DetailViewToPresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        
        // Do any aditional setup after loading the view ex: View properties, navigation properties, etc.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

extension DetailView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { // aqui se maneja el tamaño de la tabla dentro de la celda
        switch indexPath.row {
        case 0:
            return 67
        case 1:
            return 67
        case 2:
            return 67
        case 3:
            if presenter?.itemSelect?.links?.articleLink != nil {
                return 67
            }else{
                return 0
            }
        case 4:
            if presenter?.itemSelect?.links?.videoLink != nil {
                return 67
            }else{
                return 0
            }
        case 5:
            if presenter?.itemSelect?.ships?.count != 0 {
                return 300
            }else{
                return 0
            }
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "titleBodyCell") as! titleBodyCell
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "titleBodyCell") as! titleBodyCell
            cell.titleLbl.text = "Lugar de lanzamiento"
            cell.bodyLbl.text  = presenter?.itemSelect?.launchSite?.siteNameLong
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "titleBodyCell") as! titleBodyCell
            cell.titleLbl.text = "Fecha de lanzamiento"
            cell.bodyLbl.text  = presenter?.itemSelect?.launchDateLocal
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "titleBodyCell") as! titleBodyCell
            cell.titleLbl.text = "Nombre de cohete"
            cell.bodyLbl.text  = presenter?.itemSelect?.rocket?.rocketName
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "titleBodyCell") as! titleBodyCell
            cell.titleLbl.text = "articulos relacionados"
            cell.bodyLbl.isHidden = true
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "titleBodyCell") as! titleBodyCell
            cell.titleLbl.text = "videos relacionados"
            cell.bodyLbl.isHidden = true
            return cell
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: "socialNetworksCell") as! socialNetworksCell
            cell.titleLbl.isHidden = false
            cell.awakeFromNib()
            cell.dataShips = presenter?.itemSelect
            cell.reloadCollection()
            tableView.reloadRows(at: [IndexPath(row: 7, section: 0)], with: .automatic)
            return cell
        default:
            print("")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 3:
            let instagramHooks = presenter?.itemSelect?.links?.articleLink ?? ""
            let instagramUrl = NSURL(string: instagramHooks)
            if UIApplication.shared.canOpenURL(instagramUrl! as URL) {
                UIApplication.shared.openURL(instagramUrl! as URL)
            } else {
                UIApplication.shared.openURL(NSURL(string: presenter?.itemSelect?.links?.articleLink ?? "")! as URL)
            }
        case 4:
            let instagramHooks = presenter?.itemSelect?.links?.videoLink ?? ""
            let instagramUrl = NSURL(string: instagramHooks)
            if UIApplication.shared.canOpenURL(instagramUrl! as URL) {
                UIApplication.shared.openURL(instagramUrl! as URL)
            } else {
                UIApplication.shared.openURL(NSURL(string: presenter?.itemSelect?.links?.videoLink ?? "")! as URL)
            }

        default:
            print("")
        }
        return
    
    }
}
    


extension DetailView: DetailPresenterToViewProtocol {

    func showData(_ model: DetailResponse) {

//         Example:
//         UILabel.text = model.name

    }
}
