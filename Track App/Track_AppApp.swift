//
//  Track_AppApp.swift
//  Track App
//
//  Created by Macintosh HD on 17/08/2021.
//

import SwiftUI

@main
struct Track_AppApp: App {
   @StateObject var TransactionListVM = TransactionListViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(TransactionListVM)
        }
    }
}
