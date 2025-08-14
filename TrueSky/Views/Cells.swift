//
//  Cells.swift
//  TrueSky
//
//  Created by MacBookAir on 6.08.25.
//
import UIKit
import Foundation

class Cells : UICollectionViewCell {
    
    var icon = UIImage()
    var imageView = UIImageView()
    var temperatureNightLabel = UILabel()
    var temperatureDayLabel = UILabel()
    var date = Date()
    var dateLabelMonth = UILabel()
    var nightLabel = UILabel()
    var dayLabel = UILabel()
    var statusWeatherLabel = UILabel()
    var rainLabel = UILabel()
    var probabilityRainIcon = UILabel()
    var dateLabelWeekDay = UILabel()
    static let identifier = "Cells"
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupUI() {
        
        backgroundColor = UIColor.black.withAlphaComponent(0.6)
        
        
        imageView.image = icon
        
        temperatureNightLabel.text = "10"
        temperatureNightLabel.font = .systemFont(ofSize: 15, weight: .bold)
        temperatureNightLabel.textColor = .white
        
        temperatureDayLabel.text = "21"
        temperatureDayLabel.font = .systemFont(ofSize: 15, weight: .bold)
        temperatureDayLabel.textColor = .white
        
        dateLabelMonth.font = .systemFont(ofSize: 15, weight: .bold)
        dateLabelMonth.textColor = .white
        
        dateLabelWeekDay.font = .systemFont(ofSize: 15, weight: .bold)
        dateLabelWeekDay.textColor = .white
        
        nightLabel.text = "Ночь"
        nightLabel.font = .systemFont(ofSize: 15, weight: .bold)
        nightLabel.textColor = .white
        
        dayLabel.text = "День"
        dayLabel.font = .systemFont(ofSize: 15, weight: .bold)
        dayLabel.textColor = .white
        
        statusWeatherLabel.textColor = .white
        statusWeatherLabel.font = .systemFont(ofSize: 15, weight: .bold)
        
        rainLabel.text = "☔️"
        
        probabilityRainIcon.font = .systemFont(ofSize: 15, weight: .bold)
        probabilityRainIcon.textColor = .white
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        temperatureNightLabel.translatesAutoresizingMaskIntoConstraints = false
        temperatureDayLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabelMonth.translatesAutoresizingMaskIntoConstraints = false
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        nightLabel.translatesAutoresizingMaskIntoConstraints = false
        statusWeatherLabel.translatesAutoresizingMaskIntoConstraints = false
        rainLabel.translatesAutoresizingMaskIntoConstraints = false
        probabilityRainIcon.translatesAutoresizingMaskIntoConstraints = false
        dateLabelWeekDay.translatesAutoresizingMaskIntoConstraints = false
        
        
        contentView.addSubview(imageView)
        contentView.addSubview(temperatureNightLabel)
        contentView.addSubview(temperatureDayLabel)
        contentView.addSubview(dateLabelMonth)
        contentView.addSubview(dayLabel)
        contentView.addSubview(nightLabel)
        contentView.addSubview(statusWeatherLabel)
        contentView.addSubview(probabilityRainIcon)
        contentView.addSubview(rainLabel)
        contentView.addSubview(dateLabelWeekDay)
        
        
        NSLayoutConstraint.activate([
            
            dateLabelMonth.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            dateLabelMonth.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -10),
            
            dateLabelWeekDay.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            dateLabelWeekDay.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 10),
            
            
            
            rainLabel.trailingAnchor.constraint(equalTo: dayLabel.leadingAnchor, constant: -25),
            rainLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -18),
            
            
            
            probabilityRainIcon.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -125),
            probabilityRainIcon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 5),
            
            imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -20),
            imageView.heightAnchor.constraint(equalToConstant: 45),
            imageView.widthAnchor.constraint(equalToConstant: 45),
            
            
            
            temperatureNightLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            temperatureNightLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 5),
            
            nightLabel.bottomAnchor.constraint(equalTo: temperatureNightLabel.topAnchor, constant: -8),
            nightLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            
            temperatureDayLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -75),
            temperatureDayLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 5),
            
            
            dayLabel.bottomAnchor.constraint(equalTo: temperatureDayLabel.topAnchor, constant: -8),
            dayLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -70),
            
        ])
    }
    
    private func formatDateMonth(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMMM"
        formatter.locale = Locale(identifier: "ru_RU")
        return formatter.string(from: date)
    }
    
    private func formatDateWeekDay(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        formatter.locale = Locale(identifier: "ru_RU")
        return formatter.string(from: date)
    }
    
    func configure(with weather: WeatherData) {
        imageView.image  = weather.icon
        temperatureDayLabel.text  = weather.temperatureDayLabel
        temperatureNightLabel.text  = weather.temperatureNightLabel
        probabilityRainIcon.text = weather.probabilityRain
        dateLabelMonth.text = formatDateMonth(Date.now)
        dateLabelWeekDay.text = formatDateWeekDay(Date.now)
    }
}


