//
//  TopicCell.swift
//  EpiReader
//
//  Created by Alexandre Toubiana on 20/03/2017.
//  Copyright © 2017 Alexandre Toubiana. All rights reserved.
//

import UIKit

class TopicCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var contentText: UITextView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var subjectLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var newsView: CustomView!
    @IBOutlet weak var photoImageView: UIImageView!
    
    // MARK: - Cell delegates
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(_ topic: Topic) {
        newsView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        authorLabel.text = parseAuthor((topic.author)!)[0]
        var parsedContent = topic.content
        if let content = topic.content {
            if PGPParser().isPgp(content: content) {
                parsedContent = PGPParser().parsePGP(content: content)
            }
        }
        contentText.text = parsedContent
        subjectLabel.text = topic.subject
        dateLabel.text = StrToAbrevWithHour(dateStr: (topic.creation_date)!)
        let url = getProfilePic(mail: parseAuthor((topic.author)!)[1], subject: topic.subject!)
        photoImageView.af_setImage(withURL: url!, placeholderImage: #imageLiteral(resourceName: "default_picture"))
        
        let year = getYear(dateStr: (topic.creation_date)!)
        if year != nil {
            if let isAcu = isACU(mail: (parseAuthor((topic.author)!)[1])) {
                if isAcu {
                    if (Assistant.ACU[year!] != nil) {
                        photoImageView.image = Assistant.ACU[year!]
                    }
                }
                else {
                    if (Assistant.YAKA[year!] != nil) {
                        photoImageView.image = Assistant.YAKA[year!]
                    }
                }
            }
        }
        
        photoImageView.layer.masksToBounds = true
        photoImageView.layer.cornerRadius = photoImageView.bounds.height / 2
        photoImageView.layer.borderWidth = 1
        photoImageView.layer.borderColor = #colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9215686275, alpha: 1).cgColor
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func isACU(mail: String) -> Bool? {
        if mail == "chef@tickets.acu.epita.fr" {
            return true
        }
        else if mail == "chefs@yaka.epita.fr" || mail == "chefs@tickets.yaka.epita.fr"{
            return false
        }
        else {
            return nil
        }
    }
}
