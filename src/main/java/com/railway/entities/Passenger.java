package com.railway.entities;
import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import com.railway.dto.PassengerDTO;

@Entity
public class Passenger implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int passengerID;
	private String fullName;
	private String seatPreference;
	private int age;
	
	@ManyToOne(fetch = FetchType.LAZY)
    private Ticket ticketId;
	
	

	

	public Ticket getTicketId() {
		return ticketId;
	}

	public void setTicketId(Ticket ticketId) {
		this.ticketId = ticketId;
	}

	public int getPassengerID() {
		return passengerID;
	}

	public void setPassengerID(int passengerID) {
		this.passengerID = passengerID;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getSeatPreference() {
		return seatPreference;
	}

	public void setSeatPreference(String seatPreference) {
		this.seatPreference = seatPreference;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}
	public PassengerDTO convertToEntity() {
		PassengerDTO passenger=new PassengerDTO();
		passenger.setFullName(this.fullName);
		passenger.setPassengerID(this.passengerID);
		passenger.setAge(this.age);
		passenger.setSeatPreference(this.seatPreference);
		passenger.setTicketId(this.ticketId);
		return passenger;
	}
	
	

	

}
