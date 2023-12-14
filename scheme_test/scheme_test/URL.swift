import Foundation

extension URL {
    var queryParameters: [String: String] {
        return URLComponents(url: self, resolvingAgainstBaseURL: true)?.queryItems?.reduce(into: [String: String]()) { dict, item in
            dict[item.name] = item.value
        } ?? [:]
    }
}
