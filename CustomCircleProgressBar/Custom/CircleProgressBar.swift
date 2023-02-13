//
//  CircleProgressBar.swift
//  CustomCircleProgressBar
//
//  Created by jongmin.lee on 2023/02/13.
//

import UIKit

@IBDesignable
final class CircleProgressBar: UIView {
  @IBInspectable var trackTintColor: UIColor = UIColor.systemGray4
  @IBInspectable var progressTintColor: UIColor = UIColor.blue
  @IBInspectable var progress: CGFloat = 0.75 {
    didSet {
      // 1보다 큰 경우 100% 기준으로 progress를 그린다.
      if progress > 1 {
        progress = (progress / 100.0)
      }
      setProgress(self.bounds)
    }
  }
  @IBInspectable var lineWidth: CGFloat = 10 {
    didSet {
      if lineWidth == 0 {
        lineWidth = 1
      }
    }
  }
  private var progressLayer: CAShapeLayer?
  private var startPoint = CGFloat(-Double.pi / 2)
  private var endPoint = CGFloat(3 * Double.pi / 2)
  
  // Draw defualt ui
  override func draw(_ rect: CGRect) {
    let bezierPath = UIBezierPath()
    bezierPath.addArc(withCenter: CGPoint(x: rect.midX, y: rect.midY),
                      radius: min(rect.midX, rect.midY) - (lineWidth / 2),
                      startAngle: startPoint,
                      endAngle: endPoint,
                      clockwise: true)
    
    bezierPath.lineWidth = lineWidth
    trackTintColor.set()
    bezierPath.stroke()
  }
  // Draw progress ui
  private func setProgress(_ rect: CGRect) {
    if progressLayer == nil {
      let progressLayer = CAShapeLayer()
      self.progressLayer = progressLayer
      self.layer.addSublayer(progressLayer)
    }
    
    let bezierPath = UIBezierPath()
    bezierPath.addArc(withCenter: CGPoint(x: rect.midX, y: rect.midY),
                      radius: min(rect.midX, rect.midY) - (lineWidth / 2),
                      startAngle: startPoint,
                      endAngle: endPoint,
                      clockwise: true)
    
    progressLayer?.path = bezierPath.cgPath
    progressLayer?.lineCap = .round
    progressLayer?.strokeColor = progressTintColor.cgColor
    progressLayer?.fillColor = UIColor.clear.cgColor
    progressLayer?.lineWidth = lineWidth
    progressLayer?.strokeEnd = progress
    progressLayer?.setNeedsDisplay()
  }
  
  func animateProgressLayer() {
    let progressAnimation = CABasicAnimation(keyPath: "strokeEnd")
    progressAnimation.fromValue = 0
    progressAnimation.toValue = progress
    progressAnimation.repeatCount = 1
    progressAnimation.duration = 0.7
    progressAnimation.isRemovedOnCompletion = false
    progressAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
    
    progressLayer?.add(progressAnimation, forKey: "progressAnimation")
  }
}
