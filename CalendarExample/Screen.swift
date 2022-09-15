//
//  Screen.swift
//  CalendarExample
//
//  Created by Lais Godinho on 13/09/22.
//

import UIKit

class Screen: UIView {
    lazy var calendarButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "calendar"), for: .normal)
        button.addTarget(self, action: #selector(toggleCalendar), for: .touchUpInside)
        return button
    }()
    
    lazy var calendarContainer: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.clipsToBounds = true
        return view
    }()
    
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
    
    let testLabel: UILabel = {
        let label = UILabel()
        label.text = "Uma label"
        label.font = .preferredFont(forTextStyle: .largeTitle)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var isCalendarVisible = true

    lazy var calendarContainerHeightConstraint: NSLayoutConstraint = {
        self.calendarContainer.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0)
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addSubview(calendarButton)
        self.addSubview(calendarContainer)
        calendarContainer.addSubview(currentMonth)
        calendarContainer.addSubview(previousMonthButton)
        calendarContainer.addSubview(nextMonthButton)
        calendarContainer.addSubview(weekDayStack)
        weekDayStack.addArrangedSubview(sundayLabel)
        weekDayStack.addArrangedSubview(mondayLabel)
        weekDayStack.addArrangedSubview(tuesdayLabel)
        weekDayStack.addArrangedSubview(wednesdayLabel)
        weekDayStack.addArrangedSubview(thursdayLabel)
        weekDayStack.addArrangedSubview(fridayLabel)
        weekDayStack.addArrangedSubview(saturdayLabel)
        self.addSubview(testLabel)
        setupConstraints()
//        calendarContainerHeightConstraint?.isActive = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        let constraints = [
            calendarButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            calendarButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            
            calendarContainer.topAnchor.constraint(equalTo: self.calendarButton.bottomAnchor, constant: 8),
            calendarContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            calendarContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            calendarContainerHeightConstraint,
            
            testLabel.topAnchor.constraint(equalTo: calendarContainer.bottomAnchor, constant: 16),
            testLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            
            currentMonth.topAnchor.constraint(equalTo: calendarContainer.topAnchor),
            currentMonth.centerXAnchor.constraint(equalTo: calendarContainer.centerXAnchor),
            
            previousMonthButton.centerYAnchor.constraint(equalTo: currentMonth.centerYAnchor),
            previousMonthButton.leadingAnchor.constraint(equalTo: calendarContainer.leadingAnchor, constant: 16),
            
            nextMonthButton.centerYAnchor.constraint(equalTo: currentMonth.centerYAnchor),
            nextMonthButton.trailingAnchor.constraint(equalTo: calendarContainer.trailingAnchor, constant: -16),
            
            weekDayStack.topAnchor.constraint(equalTo: currentMonth.bottomAnchor),
            weekDayStack.heightAnchor.constraint(equalToConstant: 24),
            weekDayStack.leadingAnchor.constraint(equalTo: previousMonthButton.leadingAnchor),
            weekDayStack.trailingAnchor.constraint(equalTo: nextMonthButton.trailingAnchor),
            weekDayStack.centerXAnchor.constraint(equalTo: calendarContainer.centerXAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
//    override func updateConstraints() {
//        setupConstraints()
//    }
    
    @objc
    func toggleCalendar() {
        //calendarContainer.isHidden.toggle()
        UIView.animate(withDuration: 0.25) {
            self.calendarContainerHeightConstraint.constant = self.calendarContainerHeightConstraint.constant == 0 ? UIScreen.main.bounds.height * 0.56 : 0
            self.layoutIfNeeded()
        }
    }

}
