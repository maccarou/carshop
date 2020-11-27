package com.test.carshop.services;

import com.test.carshop.dbmodels.Car;
import com.test.carshop.repository.CarRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CarService {

    @Autowired
    private final CarRepository carRepository;

    public CarService(CarRepository carRepository) {this.carRepository = carRepository;}

    public List<Car> listAllCars() {
        return carRepository.findAll();
    }

    public Car findCarById(int carId) {
        return carRepository.findCarsById(carId);
    }
}
