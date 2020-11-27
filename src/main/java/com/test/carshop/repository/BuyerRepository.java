package com.test.carshop.repository;

import com.test.carshop.dbmodels.Buyer;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BuyerRepository extends JpaRepository<Buyer, Integer> {

    Buyer findById(int buyerId);

    List<Buyer> findBuyersByFirstName(String firstName);

    List<Buyer> findBuyersByLastName(String lastName);

    List<Buyer> findBuyersByLastNameEndingWith(String lastNameEndingWith);
}
