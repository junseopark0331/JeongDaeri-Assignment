import UIKit
import PanModal

final class BottomSheetVC: BaseVC {
    
    var nickName = ""
    var profile = ""
    var introduction = ""
    
    private let notCheckedLabel = UILabel().then {
        $0.text = "✅ 아직 체크되지 않은 부분이 있어요"
        $0.textColor = UIColor(rgb: 0x1E1C1C)
        $0.textAlignment = .left
        $0.font = .JeongDaeri(size: 20, family: .extraBold)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        addView()
        setLayout()
    }
    
    override func setup() {
        
    }
    
    override func addView() {
        
    }
    
    
    override func setLayout() {
        
    }
    
}

extension BottomSheetVC: PanModalPresentable {
    
    var panScrollable: UIScrollView? {
        return nil
    }
    
    var shortFormHeight: PanModalHeight {
        return .contentHeight(300)
    }
    
    var longFormHeight: PanModalHeight {
        return .contentHeight(300)
    }
    
    var anchorModalToLongForm: Bool {
        // true이면 화면 최상단까지 스크롤
        return false
        
        // false이면 화면 최상단까지 스크롤
    }
    
}
