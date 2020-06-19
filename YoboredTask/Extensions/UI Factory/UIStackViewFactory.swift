import UIKit

final class UIStackViewFactory
{
    // MARK: Properties
    private let stackView: UIStackView
    
    //MARK: Inits
    init(axis: NSLayoutConstraint.Axis,distribution: UIStackView.Distribution){
        stackView = UIStackView()
        stackView.alignment = .fill
        stackView.spacing = 0
        stackView.axis = axis
        stackView.distribution = distribution
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    //MARK: Public methods
    func spacing(_ spacing: CGFloat) -> Self{
        stackView.spacing = spacing
        
        return self
    }
    
    func build() -> UIStackView
    {
        return stackView
    }
}
