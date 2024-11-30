//
//  Bundle-Decodeable.swift
//  Moonshot
//
//  Created by Leo Mogiano on 28/11/24.
//

import Foundation


extension Bundle {
    func decode<T: Codable>(_ file: String) throws -> T {
        // Buscar el archivo
        guard let url = url(forResource: file, withExtension: nil) else {
            throw DecodingError.fileNotFound(file: file)
        }
        
        // Leer los datos
        let data: Data
        do {
            data = try Data(contentsOf: url)
        } catch {
            throw DecodingError.failedToRead(file: file, underlyingError: error)
        }
        
        // Decodificar los datos
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"  // Establecer el formato adecuado
        formatter.timeZone = TimeZone(secondsFromGMT: 0)  // Configura la zona horaria, si es necesario
        formatter.locale = Locale(identifier: "en_US")  // Configura la localización (opcional, pero útil)
       
        
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        do {
            
            return try decoder.decode(T.self, from: data)
        } catch {
            throw DecodingError.failedToDecode(file: file, underlyingError: error)
        }
//        guard let url = self.url(forResource: file, withExtension: nil) else {
//            fatalError("Failed to locate \(file) in bundle.")
//        }
//        guard let data = try? Data(contentsOf: url) else {
//            fatalError("Failed to load \(file) from bundle.")
//        }
//        let decoder = JSONDecoder ()
//        
//        let formatter = DateFormatter()
//        
//        formatter.dateFormat = "y-MM-dd"
//        
//        decoder.dateDecodingStrategy = .formatted(formatter)
//        
//        guard let loaded = try? decoder.decode (T.self, from: data) else {
//            fatalError("Failed to decode \(file) from bundle.")
//        }
//        
//        return loaded
    }
}


enum DecodingError: Error, LocalizedError {
    case fileNotFound(file: String)
    case failedToRead(file: String, underlyingError: Error)
    case failedToDecode(file: String, underlyingError: Error)

    var errorDescription: String? {
        switch self {
        case .fileNotFound(let file):
            return "El archivo \(file) no se encontró en el bundle."
        case .failedToRead(let file, let error):
            return "No se pudo leer el archivo \(file): \(error.localizedDescription)"
        case .failedToDecode(let file, let error):
            return "No se pudo decodificar el archivo \(file): \(error.localizedDescription)"
        }
    }
}
