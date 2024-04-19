//
//  SwiftUIView.swift
//  NovoApp
//
//  Created by aluno06 on 18/04/24.
//

import SwiftUI

struct MovieView: View {
    @State var movie : Movie
     
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Text(movie.title)
                    .font(.title)
                Spacer()
                Button("", systemImage: "xmark"){
                }
            }.padding(8)
                
            HStack {
                Image(movie.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                
                VStack(alignment: .leading){
                    Text(movie.title)
                        .font(.title3)
                        .bold()
                    
                    Spacer()
                    
                    HStack {
                        Image(systemName: "star")
                            .foregroundStyle(Color(.yellow))
                        Text(String(movie.rate))
                        Spacer()
                        Image(systemName: movie.favorite ? "heart.fill" : "heart")
                    }
                }
                .padding(8)
            }
            .frame(height: 300)
            .padding(8)
            
            Text("Overview")
                .font(.title2)
                .padding(8)
            
            Text(movie.description)
                .font(.callout)
                .foregroundColor(Color(.gray))
             
            Spacer()
        }.padding(8)
    }
}
