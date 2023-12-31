import UIKit

extension UIFont {
    
    enum Family: String {
        case regular = "",
             bold = "Bold",
             extraBold = "ExtraBold"
    }
    
    static func JeongDaeri(size: CGFloat, family: Family) -> UIFont! {
        return UIFont(name: "NanumGothicOTF\(family.rawValue)", size: size)
    }
}

