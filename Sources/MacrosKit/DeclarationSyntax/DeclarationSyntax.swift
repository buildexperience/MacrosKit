//
//  DeclarationSyntax.swift
//  
//
//  Created by Joe Maghzal on 29/06/2024.
//

import SwiftSyntax

/// Protocol representing a declaration syntax element in Swift.
public protocol DeclarationSyntax {
    /// The name of the type.
    var name: TokenSyntax {get}
    
    /// The inheritance clause of the type, if any.
    var inheritanceClause: InheritanceClauseSyntax? {get}
    
    /// The list of modifiers applied to the type.
    var modifiers: DeclModifierListSyntax {get}
}

extension DeclarationSyntax {
    /// The access level of the declaration, if specified.
    public var accessLevel: AccessLevel? {
        return modifiers.accessLevel
    }
}
