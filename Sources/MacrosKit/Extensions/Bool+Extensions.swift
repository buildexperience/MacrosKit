//
//  Bool+Extensions.swift
//
//
//  Created by Joe Maghzal on 15/07/2024.
//

import SwiftSyntax

extension Bool {
    public var macroExpression: TokenSyntax {
        return "\(raw: self)"
    }
}
