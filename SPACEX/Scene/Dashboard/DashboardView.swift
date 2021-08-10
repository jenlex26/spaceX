//
//  DashboardView.swift
//  SPACEX
//
//  Created by Javier Hernandez on 04/08/21.
//  
//

import Foundation
import UIKit

/*
 View: displays what it is told to by the Presenter and relays user input back to the Presenter, the View is passive. It waits for the Presenter to give it content to display.
 
 Use the data sent by the presenter, and display it. Can also pass touch events, but will simply notify the presenter of this, where the work to process the touch takes place. In practice the view sets up the presenter (owns it), and sends messages to the same.
 */

enum ListSection: Int, CaseIterable {
  case launches
}

class DashboardView: UIViewController {
    /*
     Replace UIViewController to UITableViewController or UICollectionViewController if needed
     */

    @IBOutlet weak var tableView: UITableView!
    // MARK: Properties
    var presenter: DashboardViewToPresenterProtocol?
    
    var launches = [LaunchPastQuery.Data.LaunchesPast]()
    var searchController : UISearchController?
    var refreshControl = UIRefreshControl()

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        // Do any aditional setup after loading the view ex: View properties, navigation properties, etc.
        presenter?.getData()
        refreshControl = tableView.internRefreshControl()
        refreshControl.addTarget(self, action: #selector(prepareData), for: .valueChanged)
        tableView.refreshControl = refreshControl
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .automatic
        searchController = UISearchController(searchResultsController: nil)
        searchController?.hidesNavigationBarDuringPresentation = false
        searchController?.definesPresentationContext = true
        searchController?.searchBar.delegate = self
        searchController?.searchResultsUpdater = self
        searchController?.obscuresBackgroundDuringPresentation = false
        searchController?.searchBar.placeholder = "Buscar"
        self.navigationItem.searchController = searchController
    }
    
    @objc func prepareData() {
        presenter?.getData()
        self.refreshControl.endRefreshing()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

extension DashboardView: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let listSection = ListSection(rawValue: section) else {
            assertionFailure("Invalid section")
            return 0
          }
                
          switch listSection {
          case .launches:
            return self.launches.count
          }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!

      guard let listSection = ListSection(rawValue: indexPath.section) else {
        assertionFailure("Invalid section")
        return cell
      }
        
      switch listSection {
      case .launches:
        let launch = self.launches[indexPath.row]
        cell.textLabel?.text = launch.missionName
      }
        
      return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showDetail(itemSelect: launches[indexPath.row])
    }
    
}

extension DashboardView: UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        
        if searchController.searchBar.text!.isEmpty {
            presenter?.getFullData()
        }else{
            presenter?.filterData(searchController.searchBar.text!.lowercased())
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        presenter?.getFullData()
    }
    
}

extension DashboardView: DashboardPresenterToViewProtocol {
    func getLaunches(_ model: [LaunchPastQuery.Data.LaunchesPast]) {
        launches = model
        tableView.reloadData()
    }
    

    func showData(_ model: DashboardResponse) {

//         Example:
//         UILabel.text = model.name

    }
}
