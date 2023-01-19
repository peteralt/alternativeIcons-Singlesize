import Foundation
import UIKit

struct AlternativeIcon: Equatable, Hashable, Identifiable {
    let iconName: String?
    let title: String
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
