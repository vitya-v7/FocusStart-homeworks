//
//  EnumConstants.swift
//  Task5
//
//  Created by Admin on 21.11.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation


enum CarBodyStyle: String, CaseIterable, Codable   {
	case Sedan
	case Universal
	case Coupe
	case Hatchback
}

extension CarBodyStyle {
	var index: Self.AllCases.Index? {
		return Self.allCases.firstIndex { self == $0 }
	}
}

public enum CarCountry: String, CaseIterable, Codable  {
	case Germany
	case Japan
	case Russia
	case USA
}

extension CarCountry {
	var index: Self.AllCases.Index? {
		return Self.allCases.firstIndex { self == $0 }
	}
}

public enum CarModels: String, CaseIterable, Codable   {
	case Toyota
	case Mazda
	case Nissan
	case Wolkswagen
	case BMW
}

extension CarModels {
	var index: Self.AllCases.Index? {
		return Self.allCases.firstIndex { self == $0 }
	}
}

public enum PickerType: String {
	case carModel
	case carCountry
	case carBodyStyle
	case carYear
	case carNumber
}

public struct ParametersStruct {
	var pickerType: PickerType?
	var currentChoice: Int?
	var output: PopoverOutput?
	var options: [String]?
	var moduleType: ModuleType?
}

enum ModuleType {
	case listModule
	case detailModule
}

public enum textFieldsWithTags: Int {
	case carModel = 1
	case carBodyStyle
	case carYear
	case carCountry
	case carNumber
}

public enum TypeOfParameters {
	case forPopover
	case forDetailController
}

public enum NavigationModule {
	case listModule
	case detailModule
	case popoverModule
}
