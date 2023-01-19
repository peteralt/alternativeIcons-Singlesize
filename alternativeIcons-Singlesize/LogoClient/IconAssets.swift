import Foundation

enum IconAssets: String, CaseIterable {
    case a
    case b
    case c
    case original
    
    var assetName: String {
        switch self {
        case .a:
            return "AppIcon_A"
        case .b:
            return "AppIcon_B"
        case .c:
            return "AppIcon_C"
        case .original:
            return "AppIcon"
        }
    }
    
    var iconName: String? {
        switch self {
        case .original:
            return nil
        default:
            return assetName
        }
    }
}
