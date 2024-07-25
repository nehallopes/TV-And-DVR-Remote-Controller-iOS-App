//
//  SingletonViewController.swift
//  HW4
//
//  Created by CDMStudent on 2/24/24.
//

import Foundation

class Singleton {
    
    static let shared = Singleton()
        
    var Fav_Ch: [(Seg_label: String, Seg_ch: Int)] = [
        ("ABC", 14),
        ("NBC", 18),
        ("CBS", 35),
        ("FOX", 22),
    ]
    
    private init() {}
    
    func Change_Ch(atIndex index: Int, withLabel Seg_label: String, andChannel Seg_ch: Int) {
        guard index >= 0 && index < Fav_Ch.count else {
            return
        }
        
        Fav_Ch[index] = ( Seg_label, Seg_ch)
    }

}
