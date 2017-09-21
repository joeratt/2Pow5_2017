// Lists the Breweries in KC, MO using http://www.brewerydb.com/ -- cerner_2^5_2017
import Foundation;import Darwin
typealias 🗿 = ProcessInfo;typealias 💻 = URLRequest;typealias 💾 = NSURL;typealias 🖥 = URL;typealias 🎻 = String;typealias 🤡 = AutoreleasingUnsafeMutablePointer;typealias 👽 = NSURLConnection;typealias 🤣 = JSONSerialization;typealias 🌮 = URLResponse;
func 🖨(📃: 🎻) { print(📃)}
// Read the API KEY from environment variables - because don't publish your keys!!
let 🗝 = 🗿.processInfo.environment["BREW_API_KEY"] ?? "" as 🎻
// Set the URL the request is being made to.
let 🌍 = 💻(url: 💾(string: "https://api.brewerydb.com/v2/locations/?region=Missouri&locality=Kansas%20City&key=\(🗝)")! as 🖥)

var names = [🎻]()
do {
    // Perform the request
    let 🙊: 🤡<🌮?>? = nil
    let 📺 = try 👽.sendSynchronousRequest(🌍, returning: 🙊)
 
    // Convert the data to JSON
    let 🏆 = try 🤣.jsonObject(with: 📺, options: []) as? [🎻 : Any]
 
    if let 📝 = 🏆{
        // Abort if the API Call failed
        let 🤒 = 📝["status"] as! 🎻;if 🤒 == "failure" {🖨(📃: "API Call failed. Check your apiKey");exit(0)}
        let 🍻 = 📝["data"] as! [[🎻 : Any]]
        for 👾 in 🍻{
            let 🍺 = 👾["brewery"] as! [🎻 : Any];let 🔐 = 👾["isClosed"]! as! 🎻;let 🏷 = 🍺["name"]! as! 🎻;let 📱 = 🍺["website"]! as! 🎻;let 📚 = 🍺["description"] ?? "" as 🎻;
             if (🔐 == "N") {
                🖨(📃: "" + 🏷 + " -- " + 📱);🖨(📃: "");print(📚);🖨(📃: "");🖨(📃: "-----------------------------------");🖨(📃: "");
             }
        }
    }
}
