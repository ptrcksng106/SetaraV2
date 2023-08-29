//
//  CameraView.swift
//  SetaraV2
//
//  Created by Irvan P. Saragi on 28/08/23.
//

import Foundation


struct ScanData:Identifiable {
    var id = UUID()
    let content:String
    
    init(content:String) {
        self.content = content
    }
}
