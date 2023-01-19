import Foundation
import UIKit

extension LogoClient {
    static var live: Self {
        return Self(
            availableIcons: {
                let icons: [AlternativeIcon] = IconAssets.allCases.compactMap {
                    if let imageAsset = UIImage(named: $0.assetName) {
                        let icon = AlternativeIcon(
                            iconName: $0.iconName,
                            title: $0.rawValue.capitalized,
                            icon: imageAsset
                        )
                        return icon
                    } else { return nil }
                }
                return icons
            },
            setIcon: { icon in
                UIApplication.shared.setAlternateIconName(icon.iconName)
            },
            resetIcon: {
                UIApplication.shared.setAlternateIconName(nil)
            }
        )
    }
}
