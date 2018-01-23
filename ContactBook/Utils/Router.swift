
import Alamofire

enum Router: URLRequestConvertible {
    
    static let baseURLString = "https://electric-contact-book-swill.c9users.io/API/"
    
    case contactBookGet([String: Any])
    case notification([String: Any])
    case login([String: Any])
    case stampGet([String: Any])
    case stampSet([String: Any])
    case stampHistory([String: Any])
        
    /// URLリクエストを作成する
    ///
    /// - Returns: URLリクエスト
    func asURLRequest() throws -> URLRequest {
        
        let (method, path, parameters): (HTTPMethod, String, [String: Any]) = {
            
            switch self {
            case .contactBookGet(let params):
                return (.get, "contactBookGetApi.php", params)
            case .notification(let params):
                return (.get, "notificationapi.php", params)
            case .login(let params):
                return(.get,"loginapi.php", params)
            case .stampGet(let params):
                return (.get, "stampGetApi.php", params)
            case .stampSet(let params):
                return (.get, "stampSetApi.php", params)
            case .stampHistory(let params):
                return (.get, "stampHistoryApi.php", params)
            }
            
        }()
        
        let url = URL(string: Router.baseURLString)
        var urlRequest = URLRequest(url: url!.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        return try Alamofire.URLEncoding.default.encode(urlRequest, with: parameters)
    }
}
