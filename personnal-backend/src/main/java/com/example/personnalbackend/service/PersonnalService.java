package com.example.personnalbackend.service;


import com.example.personnalbackend.Entity.Personnal;
import com.example.personnalbackend.repository.PersonnalRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PersonnalService {

    @Autowired
    PersonnalRepository personnalRepository;

    // add new person
    public Personnal addPerson(Personnal personnal){

        return personnalRepository.save(personnal);
    }

    // list person
    public List<Personnal> list (){
        List<Personnal> listPerson = personnalRepository.findAll();
        return listPerson;
    }

    //update person
    public String updatePerson(Long id, Personnal personnal){
        boolean existPerson = personnalRepository.existsById(id);

        if (existPerson){
            Personnal person = personnalRepository.findById(id).get();
            person.setAddress(personnal.getAddress());
            person.setFullName(personnal.getFullName());
            person.setPhoneNumber(personnal.getPhoneNumber());

            personnalRepository.saveAndFlush(person);
            return "update personnal successfuly" ;
        }

        return "please enter valid id";
    }

    //Delete
    public String delete(Long id){
        boolean existPerson = personnalRepository.existsById(id);

        if (existPerson){
            personnalRepository.deleteById(id);
        }
        return "person delete";
    }

    //get personnal
    public Personnal getPersonnal(Long id){
        Personnal personnal = new Personnal();
        boolean existPerson = personnalRepository.existsById(id);
        if(existPerson){
             personnal = personnalRepository.findById(id).get();
        }

        return personnal;
    }
}
