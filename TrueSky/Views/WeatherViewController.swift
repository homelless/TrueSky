//
//  WeatherViewController.swift
//  TrueSky
//
//  Created by MacBookAir on 6.08.25.
//

import UIKit

class WeatherViewController: UIViewController {
    
    var weathers = [
        
        WeatherData(icon: UIImage(named: "дождь.png")!,  temperatureNightLabel: "10°", temperatureDayLabel: "21°", probabilityRain: "99%"),
        WeatherData(icon: UIImage(named: "облачно.png")! , temperatureNightLabel: "13°", temperatureDayLabel: "25°", probabilityRain: "10%"),
        WeatherData(icon: UIImage(named: "гроза.png")!, temperatureNightLabel: "6°", temperatureDayLabel: "15°", probabilityRain: "70%"),
        WeatherData(icon: UIImage(named: "солнечно.png")!, temperatureNightLabel: "15°", temperatureDayLabel: "30°", probabilityRain: "0%"),
        WeatherData(icon: UIImage(named: "пасмурно.png")!, temperatureNightLabel: "12°", temperatureDayLabel: "16°", probabilityRain: "76%")
    ]
    
    var backgroundImageRain = UIImageView()
    var scrollView = UIScrollView()
    var contentView = UIView()
    
    private var locationLabel = UILabel()
    private var statusWeather = UILabel()
    private var temperatureLabel = UILabel()
    private var timeView = UIView()
    private var weatherView = UIView()
    private var rainStatus = UILabel()
    
    private var collectionView : UICollectionView!
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        configureCollectionView()
        setupConstraints()
    }
    
    func setupUI() {
        
        // настройка фонового изображения
        backgroundImageRain.image = UIImage(named: "rain.jpg")
        backgroundImageRain.contentMode = .scaleAspectFill
        backgroundImageRain.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundImageRain)
        view.sendSubviewToBack(backgroundImageRain)
        
        // настройка скролла и контента
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        view.addSubview(scrollView)
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        
        // настройка лейбла локации
        locationLabel.text = "Минск"
        locationLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        locationLabel.textColor = .white
        locationLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        locationLabel.layer.cornerRadius = 20
        locationLabel.layer.borderWidth = 1
        locationLabel.layer.masksToBounds = true
        locationLabel.textAlignment = .center
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(locationLabel)
        
        // настройка вью с данными о погоде
        weatherView.layer.cornerRadius = 20
        weatherView.layer.borderWidth = 1
        weatherView.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        weatherView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(weatherView)
        
        // настройка лейбла статуса погоды
        statusWeather.text = "Пасмурно."
        statusWeather.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        statusWeather.textColor = .white
        statusWeather.textAlignment = .left
        statusWeather.translatesAutoresizingMaskIntoConstraints = false
        weatherView.addSubview(statusWeather)
        
        // настройка статуса дождя
        
        rainStatus.text = "Дождь продлится еще 30 минут"
        rainStatus.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        rainStatus.textColor = .white
        rainStatus.textAlignment = .left
        rainStatus.translatesAutoresizingMaskIntoConstraints = false
        weatherView.addSubview(rainStatus)
        
        // настройка лейбла температуры
        temperatureLabel.text = "21°"
        temperatureLabel.font = UIFont.systemFont(ofSize: 56, weight: .bold)
        temperatureLabel.textColor = .white
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        weatherView.addSubview(temperatureLabel)
        
        
    }
    
    private func  configureCollectionView() {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: view.frame.width - 50 , height: 70)
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        layout.minimumLineSpacing = 12
        
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(Cells.self, forCellWithReuseIdentifier: Cells.identifier)
        contentView.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            backgroundImageRain.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageRain.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageRain.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageRain.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 1.5),
            
            locationLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 50),
            locationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            locationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            
            
            weatherView.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 30),
            weatherView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            weatherView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            weatherView.heightAnchor.constraint(equalToConstant: 150),
            
            
            statusWeather.topAnchor.constraint(equalTo: weatherView.topAnchor, constant: 30),
            statusWeather.leadingAnchor.constraint(equalTo: weatherView.leadingAnchor, constant: 20),
            
            rainStatus.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor, constant: 15),
            rainStatus.leadingAnchor.constraint(equalTo: weatherView.leadingAnchor, constant: 20),
            
            temperatureLabel.topAnchor.constraint(equalTo: weatherView.topAnchor, constant: 15),
            temperatureLabel.trailingAnchor.constraint(equalTo: weatherView.trailingAnchor, constant: -15),
            
            collectionView.topAnchor.constraint(equalTo: weatherView.bottomAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
           
        ])
    }
}

extension WeatherViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        weathers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cells.identifier, for: indexPath) as? Cells else {
            return UICollectionViewCell()
        }
        cell.layer.cornerRadius = 20
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        cell.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        
        cell.configure(with: weathers[indexPath.item])
        return cell
    }
}
