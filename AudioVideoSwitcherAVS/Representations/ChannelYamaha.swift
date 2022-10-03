//
//  ChannelYamaha.swift
//  AudioVideoSwitcherAVS
//
//  Created by Omar Campos on 30/09/22.
//

import Foundation
import CoreData
import UIKit

struct soundChannel : Codable
{
    let canalId : Int?
    let tag : Int?
    let nombre : String?
    let imagen : String?
    let imagenData : Data?
}

class channelData
{
    public static func saveChannel(channel : soundChannel)
    {
        
        guard let appDelegate =
                UIApplication.shared.delegate as? AppDelegate else {
                    return
                }
        
        // 1
        let managedContext =
        appDelegate.persistentContainer.viewContext
        
        let entity =
        NSEntityDescription.entity(forEntityName: "ChannelAudio",
                                   in: managedContext)!
        let Club = NSManagedObject(entity: entity,
                             insertInto: managedContext)
        Club.setValue(channel.canalId, forKey: "canalId")
        Club.setValue(channel.tag, forKey: "tag")
        Club.setValue(channel.nombre, forKey: "nombre")
        Club.setValue(channel.imagen, forKey: "imagen")
        Club.setValue(channel.imagenData, forKey: "imagenData")
        
        do {
          try managedContext.save()
        } catch let error as NSError {
          print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    public static func UpdateClubes(channel : soundChannel)
    {
        guard let appDelegate =
          UIApplication.shared.delegate as? AppDelegate else {
          return
        }
        
        // 1
        let managedContext =
          appDelegate.persistentContainer.viewContext
        
        let fetchRequest =
          NSFetchRequest<NSManagedObject>(entityName: "ChannelAudio")
        fetchRequest.predicate = NSPredicate(format: "tag = %i", channel.tag ?? 0)
        
        do
        {
            let array = try managedContext.fetch(fetchRequest)
            if array.count > 0
            {
                if let us = array.last
                {
                    us.setValue(channel.canalId, forKeyPath: "canalId")
                    us.setValue(channel.nombre, forKeyPath: "nombre")
                    us.setValue(channel.imagen, forKey: "imagen")
                    us.setValue(channel.imagenData, forKey: "imagenData")
                    try managedContext.save()
                }
                else
                {
                    
                }
            }
        }
        catch
        {
            debugPrint(error)
        }
    }
    public static func getClubExistence(channel : soundChannel) -> Bool
    {
        guard let appDelegate =
          UIApplication.shared.delegate as? AppDelegate else {
          return false
        }
        
        // 1
        let managedContext =
          appDelegate.persistentContainer.viewContext
        
        let fetchRequest =
          NSFetchRequest<NSManagedObject>(entityName: "ChannelAudio")
        fetchRequest.predicate = NSPredicate(format: "tag = %i", channel.tag ?? 0)
        do
        {
            let array = try managedContext.fetch(fetchRequest)
            if array.count > 0
            {
               return true
            }
            else
            {
                return false
            }
        }
        catch
        {
            debugPrint(error)
            return false
        }
    }
    public static func getCanal(tag : Int) -> soundChannel?
    {
        guard let appDelegate =
          UIApplication.shared.delegate as? AppDelegate else {
          return nil
        }
        
        // 1
        let managedContext =
          appDelegate.persistentContainer.viewContext
        
        let fetchRequest =
          NSFetchRequest<NSManagedObject>(entityName: "ChannelAudio")
        fetchRequest.predicate = NSPredicate(format: "tag = %i", tag)
        do
        {
            let array = try managedContext.fetch(fetchRequest)
            if array.count > 0
            {
                if let a = array.first
                {
                    let au = soundChannel(canalId: a.value(forKey: "canalId") as? Int, tag: a.value(forKey: "tag") as? Int, nombre: a.value(forKey: "nombre") as? String,imagen: a.value(forKey: "imagen") as? String,imagenData: a.value(forKey: "imagenData") as? Data)
                    return au
                }
                else
                {
                    return nil
                }
            }
            else
            {
                return nil
            }
        }
        catch
        {
            debugPrint(error)
            return nil
        }
    }
    public static func getCanales() -> [soundChannel]?
    {
        guard let appDelegate =
          UIApplication.shared.delegate as? AppDelegate else {
          return nil
        }
        
        // 1
        let managedContext =
          appDelegate.persistentContainer.viewContext
        let fetchRequest =
          NSFetchRequest<NSManagedObject>(entityName: "ChannelAudio")
        var cb = [soundChannel]()
        do
        {
            let array = try managedContext.fetch(fetchRequest)
            
            if array.count > 0
            {
                for x in array{
                    let au = soundChannel(canalId: x.value(forKey: "canalId") as? Int, tag: x.value(forKey: "tag") as? Int, nombre: x.value(forKey: "nombre") as? String, imagen: x.value(forKey: "imagen") as? String, imagenData:x.value(forKey: "imagenData") as? Data)
                    cb.append(au)
                }
                    
            return cb
                
            }
            else
            {
                return nil
            }
        }
        catch
        {
            debugPrint(error)
            return nil
        }
    }
}
