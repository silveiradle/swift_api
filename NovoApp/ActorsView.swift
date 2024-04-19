//
//  ActorsView.swift
//  NovoApp
//
//  Created by aluno06 on 18/04/24.
//

import SwiftUI

struct Actor: Hashable {
    var name: String
    var biography: String
    var image: String
}

class ActorsData: ObservableObject {
    
    @Published var actorList : [Actor] = [
        Actor(
            name: "Richard Dean Anderson",
              biography: "The future MacGyver (1985) and Stargate SG-1 (1997) star was born on January 23, 1950, in Minneapolis, Minnesota. His father, Stuart Anderson, was a teacher at a local high school and his mother, Jocelyn, was an artist who was talented in both sculpting and painting. He and his two younger brothers, Thomas John and James Stuart, grew up in a suburb of Minneapolis called Roseville. During his childhood and teenage years, he developed a love for sports, music (especially jazz) and acting.",
            image: "ActorOne"
        ),
        Actor(
            name: "Richard Dean Anderson",
              biography: "The future MacGyver (1985) and Stargate SG-1 (1997) star was born on January 23, 1950, in Minneapolis, Minnesota. His father, Stuart Anderson, was a teacher at a local high school and his mother, Jocelyn, was an artist who was talented in both sculpting and painting. He and his two younger brothers, Thomas John and James Stuart, grew up in a suburb of Minneapolis called Roseville. During his childhood and teenage years, he developed a love for sports, music (especially jazz) and acting.",
            image: "ActorOne"
        )
    ];
}

struct ActorsView: View {
    @ObservedObject var actorsData = ActorsData();
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Actors")
                .font(.title)
                .bold()
            HStack{
                Image("MovieOne")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                
                VStack(alignment: .leading){
                    Text("Richard Dean Anderson")
                        .font(.title3)
                    Text("The future MacGyver (1985) and Stargate SG-1 (1997) star was born on January 23, 1950, in Minneapolis, Minnesota. His father, Stuart Anderson, was a teacher at a local high school and his mother, Jocelyn, was an artist who was talented in both sculpting and painting. He and his two younger brothers, Thomas John and James Stuart, grew up in a suburb of Minneapolis called Roseville. During his childhood and teenage years, he developed a love for sports, music (especially jazz) and acting.")
                        .font(.callout)
                        .foregroundColor(.gray)
                    
                    Spacer()
                }.padding(8)
            }
            .frame(height: 100)
            .listStyle(.plain)
            
            Spacer()
        }.padding(8)
    }
}

#Preview {
    ActorsView()
}

/*
 
 List(actorsData.actorList, id: \.description) { actor in
     HStack{
         Image("MovieOne")
             .resizable()
             .aspectRatio(contentMode: .fit)
             .clipShape(RoundedRectangle(cornerRadius: 8))
         
         VStack(alignment: .leading){
             Text("Actor Name")
                 .font(.title3)
             Text("Actor some description of Lorem Ipsum")
                 .font(.callout)
                 .foregroundColor(.gray)
             
             Spacer()
         }.padding(8)
     }
     .frame(height: 100)
 }
 
 */
