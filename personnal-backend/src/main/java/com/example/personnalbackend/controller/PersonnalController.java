package com.example.personnalbackend.controller;

import com.example.personnalbackend.Entity.Personnal;
import com.example.personnalbackend.service.PersonnalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@CrossOrigin("*")
public class PersonnalController {

    @Autowired
    PersonnalService personnalService;

    //list of personnal
    @GetMapping("/all")
    public ResponseEntity findPersonnals(){
        return new ResponseEntity(personnalService.list(), HttpStatus.OK);
    }

    //add new personnal
    @PostMapping("/save")
    public ResponseEntity addPerson(@RequestBody Personnal personnal){
        return new ResponseEntity(personnalService.addPerson(personnal),  HttpStatus.OK);
    }

    //update personnal
    @PutMapping("/update/{id}")
    public ResponseEntity updatePerson(@PathVariable("id") Long id, @RequestBody Personnal personnal){
        return new ResponseEntity(personnalService.updatePerson(id,personnal),HttpStatus.OK);
    }

    //delete
    @DeleteMapping("delete/{id}")
    public ResponseEntity deletePerson(@PathVariable("id") Long id){
        return new ResponseEntity(personnalService.delete(id), HttpStatus.OK);
    }

    //find personnal by id
    @GetMapping("find/personnal/{id}")
    public ResponseEntity getPersonnal(@PathVariable("id") Long id){
        return new ResponseEntity(personnalService.getPersonnal(id), HttpStatus.OK);
    }

}
