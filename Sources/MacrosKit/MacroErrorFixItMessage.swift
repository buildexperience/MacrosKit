//
//  MacroErrorFixItMessage.swift
//
//
//  Created by Joe Maghzal on 06/05/2024.
//

import Foundation
import SwiftSyntax
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

extension Diagnostic {
    // Wraps the diagnostic in a `DiagnosticsError`.
    ///
    /// Use this computed property to convert a single `Diagnostic`
    /// into an error that can be thrown or propagated.
    public var error: DiagnosticsError {
        return DiagnosticsError(diagnostics: [self])
    }
    
    /// Returns a copy of the diagnostic with an additional fix-it suggestion.
    ///
    /// This method appends a new `FixIt` to the diagnostic’s existing fix-its.
    /// The new fix-it is created by applying the provided closure to the current diagnostic.
    ///
    /// - Parameter fixIt: A closure that takes the diagnostic as input and returns a `FixIt`.
    /// - Returns: A new `Diagnostic` instance with the added fix-it.
    public func fixIt(_ fixIt: (_ diag: Diagnostic) -> FixIt) -> Self {
        return Diagnostic(
            node: node,
            position: position,
            message: diagMessage,
            highlights: highlights,
            notes: notes,
            fixIts: fixIts + [fixIt(self)]
        )
    }
}

extension DiagnosticMessage {
    /// Creates a diagnostic at the specified syntax node.
    ///
    /// This convenience method produces a `Diagnostic` using the receiver
    /// as the diagnostic message, and attaches it to the given syntax node.
    ///
    /// - Parameter node: The syntax node at which the diagnostic should be reported.
    /// - Returns: A `Diagnostic` with this message at the given node.
    public func diagnose(at node: some SyntaxProtocol) -> Diagnostic {
        Diagnostic(node: node, message: self)
    }
}
