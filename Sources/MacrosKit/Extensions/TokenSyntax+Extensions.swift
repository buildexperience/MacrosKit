//
//  TokenSyntax+Extensions.swift
//
//
//  Created by Joe Maghzal on 29/06/2024.
//

import SwiftSyntax

extension TokenSyntax {
    public var lowerCasedPrefix: Self {
        return map { value in
            let prefix = value.first?.lowercased() ?? ""
            return prefix + value.dropFirst()
        }
    }
    
    public func map(_ mapper: (String) -> String) -> Self {
        let mapped = mapper(text)
        return TokenSyntax(stringLiteral: mapped)
    }
}
