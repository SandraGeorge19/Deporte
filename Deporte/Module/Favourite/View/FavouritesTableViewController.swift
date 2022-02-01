//
//  FavouritesTableViewController.swift
//  Deporte
//
//  Created by sandra on 1/28/22.
//  Copyright © 2022 sandra. All rights reserved.
//

import UIKit
import Alamofire

class FavouritesTableViewController: UITableViewController {
    
    //MARK: -- IBOutlets
    
    
    //MARK: -- Propertiest
    let sports : [Sport] = [
           Sport(image: "https://pngimage.net/wp-content/uploads/2018/05/courses-png-6.png", title: "Tennis"),
           Sport(image: "https://leisure.union.ufl.edu/Content/Images/leisure-courses.png", title: "Love Football"),
           Sport(image: "https://cdn2.iconfinder.com/data/icons/new-year-resolutions/64/resolutions-06-512.png", title: "Basketball"),
           Sport(image: "https://pngimage.net/wp-content/uploads/2018/05/courses-png.png", title: "Bing Bong"),
           Sport(image: "https://www.pngitem.com/pimgs/m/49-491826_of-course-developing-your-employee-engagement-offering-business.png", title: "Volleyball"),
           Sport(image: "https://png.pngitem.com/pimgs/s/415-4157244_transparent-anime-christmas-png-christmas-tree-png-download.png", title: "Rugby")
       ]
    //MARK: -- LifeCycle
    override func viewDidLoad() {
           super.viewDidLoad()

           // Uncomment the following line to preserve selection between presentations
           // self.clearsSelectionOnViewWillAppear = false

           // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
           // self.navigationItem.rightBarButtonItem = self.editButtonItem
        func fetchAllSportsData(){
            let url = URL(string: "https://www.thesportsdb.com/api/v1/json/2/all_sports.php")
            Alamofire.request(url!).response { (response) in
                //let jsonResponse = response.data
               debugPrint(response)
                
            }
        }
       }
    
    //MARK: -- IBActions
    
    //MARK: -- Functions

   
}

extension FavouritesTableViewController{
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return sports.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FavTableViewCell

        // Configure the cell...
        cell.sportItem = sports[indexPath.row]
        
        //print(sports[indexPath.row].title ?? "")
        //print("HElOooooooooo")

        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 108
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
