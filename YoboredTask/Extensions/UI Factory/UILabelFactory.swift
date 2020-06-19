import UIKit

final class UILabelFactory {
    
    //MARK: Properties
    private let label: UILabel
    private let defaultFontSize: CGFloat = 20
    
    
  // MARK: - Inits
    init(text: String) {
        label = UILabel()
        label.textAlignment = .center
        label.text = text
        label.font = label.font.withSize(defaultFontSize)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
    }

  // MARK: - Public methods
    func fontSize(of size: CGFloat,with weight: UIFont.Weight = .regular) -> Self {
        label.font = UIFont.systemFont(ofSize: size, weight: weight)
        return self
    }

    func font(of size: CGFloat,name: String) -> Self{
        label.font = UIFont(name: name, size: size)
        
        return self
    }
    
    func backgroundColor(with color: UIColor) -> Self{
        label.backgroundColor = color
        
        return self
    }
    
    func textAlignment(with alignment: NSTextAlignment) -> Self {
        label.textAlignment = alignment
        
        return self
    }
    
    func textColor(with color: UIColor) -> Self {
        label.textColor = color
        
        return self
    }
    
    func numberOf(lines: Int) -> Self {
        label.numberOfLines = lines
        
        return self
    }
    
    func cornerRadius(radius: CGFloat) -> Self{
        label.layer.cornerRadius = radius
        label.layer.masksToBounds = true
        
        return self
    }
    
    func build() -> UILabel {
        return label
    }
    
}


class PaddingLabel: UILabel {

    var topInset: CGFloat
    var bottomInset: CGFloat
    var leftInset: CGFloat
    var rightInset: CGFloat

    required init(withInsets top: CGFloat, _ bottom: CGFloat,_ left: CGFloat,_ right: CGFloat) {
        self.topInset = top
        self.bottomInset = bottom
        self.leftInset = left
        self.rightInset = right
        super.init(frame: CGRect.zero)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
    }

    override var intrinsicContentSize: CGSize {
        get {
            var contentSize = super.intrinsicContentSize
            contentSize.height += topInset + bottomInset
            contentSize.width += leftInset + rightInset
            return contentSize
        }
    }
}

