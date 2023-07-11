//
//  homePage.swift
//  EsteeLauderProj
//
//  Created by Laika Patel on 7/7/23.
//

import SwiftUI
import AVKit

struct homePage: View {
    @State private var selectedImage: String = "mainimage"

    
    let galleryImages: [String] = [
        "image1",
        "image2",
        "image3",
        "image4",
        "image5"
    ]
    let ingredientList = [
        "skin-LOVING care",
        "92%+ NATURALLY derived ingredients",
        "responsibly-sourced SKIN-ESSENTIAL nutrients",
        "NUTRI-9 COMPLEX",
        "SWEET KELP",
        "RED ALGAE ferment",
        "COCONUT WATER ferment"
    ]
    let madeWithoutList = [
        "animal-derived ingredients",
        "fragrance",
        "silicone",
        "synthetic colors",
        "mineral oil",
        "sulfates",
        "sulfite",
        "drying alcohol"
    ]
    var body: some View {
        NavigationView {
            ScrollView {
                
                VStack {
                    logoView()
                        .padding(.vertical)
                    
                    
                    Text("SHOP THE NUTRITIOUS LINE")
                        .font(.title)
                        .fontWeight(.light)
                        .foregroundColor(Color(hex: 0xCE3149))
                        .padding(.vertical)
                    
                    Image(selectedImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 300)
                        .padding()
                    
                    HStack(spacing: 10) {
                        ForEach(galleryImages, id: \.self) { imageName in
                            Button(action: {
                                selectedImage = imageName
                            }) {
                                Image(imageName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 50, height: 50)
                                    .clipShape(Circle())
                                    .overlay(
                                        Circle()
                                            .stroke(selectedImage == imageName ? Color.blue : Color.clear, lineWidth: 2)
                                    )
                            }
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        Text("If your skin is grumpy, dull and irritable, you’re holding the right set. Featuring naturally-derived ingredients: Sweet Kelp, Red Algae Ferment and Coconut Water Ferment. 2-in-1 Foam Cleanser purifies. Cushioning Essence Lotion preps skin for regimen. Delivers a hydrating infusion. Awakens. Balances. Calms. Pillowy Creme/Mask melts into skin. Comfortable, cushy feel. Renews. Strengthens. Show your skin some love with peak performance skincare.")
                            .font(.body)
                            .fontWeight(.regular)
                            .foregroundColor(Color(hex: 0xCE3149))
                            .multilineTextAlignment(.center)
                            .padding(.all)
                        
                        NavigationLink(destination: skincareRoutine()) {
                            Rectangle()
                                .fill(Color(hex: 0xCE3149))
                                .frame(width: 350, height: 70) // Adjust the width and height as desired
                                .overlay(Text("Click here to discover YOUR personalized skincare routine")
                                    .foregroundColor(.white)
                                    .font(.headline))
                        }
                        .padding(.leading)
                    }
                    .padding(.leading)
                    
                    VStack(alignment: .leading) {
                        Text("Made WITH")
                            .font(.title)
                            .fontWeight(.ultraLight)
                            .foregroundColor(Color(hex: 0xCE3149))
                            .multilineTextAlignment(.leading)
                            .padding([.top, .leading])
                        
                        ForEach(ingredientList, id: \.self) { ingredient in
                            HStack(spacing: 10) {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(Color(hex: 0xCE3149))
                                Text(ingredient)
                            }
                            .padding(.vertical, 5)
                        }
                        .padding(.leading)
                        
                        
                        
                        Text("Made WITHOUT")
                            .font(.title)
                            .fontWeight(.ultraLight)
                            .foregroundColor(Color(hex: 0xCE3149))
                            .multilineTextAlignment(.leading)
                            .padding(.leading)
                        
                        ForEach(madeWithoutList, id: \.self) { ingredient in
                            HStack(spacing: 10) {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(Color(hex: 0xCE3149))
                                Text(ingredient)
                            }
                            .padding(.vertical, 5)
                        }
                        .padding(.leading)
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                    VStack {
                        videoView(videoID: "DAHWftZAgE0")
                        
                    }
                    
                    VStack {
                        Text("Customer Reviews")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color(hex: 0xCE3149))
                            .padding(.vertical, 16)
                        
                        reviewSection(rating: 5, title: "2-in-1 Foam Cleanser", reviewText: "The Nutritious 2-in-1 Cleanser boasts a rich and creamy consistency that feels indulgent during application. Its pleasant fragrance is both refreshing and invigorating, making my skincare routine a delightful experience. I appreciate that it lathers up easily, allowing me to massage it gently onto my face and neck, effectively dissolving impurities.", reviewer: "DV")
                            .padding(.horizontal)
                        
                        reviewSection(rating: 5, title: "Radiant Essence Lotion", reviewText: "I am so glad I purchased it. I have been using it for approx. 3-4 weeks and I am in love. I am a fan for life. It feels great when applying, My skin is now hydrated, with no flakes, no tightness. It also seems bouncy and my lines seem to have diminished. I also love the cleanser. When used together they make a great duo!", reviewer: "BRITCHIC")
                            .padding(.horizontal)
                        
                        reviewSection(rating: 5, title: "Melting Soft Creme/Mask", reviewText: "Estée Lauder Nutritious Melting Soft Creme/ Mask is a luxurious spa day for the face. It is light, creamy, and absorbs fast. My skin feels super hydrated and looks more smooth. I like that this product is unscented and feel it would be a good fit for any skin type. I would recommend and purchase Estée Lauder Nutritious Melting Soft Creme/ Mask.", reviewer: "AURELIA")
                            .padding(.horizontal)
                        NavigationLink(destination: skincareRoutine()) {
                            Rectangle()
                                .fill(Color(hex: 0xCE3149))
                                .frame(width: 360, height: 70) // Adjust the width and height as desired
                                .overlay(Text("Haven't taken the test yet? Go now")
                                    .foregroundColor(.white)
                                    .font(.headline))
                        }
                    }
                
                    
                }
                    
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .navigationBarTitleDisplayMode(.inline)
                }
            }
        }
    }


    struct homePage_Previews: PreviewProvider {
        static var previews: some View {
            homePage()
        }
    }

