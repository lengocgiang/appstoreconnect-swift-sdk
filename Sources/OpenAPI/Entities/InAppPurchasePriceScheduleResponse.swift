// Generated by Create API
// https://github.com/CreateAPI/CreateAPI
//
// swiftlint:disable all

import Foundation

public struct InAppPurchasePriceScheduleResponse: Codable {
	/// InAppPurchasePriceSchedule
	public var data: InAppPurchasePriceSchedule
	public var included: [IncludedItem]?
	public var links: DocumentLinks

	public enum IncludedItem: Codable {
		case inAppPurchaseV2(InAppPurchaseV2)
		case inAppPurchasePrice(InAppPurchasePrice)

		public init(from decoder: Decoder) throws {
			let container = try decoder.singleValueContainer()
			if let value = try? container.decode(InAppPurchaseV2.self) {
				self = .inAppPurchaseV2(value)
			} else if let value = try? container.decode(InAppPurchasePrice.self) {
				self = .inAppPurchasePrice(value)
			} else {
				throw DecodingError.dataCorruptedError(in: container, debugDescription: "Failed to intialize `oneOf`")
			}
		}

		public func encode(to encoder: Encoder) throws {
			var container = encoder.singleValueContainer()
			switch self {
			case .inAppPurchaseV2(let value): try container.encode(value)
			case .inAppPurchasePrice(let value): try container.encode(value)
			}
		}
	}

	public init(data: InAppPurchasePriceSchedule, included: [IncludedItem]? = nil, links: DocumentLinks) {
		self.data = data
		self.included = included
		self.links = links
	}

	public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: StringCodingKey.self)
		self.data = try values.decode(InAppPurchasePriceSchedule.self, forKey: "data")
		self.included = try values.decodeIfPresent([IncludedItem].self, forKey: "included")
		self.links = try values.decode(DocumentLinks.self, forKey: "links")
	}

	public func encode(to encoder: Encoder) throws {
		var values = encoder.container(keyedBy: StringCodingKey.self)
		try values.encode(data, forKey: "data")
		try values.encodeIfPresent(included, forKey: "included")
		try values.encode(links, forKey: "links")
	}
}
