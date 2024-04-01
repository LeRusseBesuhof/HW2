import UIKit

class ViewController: UIViewController {

    lazy var heightConst = Double(view.frame.height / 932)
    lazy var profilePicSize = 100 * heightConst
    
    lazy var titleGround = createImageView(
        withBorders: CGRect(x: 0, y: 0, width: Int(view.frame.width), height: Int(156 * heightConst)),
        image: .wallpaper)
    
    lazy var profilePicture = createImageView(
        withBorders: CGRect(x: 30, y: Double(titleGround.frame.height + 33 * heightConst), width: profilePicSize, height: profilePicSize),
        image: .gendalf,
        cornerRadius: 0.5 * Double(profilePicSize))
    
    lazy var nameLine = createLabel(
        withBorders: CGRect(x: 30 + Int(profilePicture.frame.width) + 16, y: Int(titleGround.frame.height + 52 * heightConst), width: 200, height: Int(19 * heightConst)),
        text: "Павел Градов",
        isBoldFont: true)
    
    lazy var editButton = createButton(
        withBorders: CGRect(x: Int(nameLine.frame.origin.x), y: Int(nameLine.frame.origin.y + 28 * heightConst), width: 147, height: Int(34 * heightConst)), 
        titleText: "редактировать")
    
    lazy var addDescriptionLabel = createLabel(
        withBorders: CGRect(x: 30, y: Int(profilePicture.frame.origin.y + profilePicture.frame.height + 52 * heightConst), width: 180, height: Int(19 * heightConst)),
        text: "Добавить описание")
    
    lazy var textView : UITextView = {
        $0.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
        $0.textColor = .blue
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        $0.layer.cornerRadius = 20
        return $0
    }(UITextView(frame: CGRect(x: 30, y: Int(addDescriptionLabel.frame.origin.y + 28 * heightConst), width: Int(view.frame.width) - 60, height: Int(150 * heightConst))))
    
    lazy var changePasswordLabel = createLabel(
        withBorders: CGRect(x: 30, y: Int(textView.frame.origin.y + textView.frame.height + 33 * heightConst), width: 150, height: Int(19 * heightConst)),
        text: "Изменить пароль")
    
    lazy var oldPasswordTextField = createTextField(
        withBorders: CGRect(x: 30, y: Int(changePasswordLabel.frame.origin.y + 28 * heightConst), width: Int(view.frame.width - 60), height: Int(52 * heightConst)),
        placeholder: "Старый пароль")
    
    lazy var newPasswordTextField = createTextField(
        withBorders: CGRect(x: 30, y: Int(oldPasswordTextField.frame.origin.y + oldPasswordTextField.frame.height + 14 * heightConst), width: Int(view.frame.width) - 60, height: Int(52 * heightConst)),
        placeholder: "Новый пароль")
    
    lazy var saveButton = createButton(
        withBorders: CGRect(x: 30, y: Int(newPasswordTextField.frame.origin.y + newPasswordTextField.frame.height + 127 * heightConst), width: Int(view.frame.width) - 60, height: Int(55 * heightConst)),
        titleText: "Сохранить")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        [titleGround, profilePicture, nameLine, editButton, addDescriptionLabel, textView, changePasswordLabel, oldPasswordTextField, newPasswordTextField, saveButton].forEach { view.addSubview($0) }
    }

    func createImageView(withBorders bord: CGRect, image: UIImage, cornerRadius: CGFloat = 0) -> UIImageView {
        let imageView = UIImageView(frame: bord)
        imageView.image = image
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = cornerRadius
        return imageView
    }
    
    func createLabel(withBorders bord: CGRect, text: String, isBoldFont: Bool = false) -> UILabel {
        let label = UILabel(frame: bord)
        label.text = text
        guard isBoldFont == true else { return label }
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }
    
    func createTextField(withBorders bord: CGRect, placeholder: String? = "") -> UITextField {
        let textField = UITextField(frame: bord)
        textField.placeholder = placeholder
        textField.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
        textField.textColor = .blue
        textField.isSecureTextEntry = true
        textField.layer.cornerRadius = 10
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 31, height: 52))
        textField.leftViewMode = .always
        textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 31, height: 52))
        textField.rightViewMode = .always
        return textField
    }

    func createButton(withBorders bord: CGRect, titleText: String) -> UIButton {
        let button = UIButton(frame: bord)
        button.backgroundColor = .blue
        button.setTitle(titleText, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }
}

