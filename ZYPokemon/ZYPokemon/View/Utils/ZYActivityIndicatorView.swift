//
//  ZYActivityIndicatorView.swift
//  ZYPokemon
//
//  Created by developer on 2020/9/22.
//  Copyright © 2020 developer. All rights reserved.
//

import SwiftUI
import UIKit

struct ZYActivityIndicatorView: UIViewRepresentable{
    @Binding var isShowing:Bool
    let style:UIActivityIndicatorView.Style
    var color:UIColor? = nil
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ZYActivityIndicatorView>) {
        
        isShowing ? uiView.startAnimating() : uiView.stopAnimating()
    }
    
    func makeUIView(context: UIViewRepresentableContext<ZYActivityIndicatorView>) -> UIActivityIndicatorView {
        let view = UIActivityIndicatorView.init(style: style)
        view.color = color
        return view
    }
    
    
}

 
