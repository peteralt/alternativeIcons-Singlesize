import Foundation
import UIKit

struct AlternativeIcon: Equatable, Hashable, Identifiable {
    /// Optional asset name, this identifies a custom icon. Use `nil` for the original icon.
    let iconName: String?
    
    /// User friendly title for the icon
    let title: String
    
    /// This isn't a proper abstraction, rather a shorthand to access the asset.
    let icon: UIImage
    
    var id: String {
        title
    }
}

struct LogoClient {
    var availableIcons: () -> [AlternativeIcon]
    var setIcon: (AlternativeIcon) -> Void
    var resetIcon: () -> Void
}
