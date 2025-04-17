import Foundation

public final class StoreManager {
    
    // MARK: - Singleton Instance
    public static let shared = StoreManager()
    
    private var defaults: UserDefaults
    
    private init() {
        defaults = UserDefaults.standard
    }
    
    // MARK: - Métodos de Armazenamento Básicos
    
    func save(_ value: String, forKey key: String) {
        defaults.set(value, forKey: key)
    }
    
    func get(forKey key: String) -> String? {
        return defaults.string(forKey: key)
    }
    
    func exists(forKey key: String) -> Bool {
        return defaults.object(forKey: key) != nil
    }
    
    func remove(forKey key: String) {
        defaults.removeObject(forKey: key)
    }
    
    // MARK: - Métodos para Usuário Logado (apenas username)
    
    func saveLoggedUser(username: String) {
        defaults.set(username, forKey: "loggedUser")
        print("Usuário salvo: \(username)")
    }
    
    func getLoggedUser() -> String? {
        return defaults.string(forKey: "loggedUser")
    }
    
    func removeLoggedUser() {
        defaults.removeObject(forKey: "loggedUser")
    }
}
