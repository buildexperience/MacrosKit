//
//  VariableDeclSyntax+Extensions.swift
//
//
//  Created by Joe Maghzal on 08/06/2024.
//

import SwiftSyntax

extension VariableDeclSyntax {
    /// The name of the variable from the ``VariableDeclSyntax``.
    ///
    /// - Returns: An optional ``TokenSyntax`` representing the name of the variable,
    /// or ``nil`` if the name cannot be determined.
    public var name: TokenSyntax? {
        let binding = bindings.first
        let pattern = binding?.pattern.as(IdentifierPatternSyntax.self)
        return pattern?.identifier
    }
}
