//
//  EnumConstants.swift
//  Task5
//
//  Created by Admin on 21.11.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation


public enum CarBodyStyle: String, CaseIterable, Codable   {
	case Sedan
	case Universal
	case Coupe
	case Hatchback
}

public enum CarCountry: String, CaseIterable, Codable  {
	case Germany
	case Japan
	case Russia
	case USA
}

public enum CarModels: String, CaseIterable, Codable   {
	case Toyota
	case Mazda
	case Nissan
	case Wolkswagen
	case BMW
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
	var currentChoice: String?
	var output: CarDetailPresenter?
	var outputList: CarsListPresenter?
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
