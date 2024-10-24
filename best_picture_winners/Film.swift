import SwiftUI

/// An enum representing the Best Picture Oscar winners from 2005 to 2023.
/// Each case in the enum corresponds to a year and holds relevant details about the film for that year.
enum Film: String, CaseIterable, Identifiable {
    
    // Enum cases for each year's best picture film (2005-2023)
    case film_2005 = "film_2005"
    case film_2006 = "film_2006"
    case film_2007 = "film_2007"
    case film_2008 = "film_2008"
    case film_2009 = "film_2009"
    case film_2010 = "film_2010"
    case film_2011 = "film_2011"
    case film_2012 = "film_2012"
    case film_2013 = "film_2013"
    case film_2014 = "film_2014"
    case film_2015 = "film_2015"
    case film_2016 = "film_2016"
    case film_2017 = "film_2017"
    case film_2018 = "film_2018"
    case film_2019 = "film_2019"
    case film_2020 = "film_2020"
    case film_2021 = "film_2021"
    case film_2022 = "film_2022"
    case film_2023 = "film_2023"
    
    /// The unique identifier for each enum case.
    var id: Film { self }
    
    /// The name of the film associated with each enum case.
    /// - Returns: A `String` representing the film's name.
    var name: String {
        switch self {
        case .film_2005: return "Crash"
        case .film_2006: return "The Departed"
        case .film_2007: return "No Country for Old Men"
        case .film_2008: return "Slumdog Millionaire"
        case .film_2009: return "The Hurt Locker"
        case .film_2010: return "The King's Speech"
        case .film_2011: return "The Artist"
        case .film_2012: return "Argo"
        case .film_2013: return "12 Years a Slave"
        case .film_2014: return "Birdman"
        case .film_2015: return "Spotlight"
        case .film_2016: return "Moonlight"
        case .film_2017: return "The Shape of Water"
        case .film_2018: return "Green Book"
        case .film_2019: return "Parasite"
        case .film_2020: return "Nomadland"
        case .film_2021: return "CODA"
        case .film_2022: return "Everything Everywhere All at Once"
        case .film_2023: return "Oppenheimer"
        }
    }
    
    /// The image resource representing the film poster or image for each film.
    /// This is a custom type, `ImageResource`, which should contain references to the image assets in the app.
    /// - Returns: An `ImageResource` representing the image for the film.
    var image: ImageResource {
        switch self {
        case .film_2005: return .crash
        case .film_2006: return .departed
        case .film_2007: return .noCountryForOldMen
        case .film_2008: return .slumdogMillionaire
        case .film_2009: return .theHurtLocker
        case .film_2010: return .theKingSSpeech
        case .film_2011: return .theArtist
        case .film_2012: return .argo
        case .film_2013: return ._12YearsASlave
        case .film_2014: return .birdman
        case .film_2015: return .spotlight
        case .film_2016: return .moonlight
        case .film_2017: return .theShapeOfWater
        case .film_2018: return .greenBook
        case .film_2019: return .parasite
        case .film_2020: return .nomadland
        case .film_2021: return .coda
        case .film_2022: return .everythingEverywhereAllAtOnce
        case .film_2023: return .oppenheimer
        }
    }

    /// A short description or synopsis of the film.
    /// - Returns: A `String` that provides a brief description of the film's plot or theme.
    var about: String {
        switch self {
        case .film_2005:
            return "Crash is a drama that explores racial tensions in Los Angeles through a series of interconnected stories."
        case .film_2006:
            return "The Departed, directed by Martin Scorsese, is a crime thriller about an undercover cop and a mole in the Massachusetts State Police."
        case .film_2007:
            return "No Country for Old Men is a Coen Brothers' crime thriller where a hunter stumbles upon a drug deal gone wrong and a violent chase ensues."
        case .film_2008:
            return "Slumdog Millionaire tells the story of a Mumbai teen who reflects on his life after being accused of cheating on a TV game show."
        case .film_2009:
            return "The Hurt Locker is a tense war drama that follows a bomb disposal team in Iraq as they face the perils of war and their own psychological struggles."
        case .film_2010:
            return "The King's Speech is a historical drama about King George VI overcoming his stutter with the help of an unorthodox speech therapist."
        case .film_2011:
            return "The Artist is a silent film about a fading silent movie star who struggles to adjust to the arrival of sound in cinema."
        case .film_2012:
            return "Argo is a thriller based on the true story of a CIA mission to rescue six Americans during the Iran hostage crisis by posing as filmmakers."
        case .film_2013:
            return "12 Years a Slave is a harrowing historical drama based on the true story of Solomon Northup, a free man kidnapped and sold into slavery."
        case .film_2014:
            return "Birdman is a dark comedy about a washed-up actor, famous for playing a superhero, trying to reinvent himself on Broadway."
        case .film_2015:
            return "Spotlight is a riveting drama about The Boston Globe's investigative team uncovering a massive child abuse scandal within the Catholic Church."
        case .film_2016:
            return "Moonlight is a coming-of-age drama that chronicles the life of a young black man grappling with his identity and sexuality."
        case .film_2017:
            return "The Shape of Water is a fantasy romance about a mute woman who forms a deep connection with a mysterious amphibious creature held in captivity."
        case .film_2018:
            return "Green Book is a road-trip drama based on the true story of a friendship between an African American pianist and his Italian American driver in the 1960s."
        case .film_2019:
            return "Parasite is a dark social satire from South Korea about a poor family who infiltrates a wealthy household with unexpected consequences."
        case .film_2020:
            return "Nomadland follows a woman who lives as a modern-day nomad in the American West after losing her home during the Great Recession."
        case .film_2021:
            return "CODA is a heartwarming drama about a hearing girl in a deaf family who discovers her passion for singing while grappling with family responsibilities."
        case .film_2022:
            return "Everything Everywhere All at Once is a mind-bending sci-fi adventure about a woman who must navigate parallel universes to save the multiverse and her family."
        case .film_2023:
            return "Oppenheimer is a dramatization of the life story of J. Robert Oppenheimer, the physicist who had a large hand in the development of the atomic bomb."
        }
    }
}
