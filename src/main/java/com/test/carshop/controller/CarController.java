package com.test.carshop.controller;

import com.test.carshop.dbmodels.Car;
import com.test.carshop.services.CarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(value = "cars")
public class CarController {

    @Autowired
    private CarService carService;

    @RequestMapping(value = "list", method = RequestMethod.GET)
    public List<Car> getCars() {
        return carService.listAllCars();
    }

    @RequestMapping(value = "find", method = RequestMethod.GET, params = "carId")
    public Car findCarsByPrice(@RequestParam("carId") int carId) {
        return carService.findCarById(carId);
    }
}
