import SwiftUI

struct ContentView: View {
    @State private var textYear: String = "2005"
    @State private var doubleYear: Double = 2005
    @State private var selectedFilm: Film? = Film.film_2005
    @State private var showFilm: Bool = false

    var body: some View {
        VStack(spacing: 20) {
            // Header
            Text("Oscar Best Picture Winners")
                .font(.system(size: 32, weight: .bold))
                .foregroundColor(.white)
                .padding(.top, 40)
                .multilineTextAlignment(.center)
                .shadow(radius: 5)
            
            // Year Input Field (Bubble Style)
            TextField("Enter a year", text: $textYear)
                .keyboardType(.numberPad)
                .padding()
                .frame(width: 150) // Restrict width of the bubble
                .background(Color(.systemGray6))
                .cornerRadius(30) // Make the bubble rounded
                .shadow(color: .gray.opacity(0.4), radius: 5, x: 0, y: 3)
                .padding(.horizontal)
                .multilineTextAlignment(.center) // Center the text within the bubble
                .onChange(of: textYear) { newValue in
                    if let year = Double(newValue), year >= 2005, year <= 2023 {
                        doubleYear = year
                    }
                }

            // Year Slider
            Slider(value: $doubleYear, in: 2005...2023, step: 1)
                .accentColor(Color.purple)
                .padding(.horizontal)
                .onChange(of: doubleYear) { newValue in
                    withAnimation(.easeInOut) {
                        textYear = String(Int(newValue))
                    }
                }
            
            // Fetch Film Button
            Button(action: {
                withAnimation(.easeInOut(duration: 0.6)) {
                    selectedFilm = fetchFilm(for: textYear)
                    showFilm = true
                }
            }) {
                Text("Find Best Picture")
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .leading, endPoint: .trailing))
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .scaleEffect(showFilm ? 1.1 : 1.0)
            }
            .padding(.horizontal)
            .shadow(color: .purple.opacity(0.3), radius: 5, x: 0, y: 3)
            .animation(.spring(response: 0.4, dampingFraction: 0.6, blendDuration: 0.6), value: showFilm)

            // Display Selected Film
            if let film = selectedFilm, showFilm {
                FilmExhibit(filmName: film.name,
                            filmImage: film.image,
                            filmAbout: film.about)
                    .transition(.scale(scale: 0.9).combined(with: .opacity))
                    .padding(.top, 20)
                    .animation(.easeInOut(duration: 0.5), value: showFilm)
            } else {
                Text("Enter a year between 2005 and 2023 to see the Oscar Best Picture winner.")
                    .font(.footnote)
                    .foregroundColor(.white.opacity(0.7))
                    .padding(.top, 20)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }
            
            Spacer() // To push content to the top
        }
        .padding(.bottom, 40)
        .background(
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.6), Color.purple.opacity(0.6)]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            .ignoresSafeArea()
        )
    }

    func fetchFilm(for year: String) -> Film? {
        let filmCaseName = "film_\(year)"
        
        if let filmCase = Film(rawValue: filmCaseName) {
            return filmCase
        } else {
            return nil
        }
    }
}

// Preview
#Preview {
    ContentView()
}
