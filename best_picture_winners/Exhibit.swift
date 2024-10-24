import SwiftUI

/// A view that displays information about a film, including its name, image, and a brief description.
struct FilmExhibit: View {
    let filmName: String    // The name of the film
    let filmImage: ImageResource    // The image associated with the film
    let filmAbout: String   // A brief description or summary of the film

    var body: some View {
        HStack(alignment: .top, spacing: 20) {
            // Film Image
            Image(filmImage)
                .resizable()    // Allows the image to resize
                .scaledToFill() // Ensures the image fills its frame while maintaining aspect ratio
                .frame(width: 100, height: 150) // The size of the image
                .cornerRadius(12) // Adds rounded corners for a modern look
                .shadow(radius: 5) // Adds a shadow for depth and style

            // Film Details (Title and Description)
            VStack(alignment: .leading, spacing: 8) {
                // Film Title
                Text(filmName)
                    .font(.system(size: 24, weight: .bold)) // Bold, larger font for the title
                    .foregroundColor(.primary) // Uses the system primary text color

                // Film Description
                Text(filmAbout)
                    .font(.body) // Default body font size
                    .foregroundColor(.secondary) // Subtle secondary color for the description
                    .multilineTextAlignment(.leading) // Aligns text to the left
                    .fixedSize(horizontal: false, vertical: true) // Allows the text to grow vertically if needed
            }
            .padding(.vertical, 10) // Adds vertical padding for spacing
        }
        .padding(20) // Adds padding around the entire HStack
        .background(Color(.systemGray6)) // Light gray background for contrast
        .cornerRadius(12) // Rounds the corners of the background
        .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 3) // Adds a shadow for depth
        .padding(.horizontal) // Adds padding on the left and right to avoid edges
    }
}

#Preview {
    FilmExhibit(
        filmName: "Crash",
        filmImage: .crash,
        filmAbout: "Crash is a drama that explores racial tensions in Los Angeles through a series of interconnected stories."
    )
}

