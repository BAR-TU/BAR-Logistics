package com.bar.BARLogistics.repositories;

import com.bar.BARLogistics.entities.Parts;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.math.BigInteger;
import java.util.Optional;

public interface PartsRepository extends JpaRepository<Parts, BigInteger> {
    @Query("SELECT p FROM Parts p WHERE lower(p.part_name) = :name")
    Optional<Parts> findPartsByPart_name(String name);
}