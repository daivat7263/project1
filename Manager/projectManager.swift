//
//  projectManager.swift
//  Project1
//
//  Created by COE-02 on 02/01/20.
//  Copyright © 2020 COE-02. All rights reserved.
//

import UIKit

class projectManager: NSObject
{
    var dbLocation = ""
    //to manage or point to db
    var db:OpaquePointer?
    
    
    override init() {
        let appDel = UIApplication.shared.delegate as! AppDelegate
        
        self.dbLocation = appDel.dbPath
        
    }
    
    func IsOpen ()-> Bool {
        
        if(sqlite3_open(self.dbLocation, &db) == SQLITE_OK)
        {
            return true
        }
        
        
        return false
    }
    
    func RunCommand(cmdText:String) -> Bool {
        
        if(IsOpen())
        {
            var stmt:OpaquePointer?
            if(sqlite3_prepare_v2(db, cmdText, -1, &stmt, nil) == SQLITE_OK)
            {
                sqlite3_step(stmt)
                sqlite3_finalize(stmt)
                sqlite3_close(db)
                return true
            }
        }
   
        return false
    }
    
    func RunQuery(queryText:String) -> [[String:Any]] {
        var list = [[String:Any]]()
        
        if(IsOpen())
        {
            var stmt:OpaquePointer?
            if(sqlite3_prepare_v2(db, queryText, -1, &stmt, nil) == SQLITE_OK)
            {
                sqlite3_step(stmt)
      
                sqlite3_finalize(stmt)
                sqlite3_close(db)
            }
        }
        
        
        
        return list
    }
}
