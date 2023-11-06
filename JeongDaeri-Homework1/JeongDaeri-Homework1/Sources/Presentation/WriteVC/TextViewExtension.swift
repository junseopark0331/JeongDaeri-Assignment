import UIKit

extension WriteVC: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
        
        textView.layer.borderColor = UIColor(rgb: 0x4B84F1).cgColor
        
        if textView.textColor == .green {
            textView.text = nil
            textView.textColor = .blue
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        
        textView.layer.borderColor = UIColor(rgb: 0xDADBDE).cgColor
        
        if textView == nickNameTextView && textView.text.isEmpty {
            textView.text = "닉네임을 입력해주세요"
        } else if textView == profileTextView && textView.text.isEmpty {
            textView.text = "자신을 표현할 한 줄 소개입니다."
        } else if textView == introductionTextView && textView.text.isEmpty{
            textView.text = "다른 사람에게 나를 소개할 수 있도록 \n자신의 활동을 자세하게 적어주세요."
        }
        
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let currentText = textView.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false}
        
        let changedText = currentText.replacingCharacters(in: stringRange, with: text)
        
        if textView == nickNameTextView {
            nickNameCountLabel.text = "\(changedText.count)/20"
            return changedText.count < 20
        } else if textView == profileTextView {
            profileCountLabel.text = "\(changedText.count)/30"
            return changedText.count < 30
        } else {
            introductionCountLabel.text = "\(changedText.count)/1000"
            return changedText.count < 1000
        }
        return false
    }
}

