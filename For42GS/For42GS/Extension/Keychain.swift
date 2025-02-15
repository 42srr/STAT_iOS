//
//  Keychain.swift
//  For42GS
//
//  Created by Kimdohyun on 10/14/24.
//

import Foundation

struct KeychainItem {
// MARK: - 1. TYPES
    
    enum KeychainError: Error {
        case noPassword
        case unexpectedPasswordData
        case unexpectedItemData
        case unhandledError
    }
    
// MARK: - 2. PROPERTISE
    
    let service: String
    let accessGroup: String?
    private(set) var account: String
    
// MARK: - 3. INTIALIZATION
    
    init(service: String, account: String, accessGroup: String? = nil) {
        
        self.service = service
        self.account = account
        self.accessGroup = accessGroup
    }
    
// MARK: - 4. KEYCHAIN ACCESS
    
    func readItem() throws -> String {

        var query = KeychainItem.keychainQuery(withService: service, account: account, accessGroup: accessGroup)
        query[kSecMatchLimit as String] = kSecMatchLimitOne
        query[kSecReturnAttributes as String] = kCFBooleanTrue
        query[kSecReturnData as String] = kCFBooleanTrue
        
        var queryResult: AnyObject?
        let status = withUnsafeMutablePointer(to: &queryResult) {
            SecItemCopyMatching(query as CFDictionary, UnsafeMutablePointer($0))
        }
        
        guard status != errSecItemNotFound else { throw KeychainError.noPassword }
        guard status == noErr else { throw KeychainError.unhandledError }
        
        guard let existingItem = queryResult as? [String: AnyObject],
            let passwordData = existingItem[kSecValueData as String] as? Data,
            let password = String(data: passwordData, encoding: String.Encoding.utf8)
            else {
                throw KeychainError.unexpectedPasswordData
        }
        
        return password
    }
    
    func saveItem(_ password: String) throws {

        let encodedPassword = password.data(using: String.Encoding.utf8)!
        
        do {
            try _ = readItem()
            
            var attributesToUpdate = [String: AnyObject]()
            attributesToUpdate[kSecValueData as String] = encodedPassword as AnyObject?
            
            let query = KeychainItem.keychainQuery(withService: service, account: account, accessGroup: accessGroup)
            let status = SecItemUpdate(query as CFDictionary, attributesToUpdate as CFDictionary)
            
            guard status == noErr else { throw KeychainError.unhandledError }
        } catch KeychainError.noPassword {

            var newItem = KeychainItem.keychainQuery(withService: service, account: account, accessGroup: accessGroup)
            newItem[kSecValueData as String] = encodedPassword as AnyObject?
            
            let status = SecItemAdd(newItem as CFDictionary, nil)
            
            guard status == noErr else { throw KeychainError.unhandledError }
        }
    }
    
    func deleteItem() throws {
        
        let query = KeychainItem.keychainQuery(withService: service, account: account, accessGroup: accessGroup)
        let status = SecItemDelete(query as CFDictionary)
        
        guard status == noErr || status == errSecItemNotFound else { throw KeychainError.unhandledError }
    }
    
//MARK: - 5. CONVENIENCE
    
    private static func keychainQuery(withService service: String, account: String? = nil, accessGroup: String? = nil) -> [String: AnyObject] {
        var query = [String: AnyObject]()
        query[kSecClass as String] = kSecClassGenericPassword
        query[kSecAttrService as String] = service as AnyObject?
        
        if let account = account {
            query[kSecAttrAccount as String] = account as AnyObject?
        }
        
        if let accessGroup = accessGroup {
            query[kSecAttrAccessGroup as String] = accessGroup as AnyObject?
        }
        
        return query
    }
    
    static var AcToken: String {
        do {
            let storedTokenResponse = try KeychainItem(service: "DonsNote.For42GS", account: "AcToken").readItem()
            return storedTokenResponse
        } catch {
            return "AcToken error!"
        }
    }
    
    static var ReToken: String {
        do {
            let storedTokenResponse = try KeychainItem(service: "DonsNote.For42GS", account: "ReToken").readItem()
            return storedTokenResponse
        } catch {
            return "ReToken error!"
        }
    }
    
    static func deleteAcToken() {
        do {
            try KeychainItem(service: "DonsNote.For42GS", account: "AcToken").deleteItem()
        } catch {
            print("DeleteAcToken Error : Unable to delete AcToken from keychain")
        }
    }
    
    static func deleteReToken() {
        do {
            try KeychainItem(service: "DonsNote.For42GS", account: "ReToken").deleteItem()
        } catch {
            print("DeleteReToken Error : Unable to delete ReToken from keychain")
        }
    }
}

