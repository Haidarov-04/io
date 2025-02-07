//
//  DelegateClass.swift
//  delegate
//
//  Created by Haidarov N on 2/7/25.
//

import Foundation

protocol DelegateProtocol{
    func tap()
}

class DelegateClass {
    var delegate: DelegateProtocol?
    
    func tap(){
        print("class tapped")
        delegate?.tap()
    }
    
}
