//
//  ProgressCell.swift
//  CustomCircleProgressBar
//
//  Created by jongmin.lee on 2023/02/13.
//

import UIKit

final class CircleProgressCell: UITableViewCell {
  private lazy var circleProgress: CircleProgressBar = {
    let progressBar = CircleProgressBar(frame: .zero)
    progressBar.backgroundColor = .white
    progressBar.translatesAutoresizingMaskIntoConstraints = false
    return progressBar
  }()
  
  required init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    addViews()
  }
  
  private func addViews() {
    contentView.addSubview(circleProgress)
    
    NSLayoutConstraint.activate([
      circleProgress.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
      circleProgress.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      circleProgress.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      circleProgress.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
      circleProgress.heightAnchor.constraint(equalToConstant: 100),
      circleProgress.widthAnchor.constraint(equalToConstant: 100)
    ])
  }
  
  func setProgress(progress: Int) {
    circleProgress.progress = CGFloat(progress)
    circleProgress.animateProgressLayer()
  }
  
  func setProgress(progress: CGFloat) {
    circleProgress.progress = progress
    circleProgress.animateProgressLayer()
  }
}
