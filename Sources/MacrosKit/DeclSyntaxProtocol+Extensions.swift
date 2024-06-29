//
//  DeclSyntaxProtocol+Extensions.swift
//
//
//  Created by Joe Maghzal on 29/06/2024.
//

import SwiftSyntax

extension DeclSyntaxProtocol {
    /// The variable declaration syntax.
    ///
    /// - Returns: An optional ``VariableDeclSyntax`` representing the variable declaration,
    /// or ``nil`` if the declaration is not a variable declaration.
    public var variable: VariableDeclSyntax? {
        return self.as(VariableDeclSyntax.self)
    }
}
