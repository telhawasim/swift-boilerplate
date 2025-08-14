//
//  Utils.swift
//  swift-boilerplate
//
//  Created by Telha Wasim on 14/08/2025.
//

import Foundation
import UIKit

class Utils {
    
    //MARK: - FETCH IMAGE -
    static func fetchImage(url: String) async throws -> UIImage {
        guard let imageURL = URL(string: url) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: imageURL)
        
        guard let image = UIImage(data: data) else {
            throw NSError(domain: "ImageError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid image data"])
        }
        
        return image
    }
}
