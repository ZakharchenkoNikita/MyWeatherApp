//
//  StorageManager.swift
//  MyWeather
//
//  Created by Nikita on 25.09.21.
//

import RealmSwift

class StorageManager {
    
    static let shared = StorageManager()
    
    let realm = try! Realm()
    
    private init() {}
    
    func saveObject<O: Object>(object: O) {
        write {
            realm.add(object)
        }
    }
    
    func update(currentObject: Results<Weather>, object: Weather) {
        write {
            
        }
    }
    
    private func write(completion: () -> Void) {
        do {
            try realm.write {
                completion()
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
