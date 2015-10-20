//
//  ReamlModels.swift
//  cloudTV
//
//  Created by Penemetsa, Arjun on 10/20/15.
//  Copyright © 2015 Arjun Penemetsa. All rights reserved.
//

import Foundation
import RealmSwift

class Entry: Object {
  dynamic var objectId = ""
  dynamic var name = ""
  dynamic var cat = 1
  dynamic var desc = ""
  dynamic var imgUrl = ""
}