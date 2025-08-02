//
//  CustomSheetManager.swift
//  RegisterAppSwitUI
//
//  Created by Mohamed Ali on 31/07/2025.
//

import SwiftUI
import FittedSheets
import FittedSheetsSwiftUI

class CustomSheetManager: ObservableObject {
    @Published var isPresented: Bool = false
    @Published var content: AnyView = AnyView(EmptyView())
    private(set) var configuration: SheetConfiguration = SheetConfiguration()

    func present<Content: View>(
        @ViewBuilder content: @escaping () -> Content,
        sheetSize: SheetSize = .fixed(260),
        useFullScreenMode: Bool = false,
        cornerCurve: CALayerCornerCurve = .circular,
        cornerRadius: CGFloat = 20,
        minimumSpaceAbovePullBar: CGFloat = 0,
        dismissOnOverlayTap: Bool = true,
        allowPullingPastMaxHeight: Bool = false,
        allowPullingPastMinHeight: Bool = true
    ) {
        self.configuration = SheetConfiguration(
            sizes: [sheetSize],
            options: SheetOptions(useFullScreenMode: useFullScreenMode),
            sheetViewControllerOptinos: [
                .cornerCurve(cornerCurve),
                .cornerRadius(cornerRadius),
                .minimumSpaceAbovePullBar(minimumSpaceAbovePullBar),
                .dismissOnOverlayTap(dismissOnOverlayTap),
                .allowPullingPastMaxHeight(allowPullingPastMaxHeight),
                .dismissOnPull(allowPullingPastMinHeight),
                .gripSize(.zero),
                .minimumSpaceAbovePullBar(0)
            ]
        )

        self.content = AnyView(content())
        self.isPresented = true
    }

    func dismiss() {
        isPresented = false
    }
}
