import Foundation
import UIKit

#if DEBUG
extension LogoClient {
    static var samples = Self(
        availableIcons: {
            [
                .init(iconName: "Heart", title: "Heart", icon: UIImage(systemName: "heart")!),
                .init(iconName: "Circle", title: "Circle", icon: UIImage(systemName: "circle")!)
            ]
        },
        setIcon: { _ in },
        resetIcon: { }
    )
}
#endif
