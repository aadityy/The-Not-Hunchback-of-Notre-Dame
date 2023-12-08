import SwiftUI

struct ContentView: View {
    @State var countdownTimer = 300
    @State var timerRunning = false
    
    let notify = NotificationHandler()
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    
    var body: some View {
        VStack {
            Button("Give Permission to Notify") {
                notify.askPermission()
            }
            Text("\(countdownTimer)")
            
                .padding()
                .onReceive(timer) { _ in
                    if countdownTimer > 0 && timerRunning {
                        countdownTimer -= 1
                    }
                    
            
                }
                .font(.system(size: 40, weight: .bold))
            
            HStack(spacing:30) {
                Button("Start") {
                    timerRunning = true
                    countdownTimer = 300
                    notify.sendNotification(
                        type: "time",
                        timeInterval: 300,
                        title: "Back Straight",
                        body: "chin up")
                }
                
                
                Button("Stop") {
                    countdownTimer = 0
                }.foregroundColor(.red)
                
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

