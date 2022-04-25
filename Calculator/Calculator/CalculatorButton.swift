//
//  ActionButton.swift
//  Calculator
//
//  Created by Кирилл  Геллерт on 13.04.2022.
//

import UIKit

class CalculatorButton: UIButton {
    
    var operation: Operation = .equal
    
    private lazy var widthPortraitConstraint = widthAnchor.constraint(equalToConstant: K.Numeric.portraitButtonWidthHeight)
    private lazy var heightPortraitConstraint = heightAnchor.constraint(equalToConstant: K.Numeric.portraitButtonWidthHeight)
    
    private var isZeroButton: Bool {
        customTitleLabel.text == "0" ? true : false
    }
    
    override var isSelected: Bool {
        didSet {
            //createAnimatorBasedIsSelected()
            if isSelected {
                delegate?.didSelectButton(self)
            }
        }
    }
    
    private var animator = UIViewPropertyAnimator()
    
    weak var delegate: KeyboardViewDelegate?
    
    private lazy var customTitleLabel: UILabel = {
        let label = UILabel()
        label.font = operation.buttonType.font
        label.textColor = operation.buttonType.tintColor
        
        return label
    }()
    
    init(operation: Operation, title: String? = nil) {
        super.init(frame: .zero)
        self.operation = operation
        setTitle(title)
        setupView()
        setupTargets()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if isZeroButton {
            if Orientation.isLandscape {
                layer.cornerRadius = bounds.height / 2
            } else {
                layer.cornerRadius = K.Numeric.portraitButtonWidthHeight / 2
            }
        } else {
            if Orientation.isLandscape {
                layer.cornerRadius = bounds.height / 2
            } else {
                layer.cornerRadius = K.Numeric.portraitButtonWidthHeight / 2
            }
        }
        
    }
    
    func setup() {
        customTitleLabel.font = operation.buttonType.font
        if operation.buttonType == .engineering {
            isHidden = Orientation.isPortrait
        } else if operation.buttonType != .number {
            setImage(operation.buttonImage, for: .normal)
        }
        
        if !isZeroButton {
            heightPortraitConstraint.isActive = Orientation.isPortrait
            widthPortraitConstraint.isActive = Orientation.isPortrait
        }
    }
    
}

private extension CalculatorButton {
    
    func setupView() {
        backgroundColor = operation.buttonType.backgroundColor
        tintColor = operation.buttonType.tintColor
        addSubviews([customTitleLabel])
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            customTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            customTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    func setTitle(_ title: String?) {
        
        if operation.buttonType == .number
            || operation == .reset {
            customTitleLabel.text = title
        } else if operation.buttonType == .engineering {
            customTitleLabel.text = operation.buttonTitle
        } else {
            setImage(operation.buttonImage, for: .normal)
        }
        
    }
    
    func setupTargets() {
        addTarget(self, action: #selector(didTouchDown), for: [.touchDown, .touchDragEnter])
        addTarget(self, action: #selector(didTouchUp), for: [.touchUpInside, .touchDragExit, .touchCancel])
    }
    
}

private extension CalculatorButton {
    
    @objc func didTouchDown() {
        animator.stopAnimation(true)
        backgroundColor = operation.buttonType.highlightedBackgroundColor
    }
    
    @objc func didTouchUp() {
        createAnimator()
    }
    
    func handleBasedIsSelected() {
        if animator.isRunning {
            animator.stopAnimation(true)
        }
        createAnimator()
    }
    
    func createAnimator() {
        createAnimatorBasedIsSelected()
        animator.startAnimation()
    }
    
    func updateWhenIsSelected() {
        
    }
    
    func updateWhenIsDeselected() {
        if operation.selectable {
            customTitleLabel.textColor = operation.buttonType.selectedTintColor
            imageView?.tintColor = operation.buttonType.selectedTintColor
            backgroundColor = operation.buttonType.selectedBackgroundColor
        } else {
            customTitleLabel.textColor = operation.buttonType.tintColor
            imageView?.tintColor = operation.buttonType.tintColor
            backgroundColor = operation.buttonType.backgroundColor
        }
    }
    
    func createAnimatorBasedIsSelected() {
        animator = isSelected ?
            createAnimator(with: updateWhenIsSelected) :
            createAnimator(with: updateWhenIsDeselected)
    }
    
    func createAnimator(with animation: (() -> Void)?) -> UIViewPropertyAnimator {
        return UIViewPropertyAnimator(duration: 0.5, curve: .easeOut, animations: animation)
    }
    
}



