//
//  PokedexViewController.swift
//  Pokemon jr.
//
//  Created by Marc Streeter on 5/9/17.
//  Copyright © 2017 Developer Warriors. All rights reserved.
//

import UIKit

class PokedexViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
    var caughtPokemons : [Pokemon] = []
    var uncaughtPokemons : [Pokemon] = []

    override func viewDidLoad() {
        super.viewDidLoad()

      
               
      caughtPokemons = getAllCaughtPokemons()
      uncaughtPokemons = getAllUncaughtPokemons()
        
        
    tableView.delegate = self
    tableView.dataSource = self
       
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
          return "CAUGHT"
            
        } else {
         return "UNCAUGHT"
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
        return caughtPokemons.count
        } else {
            return uncaughtPokemons.count
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let pokemon : Pokemon
        if indexPath.section == 0 {
             pokemon = caughtPokemons[indexPath.row]
            
        } else {
          pokemon = uncaughtPokemons[indexPath.row]
        }
        
        
        let cell = UITableViewCell()
        cell.textLabel?.text = pokemon.name
        cell.imageView?.image = UIImage(named: pokemon.imageName!)
        
        return cell
    }
    
    
    
    
    
    
    
    
    @IBAction func mapTapped(_ sender: Any) {
    
    dismiss(animated: true, completion: nil)
        
    }
    
    
    
}
