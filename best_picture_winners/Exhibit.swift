import SwiftUI

struct FilmExhibit: View {
    let filmName: String
    let filmImage: ImageResource
    let filmAbout: String
    
    var body: some View {
        HStack(alignment: .top) {
            Image(filmImage)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 150)
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 10) {
                Text(filmName)
                    .font(.title)
                    .fontWeight(.bold)
                
                Text(filmAbout)
                    .font(.body)
                    .lineLimit(5)
                    .truncationMode(.tail)
            }
            .padding(.leading, 10)
        }
        .padding()
    }
}

#Preview {
    FilmExhibit(filmName: "Crash",
                filmImage: .crash,
                filmAbout: "Crash is a drama that explores racial tensions in Los Angeles through a series of interconnected stories."
                )
}

