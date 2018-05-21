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
    
    @IBOutlet var mainImg: UIImageView!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var typrLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var pokedexLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var attackLbl: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    
    @IBOutlet weak var nextEvoImg: UIImageView!
    @IBOutlet weak var evoLbl: UILabel!
    
    
    
    
    var pokemon : Pokemon!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nameLabel.text = pokemon.name.capitalized
        let img = UIImage(named : "\(pokemon.pokedexId)")
        mainImg.image = img
        currentEvoImg.image = img
        pokedexLbl.text = "\(pokemon.pokedexId)"
            
        pokemon.downloadPokemonDetails(completed:
            {
                print("did arrive here")
                // whatever will be called after network call completed
                self.updateUI()
        })
    }

    func updateUI()
    {
        attackLbl.text = pokemon.attack
        defenseLbl.text = pokemon.defense
        heightLbl.text = pokemon.height
        weightLbl.text = pokemon.weight
        typrLbl.text =  pokemon.type
        descLbl.text = pokemon.description
        
        if pokemon.nextEvoId == ""
        {
            evoLbl.text = "No Evolutions"
            nextEvoImg.isHidden = true
        } else {
            nextEvoImg.isHidden = false
            nextEvoImg.image = UIImage(named: pokemon.nextEvoId)
            let str = "Next Evolution \(pokemon.nextEvoName) - LVL \(pokemon.nextEvoLevel)"
        }
        
    }
   
    @IBAction func bckButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
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
