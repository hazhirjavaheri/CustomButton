import SwiftUI

@available(iOS 13.0, macOS 10.15, *)
public struct CustomButton: View {
    var title: String
    var subTitle: String?
    var image: Image?
    var width: CGFloat?
    var backgroundColor: Color
    var foregroundColor: Color
    var action: () -> ()
    
    public init(title: String = "ButtonTitle",
                subTitle: String? = nil,
                image: Image? = nil,
                backgroundColor: Color = .white,
                foregroundColor: Color = .black,
                action: @escaping () -> ()) {
        self.title = title
        self.subTitle = subTitle
        self.image = image
        self.action = action
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
    }

    public var body: some View {
        VStack {
            Button(action: {}) {
                HStack(alignment: .center) {
                    if let image = image {
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 64, height: 64)
                            .clipShape(Circle())
                    }
                    VStack {
                        Text(title)
                            .font(.title).bold()
                        if let sub = subTitle {
                            Text(sub)
                                .font(.system(size: 28))
                        }
                    }
                }
                .frame(minWidth: 280, maxWidth: width == nil ? 280 : width, minHeight: 70)
                .padding(10)
                .background(RoundedRectangle(cornerRadius: 15)
                    .stroke(lineWidth: 2.0)
                    .foregroundColor(foregroundColor)
                    .background(backgroundColor))
            }
        }
    }
}
