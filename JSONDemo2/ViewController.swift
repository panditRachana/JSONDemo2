//
//  ViewController.swift
//  JSONDemo2
//
//  Created by Rachana Pandit on 19/11/22.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {
    @IBOutlet weak var tblUserData:UITableView!
    
    var arrayUserData  = [Data]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchingDataFromAPI()
        tableViewDataSourceAndDelegate()
        registerXib()
    }

    func registerXib()
    {
        let nibName = UINib(nibName: "CellData", bundle: nil)
        tblUserData.register(nibName, forCellReuseIdentifier: "CellData")
    }
    
    func tableViewDataSourceAndDelegate()
    {
        tblUserData.delegate = self
        tblUserData.dataSource = self
    }
    
    func fetchingDataFromAPI()
    {
       let urlString = "https://reqres.in/api/users?page=2"
       let url =  URL(string: urlString)
       var request = URLRequest(url: url!)
       request.httpMethod = "GET"
        let session = URLSession(configuration: .default)
        
        var dataTask = session.dataTask(with: request) { data, response, error in
         print(response)
            
            let getJsonObject = try! JSONSerialization.jsonObject(with: data!) as! [String:Any]
       
        var dataArrayFromJson = NSArray()
            
        dataArrayFromJson = getJsonObject["data"] as! NSArray
        print(dataArrayFromJson)
                
        for dictionary in dataArrayFromJson
        {
            let eachDictionary = dictionary as! [String:Any]
            print(eachDictionary)
            let userId = eachDictionary["id"] as! Int
            let userEmail = eachDictionary["email"] as! String
            let userFirstName = eachDictionary["first_name"] as! String
            let userLastName = eachDictionary["last_name"] as! String
            let userAvatar = eachDictionary["avatar"] as! String
            
            self.arrayUserData.append(Data(id: userId, email: userEmail, FirstName: userFirstName, lastName: userLastName, avatar: userAvatar))
        }
            DispatchQueue.main.async {
            self.tblUserData.reloadData()
            }
      }
        dataTask.resume()
   }
}

extension ViewController:UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arrayUserData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tblUserData.dequeueReusableCell(withIdentifier: "CellData", for: indexPath) as! CellData
        cell.lblId.text = String(self.arrayUserData[indexPath.row].id)
        cell.lblFirstName.text = self.arrayUserData[indexPath.row].FirstName
        
        let imgUrl = NSURL(string: self.arrayUserData[indexPath.row].avatar)
        cell.imgAvatar.sd_setImage(with: imgUrl as URL?)
        return cell
    }
}
extension ViewController:UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let secondVC = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        secondVC.id = arrayUserData[indexPath.row].id
        secondVC.email =  arrayUserData[indexPath.row].email
        secondVC.firstName = arrayUserData[indexPath.row].FirstName
        secondVC.lastName = arrayUserData[indexPath.row].lastName
        secondVC.imgUrl = arrayUserData[indexPath.row].avatar
        
        navigationController?.pushViewController(secondVC, animated: true)
    }
  
}
