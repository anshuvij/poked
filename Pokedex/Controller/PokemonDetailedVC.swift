//
//  PokemonDetailedVC.swift
//  Pokedex
//
//  Created by Administrator on 15/05/18.
//  Copyright © 2018 Anshu Vij. All rights reserved.
//

import UIKit

class PokemonDetailedVC: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    var pokemon : Pokemon!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nameLabel.text = pokemon.name
    }

   
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
