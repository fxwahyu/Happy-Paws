//
//  DiaryViewController.swift
//  happypaws
//
//  Created by Wahyu Herdianto on 13/08/19.
//  Copyright © 2019 Wahyu Herdianto. All rights reserved.
//

import UIKit

class DiaryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var diaryList: UITableView!
    @IBOutlet weak var noDog: UILabel!
    var adoptionStatus: Int = Paws.shared.diaryStatus
    var anjing = Paws.shared.chosenDog
    //1 for havent adopted
    //2 for survey
    //3 for completing online form (4)
    //4 for already adopted -> go to diary
    
    override func viewDidLoad() {
        super.viewDidLoad()
        diaryList.delegate = self
        diaryList.dataSource = self
        self.diaryList.rowHeight = 134
        if adoptionStatus == 1 {
           noDog.isHidden = false
            diaryList.isHidden = true
        } else{
            noDog.isHidden = true
            diaryList.isHidden = false
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavBar()
    }
    
    func setupNavBar(){
        let nav = self.navigationController?.navigationBar
        nav?.prefersLargeTitles = true
        nav?.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        nav?.setBackgroundImage(UIImage(), for: .default)
        nav?.shadowImage = UIImage()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "diaryList", for: indexPath) as! DiaryListTableViewCell
        if adoptionStatus == 4{
            cell.done()
        } else {
            cell.notDone()
        }
        
        if adoptionStatus == 2{ //survey 3
            cell.progres.image = UIImage(named: "3")
        } else if adoptionStatus == 3{ //survey 4
            cell.progres.image = UIImage(named: "4")
        }
        
        if adoptionStatus == 1{
            
        } else{
            cell.photo.image = UIImage(named: (anjing?.photo[0])!)
            cell.nama.text = anjing?.name
            cell.desc.text = "\(anjing!.age) Yrs • \(anjing!.race) • \(anjing!.gender)"
            cell.adopted.text = "Adopted \(getDate())"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if adoptionStatus == 4{
            let viewController = storyboard?.instantiateViewController(withIdentifier: "pawsDiary") as! PawsDiaryViewController
            self.navigationController?.pushViewController(viewController, animated: true)
        } else {
            let viewController = storyboard?.instantiateViewController(withIdentifier: "onlineForm") as! OnlineFormViewController
            self.navigationController?.pushViewController(viewController, animated: true)
        }
        
    }
    
    func getDate()->String{
        let date = Date()
        let calendar = Calendar.current
        let day = calendar.component(.day, from: date)
        let month = calendar.component(.month, from: date)
        let year = calendar.component(.year, from: date)
        return "\(getMonth(month)) \(getDay(day)) \(String(year))"
    }
    
    func getMonth(_ month: Int)->String{
        if month == 1{
            return "January"
        } else if month == 2{
            return "February"
        } else if month == 3{
            return "March"
        } else if month == 4{
            return "April"
        } else if month == 5{
            return "May"
        } else if month == 6{
            return "June"
        } else if month == 7{
            return "July"
        } else if month == 8{
            return "August"
        } else if month == 9{
            return "September"
        } else if month == 10{
            return "October"
        } else if month == 11{
            return "November"
        } else if month == 12{
            return "December"
        }
        return "Error"
    }
    
    func getDay(_ day: Int)->String{
        if day == 1{
            return "1st"
        } else if day == 2{
            return "2nd"
        } else if day == 3{
            return "3rd"
        } else {
            return "\(day)th"
        }
    }

}
