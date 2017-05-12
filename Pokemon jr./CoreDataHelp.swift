//
//  CoreDataHelp.swift
//  Pokemon jr.
//
//  Created by Marc Streeter on 5/9/17.
//  Copyright © 2017 Developer Warriors. All rights reserved.
//

import UIKit
import CoreData

func addAllPokemon() {

    
  createPokemon(name: "Mew", imageName: "mew")
  createPokemon(name: "Mankey", imageName: "mankey")
  createPokemon(name: "Pidgey", imageName: "pidgey")
  createPokemon(name: "Pikachu", imageName: "pikachu")
  createPokemon(name: "Psyduck", imageName: "psyduck")
  createPokemon(name: "Rattata", imageName: "rattata")
  createPokemon(name: "Meowth", imageName: "meowth")
  createPokemon(name: "Charmander", imageName: "charmander")
  createPokemon(name: "Eevee", imageName: "eevee")
  createPokemon(name: "Jigglypuff", imageName: "jigglypuff")
  createPokemon(name: "Weedle", imageName: "weedle")
  createPokemon(name: "Dratini", imageName: "dratini")
  createPokemon(name: "Zubat", imageName: "zubat")
  createPokemon(name: "Bullbasaur", imageName: "bullbasaur")
  createPokemon(name: "Venonat", imageName: "venonat")
  createPokemon(name: "Caterpie", imageName: "caterpie")
  createPokemon(name: "Bellsprout", imageName: "bellsprout")
  createPokemon(name: "Abra", imageName: "abra")

    
    
  (UIApplication.shared.delegate as! AppDelegate).saveContext()
    
}

func createPokemon(name:String,imageName: String) {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let pokemon = Pokemon(context: context)
    
    pokemon.name = name
    pokemon.imageName = imageName
 
}



func getAllPokemon() -> [Pokemon] {
   
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    do {
              let pokemons = try context.fetch(Pokemon.fetchRequest()) as! [Pokemon]
        
        if pokemons.count == 0 {
            addAllPokemon()
            return getAllPokemon()
        }
        
        return pokemons
       
    } catch {}
  
   return[]


}

func getAllCaughtPokemons() -> [Pokemon] {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let fetchRequest = Pokemon.fetchRequest() as NSFetchRequest<Pokemon>
    
    fetchRequest.predicate = NSPredicate(format: "caught == %@", true as CVarArg)
    
    do {
             let pokemons = try context.fetch(fetchRequest) as! [Pokemon]
             return pokemons
    } catch {}
    return []
}

func getAllUncaughtPokemons() -> [Pokemon] {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let fetchRequest = Pokemon.fetchRequest() as NSFetchRequest<Pokemon>
    
    fetchRequest.predicate = NSPredicate(format: "caught == %@", false as CVarArg)
    
    do {
        let pokemons = try context.fetch(fetchRequest) as! [Pokemon]
        return pokemons
    } catch {}
    return []
 
}




