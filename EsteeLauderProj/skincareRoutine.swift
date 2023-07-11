//
//  SkincareRoutine.swift
//  EsteeLauderProj
//
//  Created by Laika Patel on 7/11/23.
//
import SwiftUI

struct SkincareRoutine: View {
    @State private var selectedSkinType: String?
    @State private var selectedLifestyleFactor: String?
    @State private var showRecommendedRoutine = false
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Spacer().frame(height: 10)
                VStack {
                    logoView()
                        .padding(.vertical)
                   
                    if selectedSkinType == nil {
                        Text("Choose a word that best describes your skin")
                            .font(.largeTitle)
                            .fontWeight(.ultraLight)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding(.bottom, 20)
                        Spacer().frame(height: 10)

                        
                        SkinTypeButton(title: "Oily", isSelected: selectedSkinType == "Oily") {
                            selectedSkinType = "Oily"
                        }
                        
                        SkinTypeButton(title: "Dry", isSelected: selectedSkinType == "Dry") {
                            selectedSkinType = "Dry"
                        }
                        
                        SkinTypeButton(title: "Combination", isSelected: selectedSkinType == "Combination") {
                            selectedSkinType = "Combination"
                        }
                    }
                    else if selectedLifestyleFactor == nil {
                        Text("I am...")
                            .font(.largeTitle)
                            .fontWeight(.ultraLight)
                            .foregroundColor(.white)
                            .padding(.bottom, 20)
                        
                        LifestyleFactorButton(title: "In great condition", isSelected: selectedLifestyleFactor == "In great condition") {
                            selectedLifestyleFactor = "In great condition"
                        }
                        
                        LifestyleFactorButton(title: "Dehydrated", isSelected: selectedLifestyleFactor == "Dehydrated") {
                            selectedLifestyleFactor = "Dehydrated"
                        }
                        
                        LifestyleFactorButton(title: "Lacking sleep", isSelected: selectedLifestyleFactor == "Lacking sleep") {
                            selectedLifestyleFactor = "Lacking sleep"
                        }
                    } else {
                        Text("Your skin is")
                            .font(.largeTitle)
                            .fontWeight(.ultraLight)
                            .foregroundColor(Color(hex: 0xCE3149))
                            .padding(.top, 20)
                        
                        Text(selectedSkinType ?? "")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color(hex: 0xCE3149))
                        
                        Text("You are")
                            .font(.title)
                            .fontWeight(.ultraLight)
                            .foregroundColor(Color(hex: 0xCE3149))
                            .padding(.top, 20)
                        
                        Text(selectedLifestyleFactor ?? "")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color(hex: 0xCE3149))
                        
                        Text("Your skincare routine")
                            .font(.title)
                            .fontWeight(.ultraLight)
                            .foregroundColor(Color(hex: 0xCE3149))
                            .padding(.top, 20)
                        
                        // Display the personalized routine based on skin type and lifestyle factor
                        // You can customize this part to include the specific recommendations based on the user's selections
                    }
                    if selectedSkinType != nil && selectedLifestyleFactor != nil {
                        Text("GET")
                            .font(.title)
                            .fontWeight(.ultraLight)
                            .foregroundColor(.white)
                            .padding(.vertical, 20)
                        Text("READY")
                            .font(.title)
                            .fontWeight(.ultraLight)
                            .foregroundColor(.white)
                            .padding(.vertical, 20)
                        Text("TO")
                            .font(.title)
                            .fontWeight(.ultraLight)
                            .foregroundColor(.white)
                            .padding(.vertical, 20)
                        Text("SCREENSHOT!")
                            .font(.title)
                            .fontWeight(.ultraLight)
                            .foregroundColor(.white)
                            .padding(.vertical, 20)
                        Spacer()
                        Button(action: {
                            showRecommendedRoutine = true
                        }) {
                            Text("Continue")
                                .foregroundColor(.white)
                                .font(.headline)
                                .padding()
                                .background(Color(hex: 0xE17C8C))
                                .cornerRadius(10)
                        }
                   
                        .padding(.bottom, 20)
                    }
                }
                Spacer().frame(height: 300)
                .padding(.horizontal)
            }
            
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(hex: 0xCE3149))
            .edgesIgnoringSafeArea(.all)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .sheet(isPresented: $showRecommendedRoutine) {
            RecommendedRoutineView(
                skinType: selectedSkinType ?? "",
                lifestyleFactor: selectedLifestyleFactor ?? ""
            )
        }
    }
}

struct SkinTypeButton: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            RoundedRectangle(cornerRadius: 0)
                .stroke(Color(hex: 0xF8F1F3), lineWidth: 2)
                .frame(height: 50)
                .overlay(
                    Text(title)
                        .foregroundColor(.white)
                        .font(.headline)
                )
        }
        .padding([.leading, .bottom, .trailing])
    }
}


struct LifestyleFactorButton: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            RoundedRectangle(cornerRadius: 0)
                .stroke(Color(hex: 0xF8F1F3), lineWidth: 2)
                .frame(height: 50)
                .overlay(
                    Text(title)
                        .foregroundColor(.white)
                        .font(.headline)
                )
        }
        .padding([.leading, .bottom, .trailing])
    }
}

struct RecommendedRoutineView: View {
    let skinType: String
    let lifestyleFactor: String
    
    var body: some View {
        VStack {
            Text("Your skin is")
                .font(.largeTitle)
                .fontWeight(.ultraLight)
                .foregroundColor(Color(hex: 0xCE3149))
                .padding(.top, 20)
            
            Text(skinType)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color(hex: 0xCE3149))
            
            Text("You are")
                .font(.title)
                .fontWeight(.ultraLight)
                .foregroundColor(Color(hex: 0xCE3149))
                .padding(.top, 20)
            
            Text(lifestyleFactor)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color(hex: 0xCE3149))
            
            Text("Your skincare routine")
                .font(.title)
                .fontWeight(.ultraLight)
                .foregroundColor(Color(hex: 0xCE3149))
                .padding(.top, 20)
            
            // Display the personalized routine based on skin type and lifestyle factor
            // You can customize this part to include the specific recommendations based on the user's selections
            
            
            }
       
            Spacer()
        }
    
    }


struct LogoView: View {
    var body: some View {
        Text("Logo View")
            // Replace with appropriate styling for your logo view
            .font(.title)
            .foregroundColor(.white)
    }
}

struct SkincareRoutine_Previews: PreviewProvider {
    static var previews: some View {
        SkincareRoutine()
    }
}

