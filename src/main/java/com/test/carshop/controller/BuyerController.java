package com.test.carshop.controller;

import com.test.carshop.dbmodels.Buyer;
import com.test.carshop.dbmodels.Car;
import com.test.carshop.services.BuyerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(value = "buyers")
public class BuyerController {

    @Autowired
    BuyerService buyerService;

    @RequestMapping(value = "list", method = RequestMethod.GET)
    public List<Buyer> getBuyers() {
        return buyerService.listBuyers();
    }

    @RequestMapping(value = "findById", method = RequestMethod.GET, params = "buyerId")
    public Buyer searchById(@RequestParam("buyerId") int buyerId) {
        return buyerService.findById(buyerId);
    }

    @RequestMapping(value = "searchByFirstName", method = RequestMethod.GET, params = "firstName")
    public List<Buyer> searchByFirstName(@RequestParam("firstName") String firstName) {
        return buyerService.findBuyersByFirstName(firstName);
    }

    @RequestMapping(value = "searchByLastName", method = RequestMethod.GET, params = "lastName")
    public List<Buyer> searchByLastName(@RequestParam("lastName") String lastName) {
        return buyerService.findBuyersByLastName(lastName);
    }

    @RequestMapping(value = "searchByLastNameEnding", method = RequestMethod.GET, params = "lastNameEnding")
    public List<Buyer> searchByEndingLastName(@RequestParam("lastNameEnding") String lastNameEnding) {
        return buyerService.findBuyersByLastNameEndingWith(lastNameEnding);
    }

    @RequestMapping(value = "buyCar", method = RequestMethod.GET, params = { "buyerId", "carId" })
    public Car buyCar(@RequestParam("buyerId") int buyerId, @RequestParam("carId") int carId) {
        return buyerService.buyCar(buyerId, carId);
    }

}
