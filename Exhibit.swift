import SwiftUI

struct FilmExhibit: View {
    let filmName: String
    let filmImage: ImageResource
    let filmAbout: String

    var body: some View {
        HStack(alignment: .top, spacing: 20) {
            // Film Image
            Image(filmImage)
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 150)
                .cornerRadius(12)
                .shadow(radius: 5)

            // Film Details
            VStack(alignment: .leading, spacing: 8) {
                Text(filmName)
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.primary)

                Text(filmAbout)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .lineLimit(5)
                    .truncationMode(.tail)
                    .multilineTextAlignment(.leading)
            }
            .padding(.vertical, 10) // Padding for better alignment
        }
        .padding(20)
        .background(Color(.systemGray6))
        .cornerRadius(12)
        .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 3)
        .padding(.horizontal)
    }
}

#Preview {
    FilmExhibit(
        filmName: "Crash",
        filmImage: .crash,
        filmAbout: "Crash is a drama that explores racial tensions in Los Angeles through a series of interconnected stories."
    )
}


