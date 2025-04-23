// # Progress Circle
import SwiftUI

struct ContentView: View {
    @State var degrees: Double = 0
    @State var progres: CGFloat = 0
    @State var numberProgress = 0
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 15)
                .frame(width: 150, height: 150)
                .foregroundStyle(.gray.opacity(0.3))
            Circle().trim(from: 0, to: progres)
                .stroke(
                    style: StrokeStyle(
                        lineWidth: 18, lineCap: .round, lineJoin: .round)
                )
                .frame(width: 150, height: 150)
                .foregroundStyle(
                    LinearGradient(
                        gradient: Gradient(colors: [.cyan, .blue]),
                        startPoint: .top, endPoint: .bottom)
                )
                .rotationEffect(.degrees(-90))
                .rotationEffect(.degrees(degrees))
            HStack(alignment: .bottom, spacing: 0) {
                Text("\(numberProgress)")
                    .font(.largeTitle)
                Text("%")
                    .padding(.bottom, 5)
            }
            .bold()
        }
        .onTapGesture {
            withAnimation(.easeInOut(duration: 3)) {
                progres = 1
                degrees += 360
            }
            Timer.scheduledTimer(
                withTimeInterval: 0.03, repeats: true,
                block: { timer in
                    if numberProgress < 100 {
                        numberProgress += 1
                    } else {
                        timer.invalidate()
                    }
                }
            )
        }
    }
}
