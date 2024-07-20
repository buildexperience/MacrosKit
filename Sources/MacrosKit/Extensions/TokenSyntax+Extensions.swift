//
//  TokenSyntax+Extensions.swift
//
//
//  Created by Joe Maghzal on 29/06/2024.
//

import SwiftSyntax

extension TokenSyntax {
    /// Returns a new ``TokenSyntax`` with the first character
    /// of the text lowercased.
    public var lowerCasedPrefix: Self {
        return map { value in
            let prefix = value.first?.lowercased() ?? ""
            return prefix + value.dropFirst()
        }
    }
    
    /// Maps the text of the ``TokenSyntax`` to a new value using 
    /// the provided closure.
    ///
    /// - Parameter mapper: A closure that takes the current text 
    /// as a ``String`` and returns a new ``String``.
    ///
    /// - Returns: A new ``TokenSyntax`` with the mapped text.
    public func map(_ mapper: (_ value: String) -> String) -> Self {
        let mapped = mapper(text)
        return TokenSyntax(stringLiteral: mapped)
    }
}
