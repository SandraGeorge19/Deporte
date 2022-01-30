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

class HomeSportsViewController: UIViewController {
    
    //MARK: -- IBOutlets
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    //MARK: -- Propertiest
    
    let sports : [Sport] = [
        Sport(image: "https://pngimage.net/wp-content/uploads/2018/05/courses-png-6.png", title: "Heloooooooooo"),
        Sport(image: "https://leisure.union.ufl.edu/Content/Images/leisure-courses.png", title: "Love Football"),
        Sport(image: "https://cdn2.iconfinder.com/data/icons/new-year-resolutions/64/resolutions-06-512.png", title: "Sandraaaaa"),
        Sport(image: "https://pngimage.net/wp-content/uploads/2018/05/courses-png.png", title: "Bing Bong"),
        Sport(image: "https://www.pngitem.com/pimgs/m/49-491826_of-course-developing-your-employee-engagement-offering-business.png", title: "Volleyball"),
        Sport(image: "https://png.pngitem.com/pimgs/s/415-4157244_transparent-anime-christmas-png-christmas-tree-png-download.png", title: "Rugby")
    ]
    
    //MARK: -- LifeCycle
    
    //MARK: -- IBActions
    
    //MARK: -- Functions

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func configureCollectionView(){
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        
    }
    
   

}

//MARK: -- Extensions - UICollectionView

extension HomeSportsViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           print("Helloooo from the count")
           return sports.count
       }
       
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           print("Helloooo from the cell")
           let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SportsCollectionViewCell
           cell.sportItem = sports[indexPath.row]
        cell.layer.cornerRadius = 25
        cell.layer.shadowColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 0.5).cgColor
        cell.layer.borderColor = UIColor.darkGray.cgColor
        cell.layer.borderWidth = 1
        cell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        cell.layer.shadowRadius = 5.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = true
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
        cell.layer.backgroundColor = UIColor.clear.cgColor

        cell.contentView.layer.masksToBounds = true
           return cell
           
       }
       
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.view.bounds.width - 48) / 2, height: (self.view.bounds.width - 48) / 2)
       }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let leaguesViewController = storyboard?.instantiateViewController(withIdentifier: "LeaguesTableViewController") as! LeaguesTableViewController
        leaguesViewController.leagues = sports
        
        self.navigationController?.pushViewController(leaguesViewController, animated: true)
    }

}
