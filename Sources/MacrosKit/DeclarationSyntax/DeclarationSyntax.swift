//
//  DeclarationSyntax.swift
//  
//
//  Created by Joe Maghzal on 29/06/2024.
//

import SwiftSyntax

public protocol DeclarationSyntax {
    var name: TokenSyntax {get}
    var modifiers: DeclModifierListSyntax {get}
}

extension DeclarationSyntax {
    public var accessLevel: AccessLevel? {
        return modifiers.accessLevel
    }
}

