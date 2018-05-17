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
    
    func downloadPokemonDetails(completed : DownloadComplete)
    {
        Alamofire.request(_pokemonURL).responseJSON(completionHandler: {(response) in
            
        
           if let dict = response.result.value as? Dictionary<String,AnyObject>
            {
                print("dict value\(dict["objects"])")
                 let values = dict["objects"] as? NSMutableArray
                print("values \(values![0])")
            if let objects = dict["objects"] as? Dictionary<String,AnyObject>
            {
                print("obj value \(objects["weight"])")
                print(objects)
//                self._weight = weight
//                print("weight value \(weight)")
              //if let value = objects[0] as? Dictionary<String,AnyObject>
//              {
//                print(" value \(value)")
//                if let weight = value["weight"] as? String
//                {
//                    self._weight = weight
//                    print("weight value \(weight)")
//                }
//
//                }
                
                }
                
                
            }
            
            })
        
    }
        
    }

