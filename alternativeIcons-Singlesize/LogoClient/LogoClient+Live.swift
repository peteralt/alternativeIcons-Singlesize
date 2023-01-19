import Foundation
import UIKit

extension LogoClient {
    static var live: Self {
        return Self(
            availableIcons: {
                var availableLogos: [AlternativeIcon] = []
                
                if let icons = Bundle.main.object(forInfoDictionaryKey: "CFBundleIcons") as? [String: Any],
                   let alternateIcons = icons["CFBundleAlternateIcons"] as? [String: Any] {

                    if let originalImageAsset = UIImage(named: "AppIcon") {
                        let originalIcon = AlternativeIcon(
                            iconName: nil,
                            title: "Original",
                            icon: originalImageAsset)
                        availableLogos.append(originalIcon)
                    }

                    for (iconName, value) in alternateIcons {
                        guard
                            let iconList = value as? [String: Any],
                            let iconFiles = iconList["CFBundleIconFiles"] as? [String],
                            let iconFileName = iconFiles.first,
                            // This isn't the best approach here, but it illustrates one possible way
                            // to access the app icons.
                            let iconFile = Bundle.main.path(forResource: iconFileName + "@2x", ofType: "png"),
                            let iconImage = UIImage(contentsOfFile: iconFile)
                        else {
                            print("unable to find icon")
                            return availableLogos
                            
                        }

                        let title = iconName.replacingOccurrences(of: "AppIcon", with: "")
                        let altIcon = AlternativeIcon(iconName: iconName, title: title, icon: iconImage)
                        availableLogos.append(altIcon)
                    }

                    availableLogos.sort(by: { $0.title < $1.title })
                }
                return availableLogos
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
