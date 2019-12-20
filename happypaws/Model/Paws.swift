//
//  Paws.swift
//  happypaws
//
//  Created by Wahyu Herdianto on 25/07/19.
//  Copyright © 2019 Wahyu Herdianto. All rights reserved.
//

import Foundation

class Paws: NSObject {
    static let shared = Paws()
    
    var loggedin: String = "User"
    var diaryStatus: Int = 1

    struct anjing {
        var name: String
        var gender: String
        var race: String
        var video: String
        var age: Int
        var story: String
        var requirement: String
        var vaccine: String
        var sterile: String
        var doctor: String
        var size: String
        var photo: [String]
    }
    
    var anjings: [anjing] = [
        anjing(name: "Rambo", gender: "Male", race: "Mongrel", video: "https://steventanjung.com/apps/video/Rambo.mp4", age: 7, story: "I was locked in a cage with no food or drink in it which make me suffer from malnutrition. My previous owner didn't want to take care of me. One day I’m rescued. I have a fun personality, love to play with human, I’m also okay with another dog. ", requirement: "I don’t have any special requirement", vaccine: "yes", sterile: "yes", doctor: "Drh. Jati", size: "Big", photo:["rambo1", "rambo2", "rambo3"]),
        
        anjing(name: "Miracle", gender: "Male", race: "Mongrel", video: "https://steventanjung.com/apps/video/Miracle.mp4", age: 11, story: "I was rescued from kenjeran, a place where a lot of dog owners abandoned their pet. I’m a calm and quiet dog, I don’t bark too much. I’m good if you need a companion because I’m not fussy", requirement: "I don’t have any special requirement", vaccine: "yes", sterile: "yes", doctor: "Drh. Jati", size: "Medium", photo:["miracle1", " miracle2", "miracle3"]),
        
        anjing(name: "Sheila", gender: "Female", race: "Canaan", video: "https://steventanjung.com/apps/video/Sheila.mp4", age: 3, story: "I was a stray dog, living in a street alone, one day I rescued. I’m a friendly dog, human loves me because I’m such a heart stealer. but I’m an alpha type, I can’t be near or eat with another dog because I’m gonna bark at them.", requirement: "• Can’t eat with another dog, take a long time to adapt in a new place", vaccine: "yes", sterile: "yes", doctor: "Drh. Jati", size: "Medium", photo:["sheila1", "sheila2", "sheila3"]),
        
        anjing(name: "Bella & Monty", gender: "Male", race: "Terrier Mix", video: "https://steventanjung.com/apps/video/Bella.mp4", age: 3, story: "We were almost sold at dog slaughterhouse to be eaten, but luckily someone rescued us.\nMonti is okay with another dog, fine with human but Bella is afraid of human and always hiding from human.  Monti is always there to take care of Bella and two of them is inseparable", requirement: "• Need adopter who willing to adopt both of them together\n• Need adopter who care deeply and intent to approaching Bella", vaccine: "yes", sterile: "yes", doctor: "Drh. Jati", size: "Medium", photo:["bella1", "bella2", "bella3", "monti1", "monti2", "monti3"]),
        
        anjing(name: "Mimi", gender: "Female", race: "Mongrel", video: "https://steventanjung.com/apps/video/Mimi.mp4", age: 4, story: "I was a stray dog, living in a street alone, one day I rescued. I have a friendly personality with human but since i’m an alpha type, I can’t be near another dog. I love to play with human.", requirement: "• Can’t be with another dog", vaccine: "yes", sterile: "yes", doctor: "Drh. Jati", size: "Medium", photo:["mimi1", "mimi2", "mimi3"]),
        
        anjing(name: "Litto", gender: "Male", race: "Border Collie", video: "https://steventanjung.com/apps/video/Lito.mp4", age: 2, story: "I was found when I was just a little puppy. We were born to be sold, dog seller put me and my other siblings in a box full with our own poopy and even flooded with water which cause one of my sibling died.\nI have a mature personality, nice attitude and okay if you put me near another dog. I’m not fussy. ", requirement: "I don’t have any special requirement", vaccine: "yes", sterile: "yes", doctor: "Drh. Jati", size: "Medium", photo:["lito1", "lito2", "lito3"]),
        
        anjing(name: "Darcy", gender: "Male", race: "Border Collie", video: "https://steventanjung.com/apps/video/Darcy.mp4", age: 2, story: "I was found when I was just a little puppy. We were born to be sold, dog seller put me and my other siblings in a box full with our own poopy and even flooded with water which cause one of my sibling died.\nI’m friendly with human, I love playing with them although sometime I’m afraid and always running away. ", requirement: "I don’t have any special requirement", vaccine: "yes", sterile: "yes", doctor: "Drh. Jati", size: "Medium", photo:["darcy1", "darcy2", "darcy3"])
    ]
    
    
    //TOC
    var tocData_image: [String] = ["Agreement-2", "toc2", "toc3", "toc4", "consequence"]
    var tocData_title: [String] = ["Agreement", "Responsibility", "Commitment", "Let Us Know", "Consequences"]
    var tocData_desc: [String] = ["Adopters must be permitted by all family members that live together in one house and are committed to take care of adopted dogs", "Responsible for food supply, proper place to live, and dogs health", "Will not abandoned, sell or transfer the adopted dogs to the other person for any reason.", "Required to report dogs condition monthly with photo/video. SACC has the right to visit to see the dogs condition.", "Responsible for finding lost dogs. If within 60 days they are not found, adopters must pay Rp 2.500.000 as sanctions.\nSACC also has the right to take back dogs found in improper conditions and publish this discovery to public."]
    
    //Survey
    struct surveyAnswer{
        var _answer1: String
        var _answer2: String
        var _answer3: [String] = []
        var _answer4: String
        var _answer5: String
        var _answer6: String
        var _answer7: String
        var _answer8: [String] = []
    }
    
    var survey: surveyAnswer?
    
    //keyboard options
    var options1: [String] = ["Companion dog","Guard dog","Other"]
    var options2: [String] = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25"]
    var options3: [String] = ["Male", "Female"]
    var options4: [String] = ["Dog Hotel", "Bring dog along", "Close relative house", "Leave the dog at home"]
    var options5: [String] = ["House", "Rented House", "Apartment", "Rented Apartment", "Parent's House"]
    
    //questions
    var questions: [String] = [
        "Does your job require you to move or travel from places to places often?",
        "Have you ever had a pet before?",
        "Do you have pets in your house now?",
        "Do you know about vaccinations for dogs based on age and diseases that often affect dogs?",
        "Are you willing to vaccinated and sterillized your pet?",
        "If a pet becomes ill and needs a lot of maintenance cost, are you still willing to seek treatment for the animal (through medical procedures) ?",
        "What would you do to your pet if you're planning to travel?",
        "What is your current residence status? ",
        "Who would take care of the pet in your house?",
        "House photos"
    ]
    
    //chosen dog
    var chosenDog: anjing?
    
    //diary
    struct diary{
        var date: String?
        var content: String?
        var photo: String?
    }
    
    var diaries: [diary] = []
    var numberOfDiary: Int = 0
    
    func addDiary(_ date: String, _ content: String, _ photo: String){
        diaries.insert(diary(date: date, content: content, photo: photo), at: numberOfDiary)
    }
    
    
}

