//
//  ContentView.swift
//  NovoApp
//
//  Created by aluno06 on 16/04/24.
//

import SwiftUI
 
struct Movie: Hashable {
    var title: String
    var description: String
    var rate: Float
    var image: String
    var favorite: Bool
    var actors: [ActorModel] = []
}

struct ActorModel: Hashable {
    var name: String
    var biography: String
}

class MovieData: ObservableObject {
    
    @Published var findedMovies: [Movie] = [];
    
    @Published var selectedMovie: Movie?
    
    @Published var movies: [Movie] = [
        Movie(
            title: "The Masked Saint",
            description:  "The journey of a professional wrestler who becomes a small town pastor",
            rate: 4.2,
            image: "MovieOne",
            favorite: false
        ),
        Movie(
            title: "Wish",
            description:  "Asha, a sharp-witted idealist, makes a wish so powerful that it is answered by a cosmic force – a little ball of boundless energy called Star. Together, Asha and Star confront a most formidable foe - the ruler of Rosas, King Magnifico",
            rate: 4.9,
            image: "MovieTwo",
            favorite: false
        ),
        Movie(
            title: "Planet Dune",
            description:  "A crew on a mission to rescue a marooned base on a desert planet turns deadly when the crew finds themselves hunted and attacked by the planet’s apex predators: giant sand worms.",
            rate: 3.1,
            image: "MovieThree",
            favorite: false
        ),
        Movie(
            title: "Law and Order",
            description:  "In cases ripped from the headlines, police investigate serious and often deadly crimes, weighing the evidence and questioning the suspects until someone is taken into custody. The district attorney's office then builds a case to convict the perpetrator by proving the person guilty beyond a reasonable doubt. ",
            rate: 4.8,
            image: "MovieFour",
            favorite: true
        ),
        Movie(
            title: "Migration",
            description:  "After a migrating duck family alights on their pond with thrilling tales of far-flung places, the Mallard family embarks on a family road trip, from New England, to New York City, to tropical Jamaica.",
            rate: 4.8,
            image: "MovieFive",
            favorite: false
        ),
        Movie(
            title: "Superman",
            description:  "Mild-mannered Clark Kent works as a reporter at the Daily Planet alongside his crush, Lois Lane. Clark must summon his superhero alter-ego when the nefarious Lex Luthor launches a plan to take over the world.",
            rate: 4.5,
            image: "MovieSix",
            favorite: false
        ),
    ];
    
    @Published var favoritedMovies: [Movie] = [];
    
    func searchMovie(name: String){
        findedMovies = movies.filter({$0.title.contains(name)})
    }
}

struct MainView: View {
    
    @ObservedObject var movieData = MovieData();
    @State var text: String = "";
    
    @State var favorite: Bool = false;
    @State var showingMovie: Bool = false;
    
    var body: some View {
        
        ScrollView{
            
            VStack(alignment: .leading ) {
                Text("Favorites")
                    .font(.title2)
                    .padding(8)
                
                if movieData.favoritedMovies == [] {
                    Text("You dont have any favorites")
                        .font(.callout)
                }else{
                    ScrollView(.horizontal) {
                        HStack{
                            ForEach(0..<movieData.favoritedMovies.count, id: \.description) { index in
                                VStack(alignment: .leading) {
                                    Image(movieData.favoritedMovies[index].image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                    Text(movieData.favoritedMovies[index].title)
                                        .font(.title3)
                                        .lineLimit(1)
                                    HStack{
                                        Image(systemName: "star")
                                            .foregroundColor(.gray)
                                        Text(String(movieData.favoritedMovies[index].rate))
                                            .foregroundColor(.gray)
                                    }
                                }.frame(width:150)
                            }
                        }
                    }.scrollIndicators(.hidden)
                }
                
                Text("Popular Movies")
                    .font(.title2)
                    .padding(8)
                
                Divider()
                
                VStack {
                    if movieData.findedMovies == [] {
                        List(movieData.movies, id: \.description){ movie in
                            MovieCardView(movie: movie, movieData: movieData)
                                
                                .onTapGesture(perform: {
                                    movieData.selectedMovie = movie
                                    showingMovie.toggle()
                                }
                                )
                        }
                    }else{
                        List(movieData.findedMovies, id: \.description){ movie in
                            MovieCardView(movie: movie, movieData: movieData)
                        }
                    }
                }.frame(height: 400)
            }.listStyle(.plain)
                .preferredColorScheme(.dark)
                .searchable(text: $text)
                .navigationTitle("Movie DB")
                .onChange(of: text) { oldText, newText in
                    movieData.searchMovie(name: newText)
                }
        }
        
        .sheet(isPresented: $showingMovie, 
               
               content: {
            if let selectedMovie = movieData.selectedMovie {
                MovieView(movie: selectedMovie)
            }
        })
    }
}

#Preview {
    
    NavigationStack{
        TabView{
            MainView()
                .tabItem{
                Label("First", systemImage: "house")
            }
        }
    }
    
}
