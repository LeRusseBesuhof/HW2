import UIKit

class ViewController: UIViewController {

    lazy var frameWidthWithOffsets = view.frame.width - 60
    
    lazy var titleGround = createImageView(
        withBorders: CGRect(x: 0, y: 0, width: view.frame.width, height: 156),
        image: .wallpaper)
    
    lazy var profilePictureOriginY = titleGround.frame.maxY + 33
    lazy var profilePicture = createImageView(
        withBorders: CGRect(x: 30, y: profilePictureOriginY, width: 100, height: 100),
        image: .gendalf,
        cornerRadius: 50)
    
    lazy var nameLineOriginX = profilePicture.frame.maxX + 16
    lazy var nameLineOriginY = titleGround.frame.maxY + 52
    lazy var nameLineWidthWithOffstets = frameWidthWithOffsets - profilePicture.frame.maxX
    lazy var nameLine = createLabel(
        withBorders: CGRect(x: nameLineOriginX, y: nameLineOriginY, width: nameLineWidthWithOffstets, height: 19),
        text: "Павел Градов",
        isBoldFont: true)
    
    lazy var editButtonOriginY = nameLine.frame.maxY + 9
    lazy var editButton = createButton(
        withBorders: CGRect(x: nameLine.frame.origin.x, y: editButtonOriginY, width: 147, height: 34),
        titleText: "редактировать")
    
    lazy var addDescriptionLabelOriginY = profilePicture.frame.maxY + 52
    lazy var addDescriptionLabel = createLabel(
        withBorders: CGRect(x: 30, y: addDescriptionLabelOriginY, width: frameWidthWithOffsets, height: 19),
        text: "Добавить описание")
    
    lazy var textViewOriginY = addDescriptionLabel.frame.maxY + 9
    lazy var textView : UITextView = {
        $0.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
        $0.textColor = .blue
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        $0.layer.cornerRadius = 20
        return $0
    }(UITextView(frame: CGRect(x: 30, y: textViewOriginY, width: frameWidthWithOffsets, height: 150)))
    
    lazy var changePasswordLabelOriginY = textView.frame.maxY + 33
    lazy var changePasswordLabel = createLabel(
        withBorders: CGRect(x: 30, y: changePasswordLabelOriginY, width: frameWidthWithOffsets, height: 19),
        text: "Изменить пароль")
    
    lazy var oldPasswordTextFieldOriginY = changePasswordLabel.frame.maxY + 9
    lazy var oldPasswordTextField = createTextField(
        withBorders: CGRect(x: 30, y: oldPasswordTextFieldOriginY, width: frameWidthWithOffsets, height: 52),
        placeholder: "Старый пароль",
        isPassword: true)
    
    lazy var newPasswordTextFieldOriginY = oldPasswordTextField.frame.maxY + 14
    lazy var newPasswordTextField = createTextField(
        withBorders: CGRect(x: 30, y: newPasswordTextFieldOriginY, width: frameWidthWithOffsets, height: 52),
        placeholder: "Новый пароль",
        isPassword: true)
    
    lazy var saveButtonOriginY = newPasswordTextField.frame.maxY + 127
    lazy var saveButton = createButton(
        withBorders: CGRect(x: 30, y: saveButtonOriginY, width: frameWidthWithOffsets, height: 55),
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
        label.font = UIFont.systemFont(ofSize: 16, weight: isBoldFont ? .bold : .regular)
        return label
    }
    
    func createTextField(withBorders bord: CGRect, placeholder: String? = "", isPassword: Bool = false) -> UITextField {
        let textField = UITextField(frame: bord)
        textField.placeholder = placeholder
        textField.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
        textField.textColor = .blue
        textField.isSecureTextEntry = isPassword
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

