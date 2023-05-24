import Vapor

func routes(_ app: Application) throws {
    app.get { req async in
        if let peerAddress = req.peerAddress {
            return """
IP: \(peerAddress.ipAddress ?? "Unknown")
"""
        } else {
            return "Unable to determine your IP address"
        }
    }

    app.get("script") { req async -> String in
        String(describing: req.peerAddress?.ipAddress ?? "?")
    }
}
