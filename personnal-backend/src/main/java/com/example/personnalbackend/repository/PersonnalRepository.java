package com.example.personnalbackend.repository;

import com.example.personnalbackend.Entity.Personnal;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import javax.persistence.Id;

@Repository
public interface PersonnalRepository extends JpaRepository<Personnal, Long> {

}
