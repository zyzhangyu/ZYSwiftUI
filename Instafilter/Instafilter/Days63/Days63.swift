//
//  Days63.swift
//  Instafilter
//
//  Created by developer on 2020/9/11.
//  Copyright © 2020 developer. All rights reserved.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins
struct Days63: View {
    
    @State private var image: Image?

    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
        }
        .onAppear(perform: loadImage)
        
        
    }
    
    func loadImage() {
        guard let inputImage = UIImage(named: "santorini") else { return }
        let beginImage = CIImage(image: inputImage)
        let context = CIContext()
        let currentFilter = CIFilter.sepiaTone()
        currentFilter.inputImage = beginImage
        currentFilter.intensity = 1
 
        guard let outputImage = currentFilter.outputImage else { return }

        // attempt to get a CGImage from our CIImage
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            // convert that to a UIImage
            let uiImage = UIImage(cgImage: cgimg)

            // and convert that to a SwiftUI image
            image = Image(uiImage: uiImage)
        }
        
    }
}

struct Days63_Previews: PreviewProvider {
    static var previews: some View {
        Days63()
    }
}
