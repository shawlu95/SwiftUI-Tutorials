/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view showing the details for a landmark.
*/

import SwiftUI

// conforms to the View protocol and describes the view’s content and layout.
struct ContentView: View {
    var body: some View {
        VStack {
            /*
             When you specify only the height parameter, the
             view automatically sizes to the width of its
             content. In this case, MapView expands to fill
             the available space.
             */
            MapView()
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)

            // Each modifier returns a new view,
            // so it’s common to chain multiple modifiers
            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)

            VStack(alignment: .leading) {
                Text("Turtle Rock")
                    .font(.title)

                /*
                 When you apply a modifier to a layout view
                 like a stack, SwiftUI applies the modifier
                 to all the elements contained in the group.
                 */
                HStack {
                    Text("Joshua Tree National Park")
                    // A spacer expands to make its containing view use all of the space of its parent view,
                    // instead of having its size defined only by its contents
                    Spacer()
                    Text("California")
                }
                .font(.subheadline)
                .foregroundColor(.secondary)

                Divider()

                Text("About Turtle Rock")
                    .font(.title2)
                Text("Descriptive text goes here.")
            }
            .padding()

            Spacer()
        }
    }
}

// declares a preview for that view.
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
