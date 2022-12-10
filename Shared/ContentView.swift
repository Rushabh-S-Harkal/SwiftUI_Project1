//
//  ContentView.swift
//  Shared
//
//  Created by Rushabh on 11/19/22.
//

import SwiftUI


extension Image {
    func imageModifier() -> some View {
        self
            .resizable()
            .scaledToFit()
    }
    
    func iconModifier() -> some View {
        self
            .imageModifier()
            .frame(minWidth: 40, idealWidth: 50, maxWidth: 100, minHeight: 40, idealHeight: 50, maxHeight: 100, alignment: .center)
            .foregroundColor(.purple)
            .opacity(0.5)
    }
}

struct ContentView: View {
    
  
    
    private let imageUrl:String = "https://images.pexels.com/photos/1198802/pexels-photo-1198802.jpeg?auto=compress&cs=tinysrgb&w=400"
    
    var body: some View {
        
        //        mark : - Image
        //  AsyncImage.init(url: URL(string: imageUrl))
        
        // mark : image with scale modifier
        //AsyncImage.init(url: URL(string: imageUrl), scale: 0.35)
        
        // mark : image with placeholder
//        AsyncImage.init(url: URL(string: imageUrl)) { Image in
//            Image
//                .resizable()
//                .scaledToFit()
//
//        } placeholder: {
//            Image(systemName: "photo.circle.fill")
//                .resizable()
//                .scaledToFit()
//
//        }
//        .padding(40)
        
      //   mark : image with placeholder and use extension for modifiers
//        AsyncImage.init(url: URL(string: imageUrl)) { Image in
//            Image.imageModifier()
//
//        } placeholder: {
//            Image(systemName: "photo.circle.fill")
//                .iconModifier()
//
//        }
//        .padding(40)
        
        
        // mark : image with phases
        //.success,.fail
        // state of loading image
        
//        AsyncImage.init(url: URL(string: imageUrl)) { phase in
//            // Success : image is doumloaded successfully
//            // Failure : image is not download due to invalid url/server down then
//            // Empty : when there is no image then
//            phase
//            if let image = phase {
//                image.imageModifier()
//            }
//            else if phase.error != nil {
//                Image(systemName: "ant.circle.fill")
//            }
//        } placeholder: {
//            Image(systemName: "photo.circle.fill")
//        }

        AsyncImage(url: URL(string: imageUrl)) { phase in
            if let image = phase.image {
                image.imageModifier() // Displays the loaded image.
            } else if phase.error != nil {
                Image(systemName: "ant.circle.fill").iconModifier() // Indicates an error.
            } else {
                Color.blue // Acts as a placeholder.
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            
        }
    }
}
