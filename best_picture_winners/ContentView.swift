import SwiftUI

/// The main view that displays the Oscar Best Picture winners by year and allows users to select a year to fetch the film information.
struct ContentView: View {
    @State private var textYear: String = "2005"     // The input for the year in text form.
    @State private var doubleYear: Double = 2005     // The input for the year in slider form.
    @State private var selectedFilm: Film? = Film.film_2005  // The currently selected film.
    @State private var showFilm: Bool = false        // Tracks whether the film details should be shown.

    var body: some View {
        VStack(spacing: 20) {
            // Header
            Text("Oscar Best Picture Winners")
                .font(.system(size: 32, weight: .bold))  // Large bold title.
                .foregroundColor(.white)                 // White text color for the title.
                .padding(.top, 40)                       // Padding from the top of the screen.
                .multilineTextAlignment(.center)         // Center-align the text.
                .shadow(radius: 5)                       // Adds a shadow for the text.
            
            // Year Input Field (Bubble Style)
            TextField("Enter a year", text: $textYear)
                .keyboardType(.numberPad)                // Restricts input to numbers.
                .padding()                               // Adds padding inside the text field.
                .frame(width: 150)                       // Restrict the width of the bubble.
                .background(Color(.systemGray6))         // Light gray background color for the text field.
                .cornerRadius(30)                        // Rounded corners for the bubble effect.
                .shadow(color: .gray.opacity(0.4), radius: 5, x: 0, y: 3)  // Adds a shadow to the bubble.
                .padding(.horizontal)                    // Padding around the bubble.
                .multilineTextAlignment(.center)         // Center-aligns the text inside the bubble.
                .onChange(of: textYear) { newValue in
                    if let year = Double(newValue), year >= 2005, year <= 2023 {
                        doubleYear = year                // Sync the text input with the slider.
                    }
                }

            // Year Slider
            Slider(value: $doubleYear, in: 2005...2023, step: 1)
                .accentColor(Color.purple)               // Custom color for the slider.
                .padding(.horizontal)                    // Padding for the slider.
                .onChange(of: doubleYear) { newValue in
                    withAnimation(.easeInOut) {          // Smooth animation when changing the slider.
                        textYear = String(Int(newValue)) // Sync the slider with the text input.
                    }
                }
            
            // Fetch Film Button
            Button(action: {
                withAnimation(.easeInOut(duration: 0.6)) {  // Smooth animation when fetching the film.
                    selectedFilm = fetchFilm(for: textYear)  // Fetch the selected film based on the year.
                    showFilm = true                         // Display the film information.
                }
            }) {
                Text("Find Best Picture")                // Button label.
                    .fontWeight(.bold)                   // Bold font for the button label.
                    .frame(maxWidth: .infinity)          // Makes the button take full width.
                    .padding()                           // Padding inside the button.
                    .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .leading, endPoint: .trailing))  // Gradient background.
                    .foregroundColor(.white)             // White text color for the button.
                    .cornerRadius(12)                    // Rounded corners for the button.
                    .scaleEffect(showFilm ? 1.1 : 1.0)   // Button scales slightly if a film is shown.
            }
            .padding(.horizontal, 40)                    // Padding on both sides of the button (so it doesn't take up the full screen).
            .shadow(color: .purple.opacity(0.3), radius: 5, x: 0, y: 3) // Shadow for the button.
            .animation(.spring(response: 0.4, dampingFraction: 0.6, blendDuration: 0.6), value: showFilm)  // Spring animation when the button is pressed.

            // Display Selected Film
            if let film = selectedFilm, showFilm {
                FilmExhibit(filmName: film.name,
                            filmImage: film.image,
                            filmAbout: film.about)
                    .transition(.scale(scale: 0.9).combined(with: .opacity))  // Smooth transition effect when showing the film.
                    .padding(.top, 20)                // Padding from the top.
                    .animation(.easeInOut(duration: 0.5), value: showFilm)  // Ease in/out animation when the film appears.
            } else {
                // Message prompting user to enter a valid year.
                Text("Enter a year between 2005 and 2023 to see the Oscar Best Picture winner.")
                    .font(.footnote)                   // Small font size for the message.
                    .foregroundColor(.white.opacity(0.7)) // Lightened white text.
                    .padding(.top, 20)                 // Padding from the top.
                    .multilineTextAlignment(.center)   // Center-align the text.
                    .padding(.horizontal)              // Padding on the sides.
            }
            
            Spacer() // To push content to the top.
        }
        .padding(.bottom, 40)  // Adds padding at the bottom to make room for the content.
        .background(
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.6), Color.purple.opacity(0.6)]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)  // Gradient background for the entire screen.
            .ignoresSafeArea()  // Ensures the gradient background covers the entire safe area.
        )
    }

    /// Fetches the film corresponding to the provided year.
    /// - Parameter year: The year in string format.
    /// - Returns: A `Film?` representing the Best Picture winner for the provided year, or `nil` if the year is invalid.
    func fetchFilm(for year: String) -> Film? {
        let filmCaseName = "film_\(year)"
        
        if let filmCase = Film(rawValue: filmCaseName) {
            return filmCase  // Return the film if it matches the year.
        } else {
            return nil       // Return nil if no film is found for the year.
        }
    }
}

// Preview
#Preview {
    ContentView()  // Preview of the ContentView.
}
