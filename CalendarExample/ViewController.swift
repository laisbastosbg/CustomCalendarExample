//
//  ViewController.swift
//  CalendarExample
//
//  Created by Lais Godinho on 12/09/22.
//

import UIKit

class ViewController: UIViewController {
    
    var screen: Screen?
    private var collectionView: UICollectionView?
    var selectedDate = Date()
    var totalSquares = [String]()
    
    override func loadView() {
        self.screen = Screen()
        self.view = self.screen
        screen?.currentMonth.text = CalendarHelper().monthString(date: selectedDate) + " " + CalendarHelper().yearString(date: selectedDate)
        screen?.previousMonthButton.addTarget(self, action: #selector(previousMonth), for: .touchUpInside)
        screen?.nextMonthButton.addTarget(self, action: #selector(nextMonth), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setMonthView()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        guard let collectionView = collectionView else {
            return
        }
        

        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        view.addSubview(collectionView)
        
        collectionView.frame = CGRect(x: 0, y: 139.5, width: 414, height: 682.5)
        
        // Do any additional setup after loading the view.
    }

    func setMonthView() {
        totalSquares.removeAll()
        
        let daysInMonth = CalendarHelper().daysInMonth(date: selectedDate)
        let firstDayOfMonth = CalendarHelper().firstOfMonth(date: selectedDate)
        let startingSpaces = CalendarHelper().weekDay(date: firstDayOfMonth)
        
        var count: Int = 1
        
        while (count <= 42) {
            if (count <= startingSpaces || count - startingSpaces > daysInMonth) {
                totalSquares.append("")
            } else {
                totalSquares.append(String(count - startingSpaces))
            }
            count += 1
        }
        screen?.currentMonth.text = CalendarHelper().monthString(date: selectedDate) + " " + CalendarHelper().yearString(date: selectedDate)
        collectionView?.reloadData()
    }
    
    @objc func previousMonth() {
        selectedDate = CalendarHelper().minusMonth(date: selectedDate)
        print(selectedDate)
        setMonthView()
    }
    
    @objc func nextMonth() {
        selectedDate = CalendarHelper().plusMonth(date: selectedDate)
        setMonthView()
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return totalSquares.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
        myCell.dayOfMonth.text = totalSquares[indexPath.item]
        return myCell
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("User tapped on item \(indexPath.row)")
    }
}
