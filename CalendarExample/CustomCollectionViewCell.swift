//
//  CustomCollectionViewCell.swift
//  CalendarExample
//
//  Created by Lais Godinho on 13/09/22.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    static let identifier = "CustomCollectionViewCell"
    
    lazy var dayOfMonth: UILabel = {
        let label = UILabel()
        label.text = "label"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemBlue
        
        self.contentView.addSubview(dayOfMonth)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not  been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        dayOfMonth.frame = CGRect(x: 0, y: contentView.frame.size.height-50, width: contentView.frame.size.width-10, height: 50)
    }
}
