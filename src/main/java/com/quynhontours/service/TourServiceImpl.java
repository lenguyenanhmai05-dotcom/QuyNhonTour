package com.quynhontours.service;

import com.quynhontours.model.Tour;
import java.util.ArrayList;
import java.util.List;

public class TourServiceImpl implements TourService {

    @Override
    public Tour findByCode(String code) {
        return null; //TODO: truy DB
    }

    @Override
    public Tour findBySlug(String slugOrName) {
        return null;
    }

    @Override
    public List<Tour> search(String keyword, int limit) {
        return new ArrayList<>();
    }

    @Override
    public List<String> getAvailableDates(String tourCode, int limit) {
        return new ArrayList<>();
    }
}
