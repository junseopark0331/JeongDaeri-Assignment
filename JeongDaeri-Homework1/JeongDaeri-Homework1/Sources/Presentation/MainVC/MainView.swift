import UIKit

final class MainVC: BaseVC {
    
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
        $0.backgroundColor = UIColor(rgb: 0xE8E8E8)
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
        $0.backgroundColor = UIColor(rgb: 0xE8E8E8)
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
        $0.backgroundColor = UIColor(rgb: 0xE8E8E8)
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
    
    private let connectedWebsiteLabel = TitleLabel().then {
        $0.text = "웹사이트 연결"
    }
    
    lazy var website1TextView = UITextView().then {
        $0.backgroundColor = UIColor(rgb: 0xE8E8E8)
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
        $0.setTitle("작성 팝업 띄우기", for: .normal)
        $0.titleLabel?.font = .JeongDaeri(size: 18, family: .extraBold)
        $0.setTitleColor(UIColor(rgb: 0xFFFFFF), for: .normal)
        $0.backgroundColor = UIColor(rgb: 0x8391A1)
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true
        $0.addTarget(self, action: #selector(popupButtonTapped), for: .touchUpInside)
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
            nickNameTextView
        ].forEach{
            nickNameStackView.addArrangedSubview($0)
        }
        [
            profileLabel,
            profileTextView
        ].forEach{
            profileStackView.addArrangedSubview($0)
        }
        [
            introductionLabel,
            introductionTextView
        ].forEach{
            introductionStackView.addArrangedSubview($0)
        }
        
    }
    
    override func setLayout() {
        
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        let contentViewHeight = contentView.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor)
        contentViewHeight.priority = .defaultLow // 제약조건의 우선순위
        contentViewHeight.isActive = true
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.contentLayoutGuide)
            $0.width.equalTo(scrollView.snp.width)
        }
        nickNameStackView.snp.makeConstraints {
            $0.height.equalTo(81)
            $0.top.equalTo(contentView)
            $0.leading.trailing.equalTo(contentView).inset(16)
        }
        nickNameTextView.snp.makeConstraints {
            $0.height.equalTo(52)
        }
        profileStackView.snp.makeConstraints {
            $0.height.equalTo(81)
            $0.top.equalTo(nickNameTextView.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(contentView).inset(16)
        }
        profileTextView.snp.makeConstraints {
            $0.height.equalTo(52)
        }
        introductionStackView.snp.makeConstraints {
            $0.height.equalTo(229)
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
    
    @objc func popupButtonTapped(_ sender: UIButton) {
        let vc = WriteVC()
        vc.modalPresentationStyle = .fullScreen
        
        self.present(vc, animated: true)
    }
    
    
    
}

extension MainVC: UITextViewDelegate {
    
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
        return false
    }
    
}
