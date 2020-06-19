import UIKit

final class UIButtonFactory{
    // MARK: Properties
    private let defaultColor = UIColor.white
    private let button:UIButton
    private let cornerRadius:CGFloat = 10
    // MARK: Inits
    init(title: String) {
        button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(defaultColor, for: .normal)
        button.layer.cornerRadius = cornerRadius
        button.translatesAutoresizingMaskIntoConstraints = false
    }
    init(image: UIImage) {
        button = UIButton(type: .system)
        button.tintColor = .white
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
    }
    init(image: UIImage, title: String)
    {
        button = UIButton(type: .system)
        button.setImage(image, for: .normal)
        button.setTitle(title, for: .normal)
        button.tintColor = defaultColor
        button.setTitleColor(defaultColor, for: .normal)
        button.centerVertically()
        button.translatesAutoresizingMaskIntoConstraints = false
    }
    
    //MARK: Public methods
    
    func addTarget(_ target: Any?, action: Selector, for event: UIControl.Event) -> Self {
        button.addTarget(target, action: action, for: event)
        
        return self
    }
    
    func setTitleColor(color: UIColor) -> Self {
        button.setTitleColor(color, for: .normal)
    
        return self
    }
    func backgroundColor(color: UIColor) -> Self {
        button.backgroundColor = color
        
        return self
    }
    func cornerRadius(of radius: CGFloat) -> Self {
        button.layer.cornerRadius = radius
        
        return self
    }
    func setInsets(forContentPadding imageTitlePadding: CGFloat) -> Self {
        button.contentEdgeInsets = UIEdgeInsets(
            top: imageTitlePadding,
            left: imageTitlePadding,
            bottom: imageTitlePadding,
            right: imageTitlePadding
        )
        return self
    }
    
    func build() -> UIButton {
        return button
    }
}

extension UIButton {

    func centerVertically(padding: CGFloat = 6.0) {
        guard
            let imageViewSize = self.imageView?.frame.size,
            let titleLabelSize = self.titleLabel?.frame.size else {
            return
        }

        let totalHeight = imageViewSize.height + titleLabelSize.height + padding
        self.imageEdgeInsets = UIEdgeInsets(
            top: 0.0,
            left: totalHeight,
            bottom: totalHeight,
            right: 0.0
        )

        self.titleEdgeInsets = UIEdgeInsets(
            top: totalHeight,
            left: -28,
            bottom: 0.0,
            right: 0.0
        )

        self.contentEdgeInsets = UIEdgeInsets(
            top: 0.0,
            left: 0.0,
            bottom: 0.0,
            right: 0.0
        )
    }

}
