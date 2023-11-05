import UIKit

class MainVC: BaseVC {
    
    private let scrollView = UIScrollView().then {
        $0.backgroundColor = .white
    }
    
    private let nickNameStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 10
        $0.distribution = .fill
        $0.alignment = .fill
    }
    
    private let nickNameLabel = TitleLabel().then {
        $0.text = "닉네임"
    }
    
    lazy var nickNameTextView = UITextView().then {
        $0.backgroundColor = UIColor.white
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(rgb: 0xDADBDE).cgColor
        $0.layer.cornerRadius = 8
        
        if $0.text.isEmpty {
            $0.text = "닉네임을 입력해주세요."
            $0.font = .JeongDaeri(size: 14, family: .regular)
            $0.textColor = UIColor(rgb: 0x696B72)
            $0.delegate = self
            $0.contentMode = .top
        }
    }
    
    lazy var nickNameCountLabel = UILabel().then {
        $0.textAlignment = .right
        $0.textColor = UIColor(rgb: 0x878787)
        $0.font = .JeongDaeri(size: 14, family: .regular)
        $0.text = "0/20"
    }
    
    private let profileStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 10
        $0.distribution = .fill
        $0.alignment = .fill
    }
    
    private let oneLineProfileLabel = TitleLabel().then {
        $0.text = "한 줄 프로필"
    }
    
    
    lazy var profileTextView = UITextView().then {
        $0.backgroundColor = UIColor.white
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(rgb: 0xDADBDE).cgColor
        $0.layer.cornerRadius = 8
        
        if $0.text.isEmpty {
            $0.text = "자신을 표현할 한 줄 소개입니다."
            $0.font = .JeongDaeri(size: 14, family: .regular)
            $0.textColor = UIColor(rgb: 0x696B72)
            $0.delegate = self
            $0.contentMode = .top
        }
    }
    
    lazy var profileCountLabel = UILabel().then {
        $0.textAlignment = .right
        $0.textColor = UIColor(rgb: 0x878787)
        $0.font = .JeongDaeri(size: 14, family: .regular)
        $0.text = "0/30"
    }
    
    private let introductionStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 10
        $0.distribution = .fill
        $0.alignment = .fill
    }
    
    private let introductionLabel = TitleLabel().then {
        $0.text = "자기소개"
    }
    
    lazy var introductionTextView = UITextView().then {
        $0.backgroundColor = UIColor.white
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(rgb: 0xDADBDE).cgColor
        $0.layer.cornerRadius = 8
        
        if $0.text.isEmpty {
            $0.text = "다른 사람에게 나를 소개할 수 있도록 \n 자신의 활동을 자세하게 적어주세요."
            $0.font = .JeongDaeri(size: 14, family: .regular)
            $0.textColor = UIColor(rgb: 0x696B72)
            $0.delegate = self
            $0.contentMode = .top
        }
    }
    
    lazy var introductionCountLabel = UILabel().then {
        $0.textAlignment = .right
        $0.textColor = UIColor(rgb: 0x878787)
        $0.font = .JeongDaeri(size: 14, family: .regular)
        $0.text = "0/1000"
    }
    
    private let connectedWebsiteLabel = TitleLabel().then {
        $0.text = "연결된 웹사이트"
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        addView()
        setLayout()
    }
    
    override func addView() {
        view.addSubviews(
            scrollView,
            nickNameStackView,
            profileStackView,
            introductionStackView
        )
        [
            nickNameLabel,
            nickNameTextView,
            nickNameCountLabel
        ].forEach{
            nickNameStackView.addArrangedSubview($0)
        }
        [
            oneLineProfileLabel,
            profileTextView,
            profileCountLabel
        ].forEach{
            profileStackView.addArrangedSubview($0)
        }
        [
            introductionLabel,
            introductionTextView,
            introductionCountLabel
        ].forEach{
            introductionStackView.addArrangedSubview($0)
        }
        
        scrollView.addSubview(<#T##view: UIView##UIView#>)
        
    }
    
    override func setLayout() {
        
        self.scrollView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        self.nickNameStackView.snp.makeConstraints {
            $0.height.equalTo(111)
            $0.top.equalTo(self.view.safeAreaLayoutGuide).inset(bound.height * 0.06)
            $0.leading.trailing.equalToSuperview().inset(16)
        }

        self.nickNameTextView.snp.makeConstraints {
            $0.height.equalTo(52)
        }
        
        self.profileStackView.snp.makeConstraints {
            $0.height.equalTo(111)
            $0.top.equalTo(nickNameTextView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(16)
        }

        self.profileTextView.snp.makeConstraints {
            $0.height.equalTo(52)
        }
        
        self.introductionStackView.snp.makeConstraints {
            $0.height.equalTo(259)
            $0.top.equalTo(profileStackView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(16)
        }

        self.profileTextView.snp.makeConstraints {
            $0.height.equalTo(200)
        }
        
    }
}

extension MainVC: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
        if textView.textColor == .green {
            textView.text = nil
            textView.textColor = .blue
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "닉네임을 입력해주세요"
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
            return changedText.count < 30
        }
        
        return false
    }

}
