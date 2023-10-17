//
//  TeaMenuApp.swift
//  TeaMenu
//
//  Created by Mine on 16/10/2023.
//

import SwiftUI
import URLImageStore
import URLImage

@main
struct TeaMenuApp: App {
    
    @StateObject var viewModel = AppViewModel()
    
    let urlImageService = URLImageService(fileStore: nil, inMemoryStore: URLImageInMemoryStore())
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
                .environment(\.urlImageService, urlImageService)
        }
    }
    
}
