package com.test.carshop.services;

import com.test.carshop.dbmodels.Buyer;
import com.test.carshop.dbmodels.Car;
import com.test.carshop.repository.BuyerRepository;
import com.test.carshop.repository.CarRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BuyerService {

    private final BuyerRepository buyerRepository;
    private final CarRepository carRepository;

    public BuyerService(BuyerRepository buyerRepository, CarRepository carRepository) {
        this.buyerRepository = buyerRepository;
        this.carRepository = carRepository;
    }

    public List<Buyer> listBuyers() {
        return buyerRepository.findAll();
    }

    public Buyer findById(int buyerId) {
        return buyerRepository.findById(buyerId);
    }

    public List<Buyer> findBuyersByFirstName(String firstName) {
        return buyerRepository.findBuyersByFirstName(firstName);
    }

    public List<Buyer> findBuyersByLastName(String lastName) {
        return buyerRepository.findBuyersByLastName(lastName);
    }

    public List<Buyer> findBuyersByLastNameEndingWith(String lastNameEnding) {
        return buyerRepository.findBuyersByLastNameEndingWith(lastNameEnding);
    }

    public Car buyCar(int buyerId, int carId) {
        Buyer buyer = buyerRepository.findById(buyerId);
        Car car = carRepository.findCarsById(carId);
        buyer.addCar(car);
        buyerRepository.save(buyer);

        return car;
    }

}
