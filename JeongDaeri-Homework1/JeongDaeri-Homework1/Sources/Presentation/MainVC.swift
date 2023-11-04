import UIKit

class ViewController: BaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIFont.familyNames.sorted().forEach { familyName in
            print("*** \(familyName) ***")
            UIFont.fontNames(forFamilyName: familyName).forEach { fontName in
                print("\(fontName)")
            }
            print("---------------------")
        }
        
        view.backgroundColor = .red
    }


}

