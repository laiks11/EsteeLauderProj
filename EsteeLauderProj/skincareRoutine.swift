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
                ZStack {
                    Color(hex: 0xCE3149)
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        Spacer().padding(.vertical).frame(height:250)
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
                                    .fixedSize(horizontal: false, vertical: true)
                                
                                
                                SkinTypeButton(title: "Oily", isSelected: selectedSkinType == "Oily") {
                                    selectedSkinType = "Oily"
                                }
                                .padding(.top)
                                
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
                            }
                            
                            if selectedSkinType != nil && selectedLifestyleFactor != nil {
                                Spacer().frame(height: -200)
                                
                                
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
                                .padding(.bottom, 20.0)
                            }
                            Spacer()
                        }
                    }
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
        ScrollView {
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
            VStack {
                
                Text(lifestyleFactor)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color(hex: 0xCE3149))
                
                Text("Your skincare routine")
                    .font(.title)
                    .fontWeight(.ultraLight)
                    .foregroundColor(Color(hex: 0xCE3149))
                    .padding(.top, 20)
                
                if skinType == "Oily" && lifestyleFactor == "In great condition" {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Morning Routine:")
                            .font(.headline)
                            .foregroundColor(Color(hex: 0xCE3149))
                        Group {
                            Text("1. Cleanse: Estée Lauder Nutritious 2-in-1 Foam Cleanser")
 
                            Text("2. Tone: Estée Lauder Nutritious Radiant Essence Lotion")
                            Text("3. Treat: Estée Lauder Nutritious Super-Pomegranate Radiant Energy Lotion")
                            Text("4. Moisturize: Estée Lauder Nutritious Super-Pomegranate Moisturizer")
                            Text("5. Protect: Estée Lauder DayWear Advanced Multi-Protection Anti-Oxidant Creme SPF 15")
                        }
                        .padding(.leading)
                        
                        Text("Evening Routine:")
                            .font(.headline)
                            .foregroundColor(Color(hex: 0xCE3149))
                        Group {
                            Text("1. Double Cleanse: Estée Lauder Nutritious Micro-Algae Pore Purifying Cleansing Jelly")
                            Text("2. Tone: Estée Lauder Nutritious Radiant Essence Lotion")
                            Text("3. Treat: Estée Lauder Advanced Night Repair Synchronized Multi-Recovery Complex")
                            Text("4. Moisturize: Estée Lauder Nutritious Super-Pomegranate Moisturizer")
                            Text("5. Eye Care: Estée Lauder Advanced Night Repair Eye Supercharged Complex")
                        }
                        .padding(.leading)
                    }
                    .font(.body)
                    .foregroundColor(.black)
                    .padding([.top, .leading, .trailing])
                }
                // Continue with other skin type and lifestyle factor combinations...
 else if skinType == "Oily" && lifestyleFactor == "Dehydrated" {
     VStack(alignment: .leading, spacing: 10) {
         Text("Morning Routine:")
             .font(.headline)
             .foregroundColor(Color(hex: 0xCE3149))
         Group {
             Text("1. Cleanse: Estée Lauder Perfectly Clean Multi-Action Foam Cleanser/Purifying Mask ")
             Text("2. Tone: Estée Lauder Micro Essence Skin Activating Treatment Lotion")
             Text("3. Treat: Estée Lauder Advanced Night Repair Synchronized Multi-Recovery Complex")
             Text("4. Moisturize: Estée Lauder DayWear Matte Oil Control Anti-Oxidant Moisture Gel Creme")
             Text("5. Protect: Estée Lauder Perfectionist Pro Multi-Defense UV Fluid SPF 45")
         }
         .padding(.leading)
         
         Text("Evening Routine:")
             .font(.headline)
             .foregroundColor(Color(hex: 0xCE3149))
         Group {
             Text("1. Double Cleanse: Estée Lauder Take It Away Makeup Remover Lotion + Perfectly Clean Multi-Action Foam Cleanser/Purifying Mask")
             Text("2. Tone: Estée Lauder Micro Essence Skin Activating Treatment Lotion")
             Text("3. Treat: Estée Lauder Advanced Night Repair Synchronized Multi-Recovery Complex ")
             Text("4. Moisturize: Estée Lauder Revitalizing Supreme+ Global Anti-Aging Cell Power Creme")
             Text("5. Estée Lauder Advanced Night Repair Eye Supercharged Complex")
         }
         .padding(.leading)
     }
     .font(.body)
     .foregroundColor(.black)
     .padding([.top, .leading, .trailing])
                        // Custom routine steps for Oily + Dehydrated skin
                    
                } else if skinType == "Oily" && lifestyleFactor == "Lacking sleep" {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Morning Routine:")
                            .font(.headline)
                            .foregroundColor(Color(hex: 0xCE3149))
                        Group {
                            Text("1. Cleanse Estée Lauder Perfectly Clean Foam Cleanser/Purifying Mask")
                            Text("2. Tone: Estée Lauder Nutritious Micro-Algae Pore Minimizing Shake Tonic ")
                            Text("3. Serum: Estée Lauder Advanced Night Repair Synchronized Multi-Recovery Complex")
                            Text("4. Moisturize: Estée Lauder DayWear Anti-Oxidant 24H-Moisture Creme SPF 15")
                            Text("5. Eye Care: Estée Lauder Advanced Night Repair Eye Supercharged Complex")
                        }
                        .padding(.leading)
                        
                        Text("Evening Routine:")
                            .font(.headline)
                            .foregroundColor(Color(hex: 0xCE3149))
                        Group {
                            Text("1. Double Cleanse: Estée Lauder Take It Away Makeup Remover Lotion + Perfectly Clean Foam Cleanser/Purifying Mask")
                            Text("2. Tone: Estée Lauder Nutritious Micro-Algae Pore Minimizing Shake Tonic ")
                            Text("3. Serum: Estée Lauder Advanced Night Repair Synchronized Multi-Recovery Complex")
                            Text("4. Moisturize:  Estée Lauder Revitalizing Supreme+ Global Anti-Aging Cell Power Creme")
                            Text("5. Eye Care: Estée Lauder Advanced Night Repair Eye Supercharged Complex")
                        }
                        .padding(.leading)
                    }
                    .font(.body)
                    .foregroundColor(.black)
                    .padding([.top, .leading, .trailing])
                } else if skinType == "Dry" && lifestyleFactor == "In great condition" {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Morning Routine:")
                            .font(.headline)
                            .foregroundColor(Color(hex: 0xCE3149))
                        Group {
                            Text("1. Cleanse: Estée Lauder Nutritious 2-in-1 Foam Cleanser")
                            Text("2. Tone: Estée Lauder Nutritious Radiant Essence Lotion")
                            Text("3. Treat: Estée Lauder Nutritious Super-Pomegranate Radiant Energy Lotion")
                            Text("4. Moisturize: Estée Lauder Nutritious Super-Pomegranate Moisturizer")
                            Text("5. Protect: Estée Lauder DayWear Advanced Multi-Protection Anti-Oxidant Creme SPF 15")
                        }
                        
                        Text("Evening Routine:")
                            .font(.headline)
                            .foregroundColor(Color(hex: 0xCE3149))
                        Group {
                            Text("1. Double Cleanse: Estée Lauder Nutritious Micro-Algae Pore Purifying Cleansing Jelly")
                            Text("2. Tone: Estée Lauder Nutritious Radiant Essence Lotion")
                            Text("3. Treat: Estée Lauder Advanced Night Repair Synchronized Multi-Recovery Complex")
                            Text("4. Moisturize: Estée Lauder Nutritious Super-Pomegranate Moisturizer")
                            Text("5. Eye Care: Estée Lauder Advanced Night Repair Eye Supercharged Complex")
                        }
                    }
                    .font(.body)
                    .foregroundColor(.black)
                    .padding([.top, .leading, .trailing])
                }
                if skinType == "Dry" && lifestyleFactor == "In great condition" {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Morning Routine:")
                            .font(.headline)
                            .foregroundColor(Color(hex: 0xCE3149))
                        Group {
                            Text("1. Cleanse: Estée Lauder Nutritious Micro-Algae Pore Purifying Cleansing Jelly")
                            Text("2. Tone: Estée Lauder Nutritious Radiant Essence Lotion")
                            Text("3. Serum: Estée Lauder Advanced Night Repair Synchronized Multi-Recovery Complex")
                            Text("4. Moisturize: Estée Lauder Revitalizing Supreme+ Global Anti-Aging Cell Power Creme")
                            Text("5. Protect: Estée Lauder DayWear Advanced Multi-Protection Anti-Oxidant Creme SPF 15")
                        }
                        .padding(.leading)
                        
                        Text("Evening Routine:")
                            .font(.headline)
                            .foregroundColor(Color(hex: 0xCE3149))
                        Group {
                            Text("1. Double Cleanse: Estée Lauder Nutritious Micro-Algae Pore Purifying Cleansing Jelly")
                            Text("2. Tone:  Estée Lauder Nutritious Radiant Essence Lotion")
                            Text("3. Serum: Estée Lauder Advanced Night Repair Synchronized Multi-Recovery Complex")
                            Text("4. Moisturize: Estée Lauder Revitalizing Supreme+ Night Intensive Restorative Creme")
                            Text("5. Eye Care: Estée Lauder Advanced Night Repair Eye Supercharged Complex")
                        }
                        .padding(.leading)
                    }
                    .font(.body)
                    .foregroundColor(.black)
                    .padding([.top, .leading, .trailing])
                }
                if skinType == "Dry" && lifestyleFactor == "Dehydrated" {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Morning Routine:")
                            .font(.headline)
                            .foregroundColor(Color(hex: 0xCE3149))
                        Group {
                            Text("1. Cleanse: Estée Lauder Perfectly Clean Multi-Action Foam Cleanser/Purifying Mask ")
                            Text("2. Tone: EEstée Lauder Micro Essence Skin Activating Treatment Lotion ")
                            Text("3. Serum: Estée Lauder Advanced Night Repair Synchronized Multi-Recovery Complex")
                            Text("4. Moisturize: Estée Lauder Revitalizing Supreme+ Global Anti-Aging Cell Power Creme")
                            Text("5. Nourish: Estée Lauder Nutritious Super-Pomegranate Radiant Energy Lotion Intense Moist")
                        }
                        .padding(.leading)
                        
                        Text("Evening Routine:")
                            .font(.headline)
                            .foregroundColor(Color(hex: 0xCE3149))
                        Group {
                            Text("1. Cleanse: Estée Lauder Perfectly Clean Multi-Action Foam Cleanser/Purifying Mask")
                            Text("2. Tone:   Estée Lauder Micro Essence Skin Activating Treatment Lotion")
                            Text("3. Serum: Estée Lauder Advanced Night Repair Synchronized Multi-Recovery Complex")
                            Text("4. Moisturize: Estée Lauder Revitalizing Supreme+ Night Intensive Restorative Creme")
                            Text("5. Nourish: Estée Lauder Nutritious Super-Pomegranate Radiant Energy Lotion Intense Moist")
                        }
                        .padding(.leading)
                    }
                    .font(.body)
                    .foregroundColor(.black)
                    .padding([.top, .leading, .trailing])
                }
                if skinType == "Dry" && lifestyleFactor == "Lacking sleep" {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Morning Routine:")
                            .font(.headline)
                            .foregroundColor(Color(hex: 0xCE3149))
                        Group {
                            Text("1. Cleanse: Estée Lauder Perfectly Clean Multi-Action Foam Cleanser/Purifying Mask")
                            Text("2. Tone:  Estée Lauder Micro Essence Skin Activating Treatment Lotion")
                            Text("3. Serum: Estée Lauder Advanced Night Repair Synchronized Multi-Recovery Complex")
                            Text("4. Moisturize: Estée Lauder Revitalizing Supreme+ Global Anti-Aging Cell Power Creme")
                            Text("5. Illuminate: Estée Lauder Advanced Night Repair Intense Reset Concentrate")
                        }
                        .padding(.leading)
                        
                        Text("Evening Routine:")
                            .font(.headline)
                            .foregroundColor(Color(hex: 0xCE3149))
                        Group {
                            Text("Follow the same routine for evening!")
                        }
                        .padding(.leading)
                    }
                    .font(.body)
                    .foregroundColor(.black)
                    .padding([.top, .leading, .trailing])
                }
                if skinType == "Combination" && lifestyleFactor == "In great condition" {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Morning Routine:")
                            .font(.headline)
                            .foregroundColor(Color(hex: 0xCE3149))
                        Group {
                            Text("1. Cleanse: Estée Lauder Perfectly Clean Multi-Action Foam Cleanser/Purifying Mask")
                            Text("2. Tone: Estée Lauder Micro Essence Skin Activating Treatment Lotion")
                            Text("3. Serum: Estée Lauder Advanced Night Repair Synchronized Multi-Recovery Complex")
                            Text("4. Moisturize: Estée Lauder DayWear Matte Oil-Control Anti-Oxidant Moisture Gel Creme")
                            Text("5. Protect:  Estée Lauder DayWear Advanced Multi-Protection Anti-Oxidant Creme SPF 15")
                        }
                        .padding(.leading)
                        
                        Text("Evening Routine:")
                            .font(.headline)
                            .foregroundColor(Color(hex: 0xCE3149))
                        Group {
                            Text("1. Cleanse: Estée Lauder Perfectly Clean Multi-Action Foam Cleanser/Purifying Mask")
                            Text("2. Tone:   Estée Lauder Micro Essence Skin Activating Treatment Lotion")
                            Text("3. Serum: Estée Lauder Advanced Night Repair Synchronized Multi-Recovery Complex")
                            Text("4. Moisturize: Estée Lauder Revitalizing Supreme+ Global Anti-Aging Cell Power Creme")
                        }
                        .padding(.leading)
                    }
                    .font(.body)
                    .foregroundColor(.black)
                    .padding([.top, .leading, .trailing])
                }
                if skinType == "Combination" && lifestyleFactor == "Dehydrated" {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Morning Routine:")
                            .font(.headline)
                            .foregroundColor(Color(hex: 0xCE3149))
                        Group {
                            Text("1. Cleanse: Estée Lauder Nutritious 2-in-1 Foam Cleanser")
                            Text("2. Tone:  Estée Lauder Micro Essence Skin Activating Treatment Lotion")
                            Text("3. Serum: Estée Lauder Advanced Night Repair Synchronized Multi-Recovery Complex ")
                            Text("4. Moisturize: Estée Lauder Revitalizing Supreme+ Global Anti-Aging Cell Power Creme")
                            Text("5. Hydrating Mist: Estée Lauder Set + Refresh Perfecting Makeup Mist")
                        }
                        .padding(.leading)
                        
                        Text("Evening Routine:")
                            .font(.headline)
                            .foregroundColor(Color(hex: 0xCE3149))
                        Group {
                            Text("1. Cleanse: Estée Lauder Nutritious 2-in-1 Foam Cleanser")
                            Text("2. Tone: Estée Lauder Micro Essence Skin Activating Treatment Lotion")
                            Text("3. Serum: Estée Lauder Advanced Night Repair Synchronized Multi-Recovery Complex")
                            Text("4. Moisturize: Estée Lauder Revitalizing Supreme+ Night Intensive Restorative Creme")
                            Text("5. Overnight Mask: Estée Lauder Nutritious Super-Pomegranate Radiant Energy Overnight Mask")
                        }
                        .padding(.leading)
                    }
                    .font(.body)
                    .foregroundColor(.black)
                    .padding([.top, .leading, .trailing])
                }
                
                if skinType == "Combination" && lifestyleFactor == "Lacking sleep" {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Morning Routine:")
                            .font(.headline)
                            .foregroundColor(Color(hex: 0xCE3149))
                        Group {
                            Text("1. Cleanse: Estée Lauder Perfectly Clean Multi-Action Foam Cleanser/Purifying Mask ")
                            Text("2. Tone: Estée Lauder Micro Essence Skin Activating Treatment Lotion")
                            Text("3. Serum: Estée Lauder Advanced Night Repair Intense Reset Concentrate")
                            Text("4. Moisturize:  Estée Lauder Revitalizing Supreme+ Global Anti-Aging Cell Power Creme")
                            Text("5. Illuminating Primer: Estée Lauder The Illuminator Radiant Perfecting Primer + Finisher")
                        }
                        .padding(.leading)
                        
                        Text("Evening Routine:")
                            .font(.headline)
                            .foregroundColor(Color(hex: 0xCE3149))
                        Group {
                            Text("1. Cleanse: Estée Lauder Perfectly Clean Multi-Action Foam Cleanser/Purifying Mask")
                            Text("2. Tone:   Estée Lauder Micro Essence Skin Activating Treatment Lotion")
                            Text("3. Serum: Estée Lauder Advanced Night Repair Intense Reset Concentrate")
                            Text("4. Moisturize: Estée Lauder Revitalizing Supreme+ Night Intensive Restorative Creme")
                            Text("5. Radiant Overnight Mask: Estée Lauder Nutritious Super-Pomegranate Radiant Energy Overnight Mask")
                        }
                        .padding(.leading)
                    }
                    .font(.body)
                    .foregroundColor(.black)
                    .padding([.top, .leading, .trailing])
                }
                // Continue with other skin type and lifestyle factor combinations...
                else {
                    Text("")
                }

                
                Spacer()
            }
        }
    }
    
    
    
    
    struct LogoView: View {
        var body: some View {
            Text("Logo View")
                .font(.title)
                .foregroundColor(.white)
        }
    }
  

    
    struct SkincareRoutine_Previews: PreviewProvider {
        static var previews: some View {
            SkincareRoutine()
        }
    }
    
}
