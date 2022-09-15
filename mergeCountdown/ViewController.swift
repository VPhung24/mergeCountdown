//
//  ViewController.swift
//  mergeCountdown
//
//  Created by Vivian Phung on 9/15/22.
//

import UIKit

class ViewController: UIViewController {
    
    let timerLabel: UILabel = {
        let timerLabel = UILabel(frame: .zero)
        timerLabel.translatesAutoresizingMaskIntoConstraints = false
        timerLabel.numberOfLines = 0
        timerLabel.backgroundColor = .white
        timerLabel.font = UIFont(name: "helvetica", size: 60)
        timerLabel.textAlignment = .center
        
        return timerLabel
    }()
    
    var releaseDate: Date = {
        let releaseDateString = "2022-09-15 02:33:00"
        let releaseDateFormatter = DateFormatter()
        releaseDateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        return releaseDateFormatter.date(from: releaseDateString)!
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDownDate), userInfo: nil, repeats: true)
        
        self.view.addSubview(timerLabel)
        
        NSLayoutConstraint.activate([
            timerLabel.leftAnchor.constraint(equalTo: view.leftAnchor),
            timerLabel.rightAnchor.constraint(equalTo: view.rightAnchor),
            timerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            timerLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            timerLabel.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    @objc func countDownDate() {
        let diffDateComponents = NSCalendar.current.dateComponents([.hour, .minute, .second], from: Date(), to: releaseDate)
        
        guard let seconds = diffDateComponents.second, let minute = diffDateComponents.minute else { return }
    
        timerLabel.text = "\(stringNumber(value: minute)):\(stringNumber(value: seconds))"
    }
    
    func stringNumber(value: Int) -> String {
        switch value {
        case ..<10:
            return "0\(value)"
        default:
            return "\(value)"
        }
    }
}

