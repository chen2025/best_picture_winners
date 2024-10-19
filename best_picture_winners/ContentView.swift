import SwiftUI

struct ContentView: View {
    @State private var textYear: String = "2005"
    @State private var doubleYear: Double = 2005
    @State private var selectedFilm: Film? = Film.film_2005


    var body: some View {
        VStack(spacing: 20) {
            Text("Oscar Best Picture Winner Finder")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding(.top)
                            .multilineTextAlignment(.center)
            
            TextField("Enter a year", text: $textYear)
                .keyboardType(.numberPad)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal)
                .onChange(of: textYear) { newValue in
                    if let year = Double(newValue), year >= 2005, year <= 2023 {
                        doubleYear = year
                    }
                }
            
            Slider(value: $doubleYear, in: 2005...2023, step: 1)
                .padding(.horizontal)
                .onChange(of: doubleYear) { newValue in
                    textYear = String(Int(newValue))
                }
            
            Button("Fetch Film") {
                selectedFilm = fetchFilm(for: textYear)
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
            
            if let film = selectedFilm {
                FilmExhibit(filmName: film.name,
                            filmImage: film.image,
                            filmAbout: film.about)
                    .transition(.slide)
                    .padding(.top, 20)
            } else {
                Text("Enter a year between 2005 and 2023 to see the Oscar Best Picture winner")
                    .padding(.top, 20)
            }
        }
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

#Preview {
    ContentView()
}
