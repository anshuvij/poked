//
//  PokeCell.swift
//  Pokedex
//
//  Created by Administrator on 15/05/18.
//  Copyright © 2018 Anshu Vij. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbImage : UIImageView!
    @IBOutlet weak var nameLabel : UILabel!
    
    var pokemon : Pokemon!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = 5.0
    }
    
    func configureCell(pokemon: Pokemon)
    {
        self.pokemon = pokemon
        nameLabel.text = self.pokemon.name.capitalized
        thumbImage.image = UIImage(named: "\(self.pokemon.pokedexId)")
        
    }
    
}
