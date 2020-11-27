package com.test.carshop.repository;

import com.test.carshop.dbmodels.Car;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CarRepository extends JpaRepository<Car, Integer> {

    Car findCarsById(int id);
}
