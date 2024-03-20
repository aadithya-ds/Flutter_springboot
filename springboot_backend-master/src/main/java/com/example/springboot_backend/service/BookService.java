package com.example.springboot_backend.service;


//  logic layer

import com.example.springboot_backend.data.BookRepo;
import com.example.springboot_backend.models.Quote;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.webmvc.ResourceNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;


@Service
public class BookService {

    Logger logger = LoggerFactory.getLogger(BookService.class);

    public BookService(BookRepo quoteRepo) {
        this.quoteRepo = quoteRepo;
    }
    private BookRepo quoteRepo;

    // =====================================================
    public List<Quote> getListOfQuotes() {
        List<Quote> quotes = new ArrayList<>();
        quoteRepo.findAll().forEach(quotes::add);
        return quotes;
    }

    // =====================================================
    public void saveQuote(Quote quote) {
        quoteRepo.save(quote);
    }

    // =====================================================
    public void deleteQuote(long id) {

        if (!quoteRepo.existsById(id)) {
            throw new IllegalStateException("Quote Not Exist");
        } else {
            quoteRepo.deleteById(id);

        }
    }

    // =====================================================
    public List<Quote> getQuoteWithAuthor(@Param(value = "author") String author) {
        List<Quote> quoteList = new ArrayList<>();
        quoteList = quoteRepo.findQuotesByAuthor(author);
        logger.info(" quoteList : " + String.valueOf(quoteList.size()));
        return quoteList;
    }

    // =====================================================
    public Quote getQuote(long id) {
        return quoteRepo.findById(id).orElseThrow(() -> new ResourceNotFoundException("Quote Not Found"));
    }
    // =====================================================

}

