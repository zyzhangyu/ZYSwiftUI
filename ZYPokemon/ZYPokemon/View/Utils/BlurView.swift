//
//  BlurView.swift
//  ZYPokemon
//
//  Created by developer on 2020/9/21.
//  Copyright © 2020 developer. All rights reserved.
//

import SwiftUI
import UIKit
struct BlurView: UIViewRepresentable {
    
    let style:UIBlurEffect.Style

    func updateUIView(_ uiView: UIView, context:  UIViewRepresentableContext<BlurView>) {
        
    }
    
    
    
    func makeUIView(context: UIViewRepresentableContext<BlurView>) ->  UIView {
        let view = UIView.init(frame: .zero)
        view.backgroundColor = .clear
        
        let blurEffect = UIBlurEffect.init(style: style)
        let blurView = UIVisualEffectView.init(effect: blurEffect)
        
        blurView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(blurView)
        
        NSLayoutConstraint.activate([
            blurView.heightAnchor.constraint(equalTo: view.heightAnchor),
            blurView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        return view
    }
   
     
}

 
extension View {
    func blurBackground(style:UIBlurEffect.Style) -> some View {
        ZStack {
            BlurView.init(style: style)
            self
        }
    }
}
