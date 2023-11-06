import UIKit

final class WriteVC: BaseVC {
    
    private let scrollView = UIScrollView().then {
        $0.backgroundColor = .white
    }
    
    private let contentView = UIView().then {
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
    
    private let nickNameCountLabel = UILabel().then {
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
    
    private let profileLabel = TitleLabel().then {
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
            $0.text = "다른 사람에게 나를 소개할 수 있도록 \n자신의 활동을 자세하게 적어주세요."
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
        $0.text = "웹사이트 연결"
    }
    
    lazy var website1TextView = UITextView().then {
        $0.backgroundColor = UIColor.white
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(rgb: 0xDADBDE).cgColor
        $0.layer.cornerRadius = 8
        
        if $0.text.isEmpty {
            $0.text = "SNS 또는 홈페이지를 연결해주세요."
            $0.font = .JeongDaeri(size: 14, family: .regular)
            $0.textColor = UIColor(rgb: 0x696B72)
            $0.delegate = self
            $0.contentMode = .top
        }
    }
    
    private lazy var completeButton = UIButton().then {
        $0.setTitle("완료", for: .normal)
        $0.titleLabel?.font = .JeongDaeri(size: 18, family: .extraBold)
        $0.setTitleColor(UIColor(rgb: 0xFFFFFF), for: .normal)
        $0.backgroundColor = UIColor(rgb: 0x8391A1)
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true
//        $0.addTarget(self, action: #selector(confirmationButtonTapped), for: .touchUpInside)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        addView()
        setLayout()
    }
    
    override func setup() {
        self.hideKeyboardWhenTappedAround()
    }
    
    override func addView() {
        
        self.view.addSubview(scrollView)
        
        self.scrollView.addSubview(contentView)
        
        contentView.addSubviews(
            nickNameStackView,
            profileStackView,
            introductionStackView,
            connectedWebsiteLabel,
            website1TextView,
            completeButton
        )
        [
            nickNameLabel,
            nickNameTextView,
            nickNameCountLabel
        ].forEach{
            nickNameStackView.addArrangedSubview($0)
        }
        [
            profileLabel,
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
        
    }
    
    override func setLayout() {
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            $0.left.right.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        let contentViewHeight = contentView.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor)
        contentViewHeight.priority = .defaultLow // 제약조건의 우선순위
        contentViewHeight.isActive = true
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.contentLayoutGuide)
            $0.width.equalTo(scrollView.snp.width)
        }
        nickNameStackView.snp.makeConstraints {
            $0.height.equalTo(111)
            $0.top.equalTo(contentView)
            $0.leading.trailing.equalTo(contentView).inset(16)
        }
        nickNameTextView.snp.makeConstraints {
            $0.height.equalTo(52)
        }
        profileStackView.snp.makeConstraints {
            $0.height.equalTo(111)
            $0.top.equalTo(nickNameTextView.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(contentView).inset(16)
        }
        profileTextView.snp.makeConstraints {
            $0.height.equalTo(52)
        }
        introductionStackView.snp.makeConstraints {
            $0.height.equalTo(259)
            $0.top.equalTo(profileStackView.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(contentView).inset(16)
        }
        profileTextView.snp.makeConstraints {
            $0.height.equalTo(200)
        }
        connectedWebsiteLabel.snp.makeConstraints {
            $0.top.equalTo(introductionStackView.snp.bottom).offset(10)
            $0.leading.equalTo(contentView).offset(16)
        }
        website1TextView.snp.makeConstraints {
            $0.height.equalTo(40)
            $0.top.equalTo(connectedWebsiteLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(contentView).inset(16)
        }
        completeButton.snp.makeConstraints {
            $0.height.equalTo(56)
            $0.bottom.equalTo(contentView.snp.bottom).inset(100)
            $0.leading.trailing.equalTo(contentView).inset(22)
        }
    }
    
//    @objc func confirmationButtonTapped(_ sender: UIButton) {
//        NotificationCenter.default.post(
//            name: <#T##NSNotification.Name#>,
//            object: nil,
//            userInfo: [
//                    "nickName": nickNameTextView.text,
//                    "profile": profileTextView.text,
//                    "introduction": introductionTextView.text
//                      ]
//        )
//    }
    
    
    
}

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
