//
//  UserModel.swift
//  swift-boilerplate
//
//  Created by Telha Wasim on 14/08/2025.
//

// MARK: - Welcome
struct GetUsersResponse: Codable, Sendable {
    var users: [User]?
    var total, skip, limit: Int?
}

// MARK: - User
struct User: Codable, Sendable {
    var id: Int?
    var firstName, lastName, maidenName: String?
    var age: Int?
    var gender: Gender?
    var email, phone, username, password: String?
    var birthDate: String?
    var image: String?
    var bloodGroup: String?
    var height, weight: Double?
    var eyeColor: String?
    var hair: Hair?
    var ip: String?
    var address: Address?
    var macAddress, university: String?
    var bank: Bank?
    var company: Company?
    var ein, ssn, userAgent: String?
    var crypto: Crypto?
    var role: Role?
}

// MARK: - Address
struct Address: Codable, Sendable {
    var address, city, state, stateCode: String?
    var postalCode: String?
    var coordinates: Coordinates?
    var country: Country?
}

// MARK: - Coordinates
struct Coordinates: Codable, Sendable {
    var lat, lng: Double?
}

enum Country: String, Codable, Sendable {
    case unitedStates = "United States"
}

// MARK: - Bank
struct Bank: Codable, Sendable {
    var cardExpire, cardNumber, cardType, currency: String?
    var iban: String?
}

// MARK: - Company
struct Company: Codable, Sendable {
    var department, name, title: String?
    var address: Address?
}

// MARK: - Crypto
struct Crypto: Codable, Sendable {
    var coin: Coin?
    var wallet: Wallet?
    var network: Network?
}

enum Coin: String, Codable, Sendable {
    case bitcoin = "Bitcoin"
}

enum Network: String, Codable, Sendable {
    case ethereumERC20 = "Ethereum (ERC20)"
}

enum Wallet: String, Codable, Sendable {
    case the0Xb9Fc2Fe63B2A6C003F1C324C3Bfa53259162181A = "0xb9fc2fe63b2a6c003f1c324c3bfa53259162181a"
}

enum Gender: String, Codable, Sendable {
    case female = "female"
    case male = "male"
}

// MARK: - Hair
struct Hair: Codable, Sendable {
    var color: String?
    var type: TypeEnum?
}

enum TypeEnum: String, Codable, Sendable {
    case curly = "Curly"
    case kinky = "Kinky"
    case straight = "Straight"
    case wavy = "Wavy"
}

enum Role: String, Codable, Sendable {
    case admin = "admin"
    case moderator = "moderator"
    case user = "user"
}
