//
//  DashboardViewController.swift
//  ZetaAssignment
//
//  Created by Himanshu Rajput on 23/01/21.
//

import UIKit

class DashboardViewController: UIViewController {
    var dashboardVM = DashboardViewModel()
    @IBOutlet weak var titleLbl: UILabel! {
        didSet {
            titleLbl.text = AppConstantStrings.dashboardVcTitleLbl
        }
    }
    
    @IBOutlet weak var searchButton: UIButton! {
        didSet {
            searchButton.setTitle(AppConstantStrings.dashboardVcSearchButton, for: .normal)
        }
    }
    
    @IBOutlet weak var searchTextField: UITextField! {
        didSet {
            searchTextField.placeholder = AppConstantStrings.dashboardVcSearchTextfield
        }
    }
    
    // MARK:- Actions
    @IBAction func searchButtonAction(_ sender: UIButton) {
        if let searchKey = searchTextField.text, searchKey.count > 0 {
            print(searchKey)
            navigateToNextScreen(searchKey: searchKey)
        } else {
            showAlert()
        }
    }
    
    // MARK:- Helper Methods
    private func showAlert() {
        let alert = UIAlertController(title: AppConstantStrings.dashboardAlertTitle, message: AppConstantStrings.dashboardAlertMessage, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: AppConstantStrings.okText, style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func navigateToNextScreen(searchKey: String) {
        guard let dashboardListingVC = UIStoryboard(name: AppIdentifierConstant.main, bundle: nil).instantiateViewController(withIdentifier: AppIdentifierConstant.dashboardListingViewController) as? DashboardListingViewController else { return }
        dashboardListingVC.searchKey = searchKey
        self.navigationController?.pushViewController(dashboardListingVC, animated: true)
    }
}
