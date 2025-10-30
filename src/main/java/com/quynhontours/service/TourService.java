package com.quynhontours.service;

import com.quynhontours.model.Tour;

import java.util.List;

public interface TourService {
    Tour findByCode(String code);
    Tour findBySlug(String slugOrName);
    List<Tour> search(String keyword, int limit);
    List<String> getAvailableDates(String tourCode, int limit);
}
