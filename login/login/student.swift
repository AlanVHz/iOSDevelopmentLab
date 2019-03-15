//
//  student.swift
//  login
//
//  Created by Alan Vargas on 3/1/19.
//  Copyright © 2019 Alan Vargas. All rights reserved.
//

import Foundation

class Student {
    var name:String = String()
    var career:String = String()
    var nameImage:String = String()
    
    init() {}
    
    init(name:String, career:String, nameImage:String) {
        self.name = name
        self.career = career
        self.nameImage = nameImage
    }
}
