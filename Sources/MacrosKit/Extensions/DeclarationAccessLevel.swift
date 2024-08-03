//
//  DeclarationAccessLevel.swift
//
//
//  Created by Joe Maghzal on 08/06/2024.
//

import SwiftSyntax

/// The different levels of access control for code elements.
public enum AccessLevel: String, CaseIterable {
    /// Public access level.
    case `public` = "public"
    
    /// Package private access level.
    case `package` = "package"
    
    /// Internal access level.
    case `internal` = "internal"
    
    /// Private access level.
    case `private` = "private"
    
    /// Fileprivate access level.
    case `fileprivate` = "fileprivate"
    
    /// Open access level.
    case `open` = "open"
}

// MARK: - Propeties
extension AccessLevel {
    /// The name of the access level.
    ///
    /// - Returns: A ``TokenSyntax`` representing the name of the access level.
    public var name: TokenSyntax {
        return "\(raw: rawValue)"
    }
    
    /// The modifier of the access level.
    ///
    /// - Returns: A ``TokenSyntax`` representing the name of the level with a space suffix.
    public var modifier: TokenSyntax {
        return "\(name) "
    }
}

extension DeclModifierListSyntax {
    /// The first valid access level modifier from the declaration modifier list.
    ///
    /// - Returns: An optional ``AccessLevel`` representing the first access level modifier, 
    /// or ``nil`` if none found.
    public var accessLevel: AccessLevel? {
        return compactMap { modifier in
            let tokenKind = modifier.name.tokenKind
            guard case .keyword(let keyword) = tokenKind else {
                return nil
            }
            return keyword.accessLevel
            
        }.first
    }
}

extension Keyword {
    /// The corresponding ``AccessLevel``, if applicable.
    ///
    /// - Returns: An optional ``AccessLevel`` corresponding to the keyword, 
    /// or ``nil`` if the keyword does not represent an access level.
    public var accessLevel: AccessLevel? {
        switch self {
            case .public:
                return .public
            case .package:
                return .package
            case .internal:
                return .internal
            case .private:
                return .private
            case .fileprivate:
                return .fileprivate
            case .open:
                return .open
            default:
                return nil
        }
    }
}
