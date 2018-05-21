//
//  Pokemon.swift
//  Pokedex
//

//  Created by Anshu Vij on 05/05/18.


//  Copyright © 2018 Anshu Vij. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon
{
    private var _name : String!
    private var _pokedexId : Int!
    private var _description : String!
    private var _type : String!
    private var _defense : String!
    private var _height : String!
    private var _weight : String!
    private var _attack : String!
    private var _nextEvoText : String!
    private var _pokemonURL : String!
    private var _nextEvoName : String!
    private var _nextevoId : String!
    private var _nextEvoLevel : String!
   
     var nextEvolutionText : String
    
    {
        if _nextEvoText == nil
        {
            _nextEvoText = ""
        }
        return _nextEvoText
    }
    
    var attack : String
    {
        if _attack == nil{
            _attack = ""
        }
        return _attack
    }
    var weight : String
    {
        if _weight == nil
        {
            _weight = ""
        }
        return _weight
    }
    var height : String
    {
        if _height == nil
        {
            _height = ""
        }
        return _height
    }
    var defense : String
    {
        if _defense == nil
        {
            _defense = ""
        }
        return _defense
    }
    
    var type : String
    {
        if _type == nil
        {
            _type = ""
        }
        return _type
    }
    var description : String
    {
        if _description == nil {
            _description = ""
        }
        return _description
    }
    var nextEvoName : String
    {
        if _nextEvoName == nil
        {
            _nextEvoName = ""
        }
        return _nextEvoName
    }
    var nextEvoId : String
    {
        if _nextevoId == nil
        {
            _nextevoId = ""
        }
        return _nextevoId
    }
    var nextEvoLevel : String
    {
        if _nextEvoLevel == nil
        {
            _nextEvoLevel = ""
        }
        return _nextEvoLevel
    }
    
    var name : String {
        return _name
    }
    var pokedexId : Int
    {
        return _pokedexId
    }
    
    
    init(name: String, pokedexId: Int) {
        self._name = name
        self._pokedexId = pokedexId
        self._pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(self.pokedexId)"
    }
    
    func downloadPokemonDetails(completed : @escaping DownloadComplete)
    {
        print(_pokemonURL)
        Alamofire.request(_pokemonURL).responseJSON {(response) in
            
        
           if let dict = response.result.value as? Dictionary<String,AnyObject>
            {
                print("dict value\(String(describing: dict["objects"]))")
               // print("dict value\(String(describing: dict["objects"]))")
                
                 let values = dict["objects"] as? [Dictionary<String,AnyObject>]
//                print("values \(String(describing: values))")
//                 print(values![0] as Dictionary<String,AnyObject>)
//
               
            if let objects = values![0] as? Dictionary<String,AnyObject>
            {
              // print("obj value \(String(describing: objects["weight"]))")
                if let weight = objects["weight"] as? String
                {
                
                self._weight = weight
                }
                if let height = objects["height"] as? String
                {
                    
                    self._height = height
                }
                if let attack = objects["attack"] as? Int
                {
                    
                    self._attack = "\(attack)"
                }
                
                if let defense = objects["defense"] as? Int
                {
                    self._defense = "\(defense)"
                }
                 print(self._weight)
                 print(self._height)
                 print(self._attack)
                 print(self._defense)
                
                
                if let types = objects["types"] as? [Dictionary<String,String>], types.count > 0
                {
                    if let name = types[0]["name"]
                    {
                        self._type = name.capitalized
                    }
                    
                    if types.count > 0
                    {
                        for x in 1..<types.count
                        {
                            if let name = types[x]["name"]
                            {
                            self._type! += "/\(name.capitalized)"
                            }
                        }
                    }
                    print(self._type)
                }
                else
                {
                    self._type = ""
                }
                
                if let descArr = objects["descriptions"] as? [Dictionary<String,String>] , descArr.count > 0
                {
                    if let url = descArr[0]["resource_uri"]
                    {
                       
                        let descURL = "\(URL_BASE)\(url)"
                        
                        Alamofire.request(descURL).responseJSON(completionHandler: { (response) in
                            
                            if let descDict = response.result.value as? Dictionary<String,AnyObject>
                            {
                                if let description =  descDict["description"] as? String
                                {
                                    let newDescription = description.replacingOccurrences(of: "POKMON", with: "Pokemon")
                                    print(newDescription)
                                    self._description = newDescription
                                }
                            }
                            completed()
                        })
                    }
                }
                else
                {
                    self._description = ""
                }
                if let evolutions = objects["evolutions"] as? [Dictionary<String,AnyObject>], evolutions.count>0
                {
                    if let nextEvo = evolutions[0]["to"] as? String
                    {
                        if nextEvo.range(of: "mega") == nil
                        {
                            self._nextEvoName = nextEvo
                            if let uri = evolutions[0]["resource_uri"] as? String
                            {
                                let newStr = uri.replacingOccurrences(of: "/api/v1/pokemon/", with: "")
                                let nextEvoId = newStr.replacingOccurrences(of: "/", with: "")
                                
                                self._nextevoId = nextEvoId
                                
                                if let lvlExist = evolutions[0]["level"]
                                {
                                    if let level = lvlExist as? Int
                                    {
                                        self._nextEvoLevel = "\(level)"
                                    }
                                    
                                }
                                else
                                {
                                    self._nextEvoLevel = ""
                                }
                            }
                        }
                    }
                }
                
                print(self._nextEvoLevel)
                print(self._nextevoId)
                print(self._nextEvoName)
                }
                
                
                
                
            }
             completed()
            }
       
        
    }
        
    }

