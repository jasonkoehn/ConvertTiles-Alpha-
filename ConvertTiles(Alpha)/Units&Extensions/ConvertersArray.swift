//
//  ConvertersArray.swift
//  ConvertTiles(Alpha)
//
//  Created by Jason Koehn on 12/13/22.
//

import Foundation

struct Converter: Codable {
    var name: String
    var id: UUID
    var group: String
    var unitAmount: String
    var units: [String]
    var inUnit: String
    var outUnit: String
}

struct ConverterList: Codable {
    var group: String
    var units: [String]
}

var convertersList: [ConverterList] = [
    ConverterList(group: "Acceleration", units: ["Meters Per Second Squared", "Gravity"]),
    ConverterList(group: "Angle", units: ["Degrees", "Arc Minutes", "Arc Seconds", "Radians", "Gradians", "Revolutions"]),
    ConverterList(group: "Area", units: ["Square Megameters", "Square Kilometers", "Square Meters", "Square Centimeters", "Square Millimeters", "Square Micrometers", "Square Nanometers", "Square Inches", "Square Feet", "Square Yards", "Square Miles", "Acres", "Ares", "Hectares"]),
    ConverterList(group: "Concentration Mass", units: ["Grams Per Liter", "Milligrams Per Deciliter"]),
    ConverterList(group: "Duration", units: ["Seconds", "Minutes", "Hours"]),
    ConverterList(group: "Electric Charge", units: ["Coulombs", "Megaampere Hours", "Kiloampere Hours", "Ampere Hours", "Milliampere Hours", "Microampere Hours"]),
    ConverterList(group: "Electric Current", units: ["Megaamperes", "Kiloamperes", "Amperes", "Milliamperes", "Microamperes"]),
    ConverterList(group: "Electric Potential Difference", units: ["Megavolts", "Kilovolts", "Volts", "Millivolts", "Microvolts"]),
    ConverterList(group: "Electric Resistance", units: ["Megaohms", "Kiloohms", "Ohms", "Milliohms", "Microohms"]),
    ConverterList(group: "Energy", units: ["Kilojoules", "Joules", "Kilocalories", "Calories", "Kilowatt Hours"]),
    ConverterList(group: "Frequency", units: ["Terahertz", "Gigahertz", "Megahertz", "Kilohertz", "Hertz", "Millihertz", "Microhertz", "Nanohertz"]),
    ConverterList(group: "Fuel Efficiency", units: ["Liters Per 100 Kilometers", "Miles Per Gallon", "Miles Per Imperial Gallon"]),
    ConverterList(group: "Information Storage", units: ["Bits", "Kilobits", "Megabits", "Gigabits", "Terabits", "Petabits", "Exabits", "Zettabits", "Yottabits", "Bytes", "Kilobytes", "Megabytes", "Gigabytes", "Terabytes", "Petabytes", "Exabytes", "Zettabytes", "Yottabytes"]),
    ConverterList(group: "Length", units: ["Megameters", "Kilometers", "Hectometers", "Decameters", "Meters", "Decimeters", "Centimeters", "Millimeters", "Micrometers", "Nanometers", "Picometers", "Inches", "Feet", "Yards", "Miles", "Scandinavian Miles", "Light Years", "Nautical Miles", "Fathoms", "Furlongs", "Astronomical Units", "Parsecs"]),
    ConverterList(group: "Mass", units: ["Kilograms", "Grams", "Decigrams", "Centigrams", "Milligrams", "Micrograms", "Nanograms", "Picograms", "Ounces", "Pounds", "Stones", "MetricTons", "ShortTons", "Carats", "OuncesTroy", "Slugs"]),
    ConverterList(group: "Power", units: ["Terawatts", "Gigawatts", "Megawatts", "Kilowatts", "Watts", "Milliwatts", "Microwatts", "Nanowatts", "Picowatts", "Femtowatts", "Horsepower"]),
    ConverterList(group: "Pressure", units: ["Newtons Per Meter Squared", "Gigapascals", "Megapascals", "Kilopascals", "Hectopascals", "Inches of Mercury", "Bars", "Millibars", "Millimeters of Mercury", "Pounds Per Square Inch"]),
    ConverterList(group: "Speed", units: ["Meters Per Second", "Kilometers Per Hour", "Miles Per Hour", "Knots"]),
    ConverterList(group: "Temperature", units: ["Kelvin", "Celsius", "Fahrenheit"]),
    ConverterList(group: "Volume", units: ["Megaliters", "Kiloliters", "Liters", "Deciliters", "Centiliters", "Milliliters", "Cubic Kilometers", "Cubic Meters", "Cubic Decimeters", "Cubic Millimeters", "Cubic Inches", "Cubic Feet", "Cubic Yards", "Cubic Miles", "Acre Feet", "Bushels", "Teaspoons", "Tablespoons", "Fluid Ounces", "Cups", "Pints", "Quarts", "Gallons", "Imperial Teaspoons", "Imperial Tablespoons", "Imperial Fluid Ounces", "Imperial Pints", "Imperial Quarts", "Imperial Gallons", "Metric Cups"])
]
