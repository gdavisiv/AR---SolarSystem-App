//
//  ContentView.swift
//  ARSolarSystem
//
//  Created by George Davis IV on 8/2/20.
//
import SwiftUI
import SceneKit

struct ContentView: View {
    var body: some View {
        
        Home()
        //Code for creating a link
        //Link("How to add a Link", destination: URL(string: "https://www.google.com")!)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home : View {
    //Sample Data
    @State var models = [
        Model(id: 0, name: "Earth", modelName: "Earth.usdz", link: "https://en.wikipedia.org/wiki/Earth", details: "  Earth is the third planet from the Sun and the only astronomical object known to harbor life. According to radiometric dating estimation and other evidence, Earth formed over 4.5 billion years ago. Earth's gravity interacts with other objects in space, especially the Sun and the Moon, which is Earth's only natural satellite. Earth orbits around the Sun in 365.256 solar days, a period known as an Earth sidereal year.\n  During this time, Earth rotates about its axis 366.256 times, that is, a sidereal year has 366.256 sidereal days. Earth's axis of rotation is tilted with respect to its orbital plane, producing seasons on Earth. The gravitational interaction between Earth and the Moon causes tides, stabilizes Earth's orientation on its axis, and gradually slows its rotation. Earth is the densest planet in the Solar System and the largest and most massive of the four rocky planets."),
        
        Model(id: 1, name: "Jupiter", modelName: "Jupiter.usdz", link: "https://en.wikipedia.org/wiki/Earth", details: "  Jupiter is the fifth planet from the Sun and the largest in the Solar System. It is a gas giant with a mass one-thousandth that of the Sun, but two-and-a-half times that of all the other planets in the Solar System combined. Jupiter is one of the brightest objects visible to the naked eye in the night sky, and has been known to ancient civilizations since before recorded history. It is named after the Roman god Jupiter. When viewed from Earth, Jupiter can be bright enough for its reflected light to cast shadows, and is on average the third-brightest natural object in the night sky after the Moon and Venus."),
        
        Model(id: 2, name: "Moon", modelName: "Moon.usdz", link: "https://en.wikipedia.org/wiki/Earth", details: "  The Moon is an astronomical body orbiting Earth and is the planet's only natural satellite. It is the fifth-largest satellite in the Solar System, and by far[13] the largest among planetary satellites relative to the size of the planet that it orbits. The Moon is, after Jupiter's satellite Io, the second-densest satellite in the Solar System among those whose densities are known.\n  The Moon is thought to have formed about 4.51 billion years ago, not long after Earth. The most widely accepted explanation is that the Moon formed from the debris left over after a giant impact between Earth and a hypothetical Mars-sized body called Theia. New research of Moon rocks, although not rejecting the Theia hypothesis, suggests that the Moon may be older than previously thought."),
        
        Model(id: 3, name: "Asteroid", modelName: "Asteroid.usdz", link: "https://en.wikipedia.org/wiki/Earth", details: "  Asteroids are minor planets, especially of the inner Solar System. Larger asteroids have also been called planetoids. These terms have historically been applied to any astronomical object orbiting the Sun that did not resolve into a disc in a telescope and was not observed to have characteristics of an active comet such as a tail. As minor planets in the outer Solar System were discovered that were found to have volatile-rich surfaces similar to comets, these came to be distinguished from the objects found in the main asteroid belt."),
        
        Model(id: 4, name: "Saturn", modelName: "Saturn.usdz", link: "https://en.wikipedia.org/wiki/Earth", details: "  Saturn is the sixth planet from the Sun and the second-largest in the Solar System, after Jupiter. It is a gas giant with an average radius of about nine times that of Earth.  It only has one-eighth the average density of Earth; however, with its larger volume, Saturn is over 95 times more massive.  Saturn is named after the Roman god of wealth and agriculture; its astronomical symbol (♄) represents the god's sickle.\n  Saturn's interior is most likely composed of a core of iron–nickel and rock (silicon and oxygen compounds). Its core is surrounded by a deep layer of metallic hydrogen, an intermediate layer of liquid hydrogen and liquid helium, and finally a gaseous outer layer. Saturn has a pale yellow hue due to ammonia crystals in its upper atmosphere. An electrical current within the metallic hydrogen layer is thought to give rise to Saturn's planetary magnetic field, which is weaker than the Earth's, but has a magnetic moment 580 times that of Earth due to Saturn's larger size. Saturn's magnetic field strength is around one-twentieth of Jupiter's.[23] The outer atmosphere is generally bland and lacking in contrast, although long-lived features can appear. Wind speeds on Saturn can reach 1,800 km/h (1,100 mph; 500 m/s), higher than on Jupiter, but not as high as those on Neptune.[24] In January 2019, astronomers reported that a day on the planet Saturn has been determined to be 10h 33m 38s + 1m 52s − 1m 19s , based on studies of the planet's C Ring."),
        
        Model(id: 5, name: "Sun", modelName: "Sun.usdz", link: "https://en.wikipedia.org/wiki/Earth", details: "  Saturn is the sixth planet from the Sun and the second-largest in the Solar System, after Jupiter. It is a gas giant with an average radius of about nine times that of Earth.[18][19] It only has one-eighth the average density of Earth; however, with its larger volume, Saturn is over 95 times more massive.[20][21][22] Saturn is named after the Roman god of wealth and agriculture; its astronomical symbol (♄) represents the god's sickle.\n  Saturn's interior is most likely composed of a core of iron–nickel and rock (silicon and oxygen compounds). Its core is surrounded by a deep layer of metallic hydrogen, an intermediate layer of liquid hydrogen and liquid helium, and finally a gaseous outer layer. Saturn has a pale yellow hue due to ammonia crystals in its upper atmosphere. An electrical current within the metallic hydrogen layer is thought to give rise to Saturn's planetary magnetic field, which is weaker than the Earth's, but has a magnetic moment 580 times that of Earth due to Saturn's larger size. Saturn's magnetic field strength is around one-twentieth of Jupiter's.[23] The outer atmosphere is generally bland and lacking in contrast, although long-lived features can appear. Wind speeds on Saturn can reach 1,800 km/h (1,100 mph; 500 m/s), higher than on Jupiter, but not as high as those on Neptune.[24] In January 2019, astronomers reported that a day on the planet Saturn has been determined to be 10h 33m 38s + 1m 52s − 1m 19s , based on studies of the planet's C Ring.")
    ]
    @State var index = 0
    
    var body: some View {
        VStack {
            //Going to use SceneKit
            SceneView(scene: SCNScene(named: models[index].modelName), options: [.autoenablesDefaultLighting,.allowsCameraControl])
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
            Spacer(minLength: 0)
            
            ZStack{
                //Forward and Backward Buttons
                HStack{
                    Button(action: {
                        withAnimation{
                            if index > 0{
                                index -= 1
                            }
                        }
                    }, label: {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 35, weight: .bold))
                    })
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {
                        withAnimation{
                            if index < models.count{
                                index += 1
                            }
                        }
                    }, label: {
                        Image(systemName: "chevron.right")
                            .font(.system(size: 35, weight: .bold))
                            //Disable Button when no other data exist
                            .opacity(index == 0 ? 0.3 : 1)
                    })
                    .disabled(index == models.count - 1 ? true : false)
                }
                
                Text(models[index].name)
                    .font(.system(size: 40, weight: .bold))
            }
            .foregroundColor(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
            .padding(.horizontal, 25)
            .padding(.vertical, 30)
            
            VStack(alignment: .leading, spacing: nil, content: {
                Text("About")
                    .font(.title2)
                    .fontWeight(.bold)
                
                ScrollView(.vertical){
                    Text(models[index].details)
                    Spacer()
                    Link("Learn Here!", destination: URL(string: models[index].link)!)
                }

            })
            .padding(.horizontal, 20)
            
            Spacer(minLength: 0)
        }
        .preferredColorScheme(.dark)
    }
}

//Data Model

struct Model : Identifiable {
    var id : Int
    var name : String
    var modelName :  String
    var link : String
    var details : String
}
