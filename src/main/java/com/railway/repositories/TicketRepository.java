package com.railway.repositories;



import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.railway.entities.Ticket;


@Repository
public interface TicketRepository extends JpaRepository<Ticket,Integer> {

}
