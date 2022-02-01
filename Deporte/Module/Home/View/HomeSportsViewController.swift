//
//  HomeSportsViewController.swift
//  Deporte
//
//  Created by sandra on 1/28/22.
//  Copyright © 2022 sandra. All rights reserved.
//

import UIKit
import Kingfisher
import Alamofire

protocol HomeProtocol : AnyObject{
    func updatingCollectionView()
}

class HomeSportsViewController: UIViewController ,HomeProtocol{
    
    //MARK: -- IBOutlets
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    //MARK: -- Propertiest
    
    let myIndicator = UIActivityIndicatorView(style: .large)
    var homePresenter : HomePresenter!
    
    //MARK: -- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        
        startIndicator()
        
        initializeHomePresenterAndGetData()
        
    }
    
    //MARK: -- IBActions
    
    //MARK: -- Functions
    
    func configureCollectionView(){
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        
    }
    
    func startIndicator(){
        myIndicator.center = self.view.center
        self.view.addSubview(myIndicator)
        myIndicator.startAnimating()
    }
    func initializeHomePresenterAndGetData(){
        homePresenter = HomePresenter(networkService: NetworkServices())
        homePresenter.attachView(homeView: self)
        homePresenter.getAllSports()
    }
    
    func updatingCollectionView() {
        self.myCollectionView.reloadData()
        myIndicator.stopAnimating()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

//MARK: -- Extensions - UICollectionView

extension HomeSportsViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(homePresenter.mysports.count)
          return homePresenter.mysports.count
       }
       
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           //print("Helloooo from the cell")
           let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SportsCollectionViewCell
        cell.sportItem = homePresenter.mysports[indexPath.row]
           return cell
           
       }
       
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.view.bounds.width - 48) / 2, height: (self.view.bounds.width + 20) / 2)
       }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let leaguesViewController = storyboard?.instantiateViewController(withIdentifier: "LeaguesTableViewController") as! LeaguesTableViewController
        leaguesViewController.leagues = homePresenter.mysports
        
        self.navigationController?.pushViewController(leaguesViewController, animated: true)
    }

}
