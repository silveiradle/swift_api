//
//  MovieCardView.swift
//  NovoApp
//
//  Created by aluno06 on 18/04/24.
//

import SwiftUI

struct MovieCardView: View {
    @State var movie : Movie
    @ObservedObject var movieData = MovieData();
    
    var body: some View {
        HStack {
            Image(movie.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            
            VStack (alignment: .leading){
                Text(movie.title)
                    .font(.title3)
                    .bold()
                Text(movie.description)
                    .font(.callout)
                    .foregroundColor(Color(.gray))
                
                Spacer()
                
                HStack {
                    Image(systemName: "star")
                        .foregroundStyle(Color(.yellow))
                    Text(String(movie.rate)).swipeActions(
                        content: {
                            Button("Favorite", systemImage: "heart", action:{
                                movieData.favoritedMovies.append(movie)
                            })
                        })
                    Spacer()
                    Image(systemName: movieData.favoritedMovies.contains(where: {$0.title == movie.title}) ? "heart.fill" : "heart")
                }.tint(.red)
            }
        }
        .frame(height: 130)
    }
}
