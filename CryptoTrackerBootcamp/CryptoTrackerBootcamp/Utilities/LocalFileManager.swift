//
//  LocalFileManager.swift
//  CryptoTrackerBootcamp
//
//  Created by Mykyta Kuzminov on 16.03.2024.
//

import Foundation
import SwiftUI

class LocalFileManager {
    
    static let shared = LocalFileManager()
    private init() {}
    
    func saveImage(image: UIImage, folderName: String, imageName: String) {
        
        createFolderIfNeeded(folderName: folderName)
        
        guard
            let data = image.pngData(),
            let url = getURLForImage(folderName: folderName, imageName: imageName)
        else { return }
        
        do {
            try data.write(to: url)
        } catch let error {
            print("Error saving image. \(error.localizedDescription)")
        }
    }
    
    func getImage(folderName: String, imageName: String) -> UIImage? {
        
        guard 
            let url = getURLForImage(folderName: folderName, imageName: imageName),
            FileManager.default.fileExists(atPath: url.path)
        else { return nil }
        
        return UIImage(contentsOfFile: url.path)
    }
    
    private func createFolderIfNeeded(folderName: String) {
        guard 
            let url = getURLForFolder(folderName: folderName)
        else { return }
        
        if !FileManager.default.fileExists(atPath: url.path) {
            do {
                try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true)
            } catch let error {
                print("Error creating directory. \(error.localizedDescription)")
            }
        }
    }
    
    private func getURLForFolder(folderName: String) -> URL? {
        guard
            let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first
        else { return nil }
        
        return url.appendingPathExtension(folderName)
    }
    
    private func getURLForImage(folderName: String, imageName: String) -> URL? {
        guard
            let folderURL = getURLForFolder(folderName: folderName)
        else { return nil }
        return folderURL.appendingPathExtension(imageName + ".png")
    }
}
