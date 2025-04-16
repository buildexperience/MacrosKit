//
//  MacroErrorFixItMessage.swift
//
//
//  Created by Joe Maghzal on 06/05/2024.
//

import Foundation
import SwiftDiagnostics

/// A message for fix-its associated with macro errors.
public struct MacroFixItMessage: FixItMessage {
    /// The fix it messages.
    public let message: String
    
    /// The unique identifier for the fix it.
    public let fixItID: MessageID
    
    /// Creates a fix it message with the provided message and ID.
    ///
    /// - Parameters:
    ///   - message: The fix it message.
    ///   - fixItID: The unique identifier for the fix it.
    public init(message: String, fixItID: MessageID) {
        self.message = message
        self.fixItID = fixItID
    }
    
    /// Creates a fix it message with the provided message and ID.
    ///
    /// - Parameters:
    ///   - message: The fix it message.
    ///   - domain: The domain of the message.
    ///   - id: The unique identifier for the fix it.
    public init(message: String, domain: String, id: String) {
        self.message = message
        self.fixItID = MessageID(domain: domain, id: id)
    }
}
