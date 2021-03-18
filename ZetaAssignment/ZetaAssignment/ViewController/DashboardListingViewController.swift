//
//  DashboardListingViewController.swift
//  ZetaAssignment
//
//  Created by Himanshu Rajput on 23/01/21.
//

import UIKit

class DashboardListingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var listingTableView: UITableView!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    var searchKey: String = ""
    private let dashboardVM = DashboardViewModel()
    
    // MARK:- Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpForUI()
        apiCall()
    }
    
    // MARK:- Action
    @IBAction func previousButtonAction(_ sender: UIButton) {
        if let startIdx = dashboardVM.queryModel()?.previousPage?.object(at: 0)?.startIndex {
            apiCallWithIdx(startIdx: startIdx)
        }
    }
    
    @IBAction func nextButtonAction(_ sender: UIButton) {
        if let startIdx = dashboardVM.queryModel()?.nextPage?.object(at: 0)?.startIndex {
            apiCallWithIdx(startIdx: startIdx)
        }
    }
    
    // MARK:- Helper methods
    private func setUpForUI() {
        listingTableView.delegate = self
        listingTableView.dataSource = self
        listingTableView.register(UINib(nibName: AppIdentifierConstant.listingDataCell, bundle: nil), forCellReuseIdentifier: AppIdentifierConstant.listingDataCell)
        self.title = searchKey
    }
    
    private func updateView() {
        if let _ = dashboardVM.queryModel()?.nextPage {
            self.nextButton.isHidden = false
        } else {
            self.nextButton.isHidden = true
        }
        
        if let _ = dashboardVM.queryModel()?.previousPage {
            self.previousButton.isHidden = false
        } else {
            self.previousButton.isHidden = true
        }
    }
    
    private func apiCall() {
        dashboardVM.getSearchData(searchKey: searchKey) { (errorString, isSuccess) in
            if isSuccess ?? true {
                print("success here")
                self.listingTableView.reloadData()
                self.updateView()
            }
        }
    }
    
    private func apiCallWithIdx(startIdx: Int) {
        dashboardVM.getSearchDataWithIdx(searchKey: searchKey, startIndex: startIdx) { (errorString, isSuccess) in
            if isSuccess ?? true {
                print("success here")
                self.listingTableView.reloadData()
                self.updateView()
            }
        }
    }
    
    private func navigateToNextScreen(item: ItemModel) {
        guard let itemDescriptionVC = UIStoryboard(name: AppIdentifierConstant.main, bundle: nil).instantiateViewController(withIdentifier: AppIdentifierConstant.itemDescriptionViewController) as? ItemDescriptionViewController else { return }
        itemDescriptionVC.itemModel = item
        self.navigationController?.pushViewController(itemDescriptionVC, animated: true)
    }
    
    // MARK:- TableView datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dashboardVM.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let customCell = tableView.dequeueReusableCell(withIdentifier: AppIdentifierConstant.listingDataCell, for: indexPath) as? ListingDataCell else {
            return UITableViewCell()
        }
        
        customCell.populateView(with: dashboardVM.itemAtIndex(at: indexPath.row))
        
        return customCell
    }
    
    // MARK:- TableView delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigateToNextScreen(item: dashboardVM.itemAtIndex(at: indexPath.row)!)
    }
}

