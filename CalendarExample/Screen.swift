//
//  Screen.swift
//  CalendarExample
//
//  Created by Lais Godinho on 13/09/22.
//

import UIKit

class Screen: UIView {
    lazy var currentMonth: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Setembro"
        label.font = .preferredFont(forTextStyle: .title2)
        return label
    }()
    
    lazy var previousMonthButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
//        button.addTarget(self, action: #selector(<#T##@objc method#>), for: <#T##UIControl.Event#>)
        return button
    }()
    
    lazy var nextMonthButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        return button
    }()
    
    lazy var weekDayStack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        return stackView
    }()
    
    lazy var sundayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .body)
        label.text = "Dom"
        return label
    }()
    
    lazy var mondayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .body)
        label.text = "Seg"
        return label
    }()
    
    lazy var tuesdayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .body)
        label.text = "Ter"
        return label
    }()
    
    lazy var wednesdayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .body)
        label.text = "Qua"
        return label
    }()
    
    lazy var thursdayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .body)
        label.text = "Qui"
        return label
    }()
    
    lazy var fridayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .body)
        label.text = "Sex"
        return label
    }()
    
    lazy var saturdayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .body)
        label.text = "Sab"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addSubview(currentMonth)
        self.addSubview(previousMonthButton)
        self.addSubview(nextMonthButton)
        self.addSubview(weekDayStack)
        weekDayStack.addArrangedSubview(sundayLabel)
        weekDayStack.addArrangedSubview(mondayLabel)
        weekDayStack.addArrangedSubview(tuesdayLabel)
        weekDayStack.addArrangedSubview(wednesdayLabel)
        weekDayStack.addArrangedSubview(thursdayLabel)
        weekDayStack.addArrangedSubview(fridayLabel)
        weekDayStack.addArrangedSubview(saturdayLabel)
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            currentMonth.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            currentMonth.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            previousMonthButton.centerYAnchor.constraint(equalTo: currentMonth.centerYAnchor),
            previousMonthButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            
            nextMonthButton.centerYAnchor.constraint(equalTo: currentMonth.centerYAnchor),
            nextMonthButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            
            weekDayStack.topAnchor.constraint(equalTo: currentMonth.bottomAnchor),
            weekDayStack.heightAnchor.constraint(equalToConstant: 24),
            weekDayStack.leadingAnchor.constraint(equalTo: previousMonthButton.leadingAnchor),
            weekDayStack.trailingAnchor.constraint(equalTo: nextMonthButton.trailingAnchor),
            weekDayStack.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }

}
