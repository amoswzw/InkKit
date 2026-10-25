import AppKit
import SwiftUI

// The memberwise initializer is internal to this module; this one covers the options apps set.

public extension RoughOptions {
    init(roughness: CGFloat = 1, bowing: CGFloat = 1, strokeWidth: CGFloat = 1, hachureGap: CGFloat = -1,
         disableMultiStroke: Bool = false, seed: Int32 = 1) {
        self.init()
        self.roughness = roughness
        self.bowing = bowing
        self.strokeWidth = strokeWidth
        self.hachureGap = hachureGap
        self.disableMultiStroke = disableMultiStroke
        self.seed = seed
    }
}

